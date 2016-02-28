function event_spawn(e)
    eq.set_proximity(e.self:GetX()-100,e.self:GetX()+100,e.self:GetY()-100,e.self:GetY()+100);
    e.self:Say("spawned");
	eq.attack_npc_type(116119);
	e.self:Say("attacked");
end