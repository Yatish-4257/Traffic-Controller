`timescale 1ms / 1ps
module Traffic_Light_Controller_TB;
reg clk,rst;
wire [2:0]light_M1;
wire [2:0]light_S;
wire [2:0]light_MT;
wire [2:0]light_M2;
wire [3:0] count;
wire [2:0]ps;
Traffic_Light_Controller dut(.clk(clk) , .rst(rst) , .light_M1(light_M1) , .light_S(light_S)  ,.light_M2(light_M2),.light_MT(light_MT)  );
initial
begin
    clk=1'b0;
    forever #(100/2) clk=~clk;
end

initial
begin
    #10
    rst=1;
    #10;
    rst=0;
    #(100*200);
    $finish;
end
initial
begin
    $monitor($time," present state: %d ; m1: %b ; m2: %b ; mt: %b ; s: %b ",dut.ps,dut.light_M1,dut.light_M2,dut.light_MT,dut.light_S);
end
endmodule
