`timescale 1ns / 1ps



module TOP_led_light(
    input i_clk,
    input i_reset,
    input [1:0]i_button,
    
    output [1:0] o_light

    );

    wire [1:0]w_button;



    ButtonController ButtonController1(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[0]),
        .o_button(w_button[0])
    );

    ButtonController ButtonController2(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(i_button[1]),
        .o_button(w_button[1])

    );

    

    FSM_Light FSM(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .i_button(w_button),
        .o_light(o_light)

    );
endmodule
