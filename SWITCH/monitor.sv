class monitor;
virtual intf vif;
mailbox mon2scb;
function new(virtual intf vif,mailbox mon2scb);
this.vif=vif;
this.mon2scb=mon2scb;
endfunction
task main();
forever begin
transaction trans;
  transaction new();  
@(posedge vif.clk);
wait(vld.vif);

trans.addr=vif.addr;
trans.data=vif.data;
@(posedge vif.clk);
trans.addr_a=vif.addr_a;
trans.data_a=vif.data_a;
trans.addr_b=vif.addr_b;
trans.data_b=vif.data_b;
@(posedge vif.clk);
trans.put(mon2scb);
trans.display(["MONITOR"]);
end
endtask
endclass
