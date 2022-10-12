class driver;
int no_transactions;
virtual intf vif;
mailbox gen2driv;
function new(virtual intf vif,mailbox gen2driv);
this.vif=vif;
this.gen2driv=gen2driv;
endfunction
task reset;
  wait(vif.rstn);
$display("------reset started-------");
vif.addr<=0;
vif.data<=0;

vif.vld<=0;
  wait(!vif.rstn);
$display("-----reset ended--------");
endtask

  task main();
forever begin
transaction trans;
  gen2driv.get(trans);
@(posedge vif.clk);
vif.addr<=trans.addr;
vif.data<=trans.data;
vif.addr<=1;
vif.data<=1;
@(posedge vif.clk);
trans.addr_a<=vif.addr_a;
trans.data_a<=vif.data_a;
trans.addr_b<=vif.addr_b;
trans.data_b<=vif.data_b;
@(posedge vif.clk);
trans.display(["DRIVER"]);
no_transactions++;
end
endtask
endclass

