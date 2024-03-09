class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  environment env;
  
  agent1_config cfg_1[];
  agent2_config cfg_2[];
  env_config cfg;
  
  //if it has agent or not 
  bit has_agent1 = 1;
  bit has_agent2 = 1;
  
  //number of agent
  int no_of_agent1 = 2;
  int no_of_agent2 = 3;
  
  function new(string name = "test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    cfg = env_config::type_id::create("cfg");
    
    if(has_agent1)
      cfg.cfg_1 = new[no_of_agent1];
    
    if(has_agent2)
      cfg.cfg_2 = new[no_of_agent2];
    
    if(has_agent1)
      begin
        cfg_1 = new[no_of_agent1];
        foreach(cfg_1[i])
          begin
            cfg_1[i] = agent1_config::type_id::create($sformatf("cfg_1[%0d]",i));
            cfg_1[i].is_active = UVM_ACTIVE;
            cfg.cfg_1[i] = cfg_1[i];
          end
      end
    
    
    if(has_agent2)
      begin
        cfg_2 = new[no_of_agent2];
        foreach(cfg_2[i])
          begin
            cfg_2[i] = agent2_config::type_id::create($sformatf("cfg_2[%0d]",i));
            cfg_2[i].is_active = UVM_ACTIVE;
            cfg.cfg_2[i] = cfg_2[i];
          end
      end
    
    
    cfg.no_of_agent1 = no_of_agent1;
    cfg.no_of_agent2 = no_of_agent2;
    
    cfg.has_agent1 = has_agent1;
    cfg.has_agent2 = has_agent2;
    
    uvm_config_db#(env_config)::set(this,"*","config",cfg);
    
    env = environment::type_id::create("env",this);
    
  endfunction
  
endclass