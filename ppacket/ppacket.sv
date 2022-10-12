class ppacket;
  rand bit[3:0]addr;
  rand bit[3:0]start_addr;
  rand bit[3:0]end_addr;
  
  constraintaddr_1_range{addr inside{[start_addr:end_addr]};}
  //constraintaddr_range{addrinside{[5:0]};}
  //constraintaddr_range{addrinside{1,3,5,7,9};}
  //constraintaddr_range{addrinside{1,3,[5:10],12,[13:15]};}
  //constraintaddr_range{addr!(inside{[5:0]});}
endclass


module constr_inside;
  initial begin
    packet pkt;
    pkt=new();
    $display("----------------------------");
    repeat(3)begin
      pkt.randomize();
      $display("\tstart_addr=%0d,end_addr=%0d",pkt.start_addr,pkt.end_addr);
      $display("\taddr=%0d",pkt.addr);
      $display("----------------------------");
    end
  end
endmodule