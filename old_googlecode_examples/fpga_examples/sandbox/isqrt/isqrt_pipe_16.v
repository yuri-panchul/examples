module isqrt_pipe_16
(
    input         clock,
    input         reset_n,
    input         run,
    input  [31:0] x,
    output        ready,
    output [15:0] y
);

    localparam [31:0] m = 32'h4000_0000;

    wire [31:0] wx [0:16], wy [0:16];
    wire wr [0:16];

    assign wr [0] = run;
    assign wx [0] = x;
    assign wy [0] = 0;

    assign ready = wr [16];
    assign y     = wy [16];

    isqrt_slice_reg #(m >>  0 * 2) i00 (clock, reset_n, wr [ 0], wx [ 0], wy [ 0], wr [ 1], wx [ 1], wy [ 1]);
    isqrt_slice_reg #(m >>  1 * 2) i01 (clock, reset_n, wr [ 1], wx [ 1], wy [ 1], wr [ 2], wx [ 2], wy [ 2]);
    isqrt_slice_reg #(m >>  2 * 2) i02 (clock, reset_n, wr [ 2], wx [ 2], wy [ 2], wr [ 3], wx [ 3], wy [ 3]);
    isqrt_slice_reg #(m >>  3 * 2) i03 (clock, reset_n, wr [ 3], wx [ 3], wy [ 3], wr [ 4], wx [ 4], wy [ 4]);
    isqrt_slice_reg #(m >>  4 * 2) i04 (clock, reset_n, wr [ 4], wx [ 4], wy [ 4], wr [ 5], wx [ 5], wy [ 5]);
    isqrt_slice_reg #(m >>  5 * 2) i05 (clock, reset_n, wr [ 5], wx [ 5], wy [ 5], wr [ 6], wx [ 6], wy [ 6]);
    isqrt_slice_reg #(m >>  6 * 2) i06 (clock, reset_n, wr [ 6], wx [ 6], wy [ 6], wr [ 7], wx [ 7], wy [ 7]);
    isqrt_slice_reg #(m >>  7 * 2) i07 (clock, reset_n, wr [ 7], wx [ 7], wy [ 7], wr [ 8], wx [ 8], wy [ 8]);
    isqrt_slice_reg #(m >>  8 * 2) i08 (clock, reset_n, wr [ 8], wx [ 8], wy [ 8], wr [ 9], wx [ 9], wy [ 9]);
    isqrt_slice_reg #(m >>  9 * 2) i09 (clock, reset_n, wr [ 9], wx [ 9], wy [ 9], wr [10], wx [10], wy [10]);
    isqrt_slice_reg #(m >> 10 * 2) i10 (clock, reset_n, wr [10], wx [10], wy [10], wr [11], wx [11], wy [11]);
    isqrt_slice_reg #(m >> 11 * 2) i11 (clock, reset_n, wr [11], wx [11], wy [11], wr [12], wx [12], wy [12]);
    isqrt_slice_reg #(m >> 12 * 2) i12 (clock, reset_n, wr [12], wx [12], wy [12], wr [13], wx [13], wy [13]);
    isqrt_slice_reg #(m >> 13 * 2) i13 (clock, reset_n, wr [13], wx [13], wy [13], wr [14], wx [14], wy [14]);
    isqrt_slice_reg #(m >> 14 * 2) i14 (clock, reset_n, wr [14], wx [14], wy [14], wr [15], wx [15], wy [15]);
    isqrt_slice_reg #(m >> 15 * 2) i15 (clock, reset_n, wr [15], wx [15], wy [15], wr [16], wx [16], wy [16]);

endmodule
