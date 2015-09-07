module srec_parser
(
    input             clock,
    input             reset_n,

    input      [ 7:0] char_data,
    input             char_ready,

    output reg        error,
    output reg [ 7:0] error_location,

    output     [31:0] write_address,
    output     [ 7:0] write_byte,
    output            write_enable
);

    localparam [4:0]
        WAITING_S          = 5'd0,
        GET_TYPE           = 5'd1,
        GET_COUNT_7_4      = 5'd2,
        GET_COUNT_3_0      = 5'd3,
        GET_ADDRESS_31_28  = 5'd4,
        GET_ADDRESS_27_24  = 5'd5,
        GET_ADDRESS_23_20  = 5'd6,
        GET_ADDRESS_19_16  = 5'd7,
        GET_ADDRESS_15_12  = 5'd8,
        GET_ADDRESS_11_08  = 5'd9,
        GET_ADDRESS_07_04  = 5'd10,
        GET_ADDRESS_03_00  = 5'd11,
        GET_BYTE_7_4       = 5'd12,
        GET_BYTE_3_0       = 5'd13,
        CHECK_SUM_7_4      = 5'd14,
        CHECK_SUM_3_0      = 5'd15,
        CR                 = 5'd16,
        LF                 = 5'd17
        ;

    localparam [7:0]
        CHAR_LF = 8'h0A,
        CHAR_CR = 8'h0D,
        CHAR_0  = 8'h30,
        CHAR_3  = 8'h33,
        CHAR_9  = 8'h39,
        CHAR_A  = 8'h41,
        CHAR_F  = 8'h46,
        CHAR_S  = 8'h53
        ;

    reg  [3:0] nibble;
    reg  [7:0] nibble_error;

    always @*
    begin
       nibble       = 0;
       nibble_error = 0;

       if (char_data >= CHAR_0 && char_data <= CHAR_9)
           nibble = char_data - CHAR_0;
       else if (char_data >= CHAR_A && char_data <= CHAR_F)
           nibble = char_data - CHAR_A;
       else
           nibble_error = 1;
    end

    reg [ 4:0] state     , reg_state     ; 
    reg [ 7:0] rec_type  , reg_rec_type  ;
    reg [ 7:0] count     , reg_count     ;
    reg [31:0] address   , reg_address   ;
    reg [ 7:0] byte_data , reg_byte_data ;
    reg        write     , reg_write     ;

    assign write_address  = reg_address;
    assign write_byte     = reg_byte_data;
    assign write_enable   = reg_write;

    always @*
    begin
        state     = reg_state     ; 
        rec_type  = reg_rec_type  ;
        count     = reg_count     ;
        address   = reg_address   ;
        byte_data = reg_byte_data ;
        write     = 0             ;

        if (char_ready)
        begin
            state = reg_state + 1; 

            case (reg_state)

            WAITING_S:
                ;

            GET_TYPE:

                rec_type = char_data;

            GET_COUNT_7_4, GET_COUNT_3_0:

                count = (count << 4) | nibble;

            GET_ADDRESS_31_28 , GET_ADDRESS_27_24,
            GET_ADDRESS_23_20 , GET_ADDRESS_19_16,
            GET_ADDRESS_15_12 , GET_ADDRESS_11_08,
            GET_ADDRESS_07_04 :

                address = (address << 4) | nibble;

            GET_ADDRESS_03_00:
            begin
                address = ((address << 4) | nibble) - 1;

                if (count == 5)
                    state = CHECK_SUM_7_4;
            end

            GET_BYTE_7_4:

                byte_data [7:4] = nibble;

            GET_BYTE_3_0:
            begin
                address = address + 1;
                byte_data [3:0] = nibble;

                if (rec_type == CHAR_3)
                    write = 1;

                count = count - 8'd1;

                if (count > 5)
                    state = GET_BYTE_7_4;
            end

            CHECK_SUM_7_4, CHECK_SUM_3_0:
                ;

            CR:
                ;

            LF:
                state = WAITING_S;

            endcase
        end
    end

    always @(posedge clock)
    begin
        reg_rec_type  <= rec_type;
        reg_count     <= count;
        reg_address   <= address;
        reg_byte_data <= byte_data;
    end

    always @(posedge clock or negedge reset_n)
    begin
        if (! reset_n)
        begin
            reg_state <= WAITING_S; 
            reg_write <= 0;
        end
        else
        begin
            reg_state <= state; 
            reg_write <= write;
        end
    end

    always @(posedge clock or negedge reset_n)
    begin
        if (! reset_n)
        begin
            error <= 0;
        end
        else if (char_ready && ! error)
        begin
            case (reg_state)
            WAITING_S:  if ( char_data != CHAR_S  ) error <= 1;

            CR:         if ( char_data != CHAR_CR ) error <= 1;

            LF:         if ( char_data != CHAR_LF ) error <= 1;

            default:    if ( nibble_error         ) error <= 1;
            endcase
        end
    end

    always @(posedge clock or negedge reset_n)
    begin
        if (! reset_n)
            error_location <= -1;
        else if (char_ready)
            error_location <= error_location + 1;
    end

endmodule