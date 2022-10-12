class transaction;
  rand bit [7:0]  	addr;
  rand bit [15:0] 	data;
  bit [7:0] 		addr_a;
  bit [15:0] 		data_a;
  bit [7:0] 		addr_b;
  bit [15:0] 		data_b;

    
  function void display (string name);
    $display ("------------------");
    $display("- %s", name);
 $display ("------------------");
 $display ("- addr=%0d, data=%0d",addr,data);
$display("- addr_a=%0d, data_a=%0d, addr_b=%0d, data_b=%0d", addr_a,data_a,addr_b,data_b);
 $display ("------------------");
endfunction
endclass
