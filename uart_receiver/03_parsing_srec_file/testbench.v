module testbench;

    reg         clock;
    reg         reset_n;

    reg  [ 7:0] char_data;
    reg         char_ready;
    
    wire        format_error;
    wire        checksum_error;
    wire [ 7:0] error_location;

    wire [31:0] write_address;
    wire [ 7:0] write_byte;
    wire        write_enable;

    srec_parser srec_parser
    (
        clock,
        reset_n,

        char_data,
        char_ready,

        format_error,
        checksum_error,
        error_location,

        write_address,
        write_byte,
        write_enable
    );

    initial
    begin
        clock = 0;

        forever
            # 50 clock = ! clock;
    end

    event is_reset;

    initial
    begin
        reset_n <= 1;
        repeat (5) @ (posedge clock);
        reset_n <= 0;
        repeat (5) @ (posedge clock);
        reset_n <= 1;

        -> is_reset;
    end

    integer file, c;

    initial
    begin
        $dumpvars;

        @ (is_reset)

        file = $fopen ("test.rec", "r");

        if (file == 0)
        begin
            $display ("Cannot open test file");
            $finish;
        end

        c = $fgetc (file);

        while (c >= 0)
        begin
            @ (posedge clock);
            char_data  <= c;
            char_ready <= 1;

            @ (posedge clock);
            char_ready <= 0;

            c = $fgetc (file);
        end

        $display;
        $finish;
    end

    reg [31:0] prev_write_address;

    always @ (posedge clock)
        if (write_enable)
        begin
            if (   write_address != prev_write_address + 1
                || write_address [3:0] == 0 )
            begin
                $write ("\nWRITE : %h", write_address);
            end

            $write (" %h", write_byte);

            prev_write_address = write_address;
        end

    always @ (posedge clock)
        if (format_error)
            $display ("ERROR : FORMAT : %h", error_location);
        else if (checksum_error)
            $display ("ERROR : CHECKSUM : %h", error_location);

endmodule
