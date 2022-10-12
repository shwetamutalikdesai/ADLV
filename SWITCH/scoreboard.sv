class scoreboard;
int no_transactions;
mailbox mon2scb;
function display(mailbox mon2scb);
this.mon2scb=mon2scb;
endfunction;
task main();
forever begin
trans.get(mon2scb);
  if((trans.addr_a != trans.addr|trans.data_a != trans.data_a)
$display("result is correct");
else
$display("result is not correct");
end
trans.display(["SCOREBOARD"]);
no_transactions++;
endtask
endclass
