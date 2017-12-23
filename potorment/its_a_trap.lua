-- Trap 
-- Spawns Phlarax

function event_spawn(e)
  eq.set_proximity(e.self:GetX() - 50, e.self:GetX() + 50, e.self:GetY() - 50, e.self:GetY() + 50);
end

function event_enter(e)
  eq.spawn2(eq.ChooseRandom(207072,207073,207075),0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
  eq.depop_with_timer();
end

--END of FiLE zone:potorment ID: 207080 NPC: its_a_trap