class transaction;
  //declaring transaction items
  rand bit[1:0]addr;
  rand bit[7:0]wdata;
  rand bit wr_en;
  rand bit rd_en;
  bit [7:0] rdata;
  bit[1:0] cnt;
  //constraint,to generate any one among write and read
  constraint wr_rd_c {wr_en != rd_en;};
  end class
