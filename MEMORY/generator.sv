class generator;
  //declaring transaction class
  rand transaction trans;
  //declaring mailbox
  mailbox gen2driv;
  //repeat count,to specify number of items to generate
  int repeat_count;
  //event,to indicate the end of transaction generation
  event ended;
  //constructor
  function new(mailobox gen2driv,event ended);
    //getting the mailbox handle from env
    this.gen2drive=gen2driv;
    this.ended=ended;
  endfunction
  //main task,generates(create and randomizes)the repeat_count number of packets and
  //into mailbox
  task main();
    repeat(repeat_count)begin
      trans=new();
      if(!trans.randomize())$fatal("Gen::trans randomization failed");
      gen2driv.put(trans);
    end
    ->ended;//triggering indicates the end of generation
  endtask
endclass

