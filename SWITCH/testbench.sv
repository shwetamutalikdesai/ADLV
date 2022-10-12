// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"
module tbench_top;
 
  bit clk;
  bit rstn;

  always#5 clk=~clk;
  
  initial begin
    rstn=1;
    #5 rstn=0;
  end
 
  intf i_intf(clk,rstn);
 
  test t1(i_intf);

  switch DUT(
    .clk(i_intf.clk),
    .rstn(i_intf.rstn),
    .addr(i_intf.addr),
    .data(i_intf.data),
    .vld(i_intf.vld),
    .addr_a(i_intf.addr_a),
    .data_a(i_intf.data_a),
    .addr_b(i_intf.addr_b),
    .data_b(i_intf.data_b),
  );
endmodule
 
