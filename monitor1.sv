class monitor1 extends uvm_monitor;
  
  `uvm_component_utils(monitor1)
  
  function new(string name = "monitor1", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
endclass