function event_spawn(e)
    e.self:Say("spawned");
    local corbin = eq.get_entity_list():GetMobID(116119);
    e.self:Say("get entity");
    e.self:Say(corbin);
    local mob1attack = corbin:CastToNPC();
    e.self:Say("casttonpc");
    --eq.set_proximity(e.self:GetX()-100,e.self:GetX()+100,e.self:GetY()-100,e.self:GetY()+100);
    mob1attack:AddToHateList(e.self, 1);
--	eq.attack_npc_type(116119);
	e.self:Say("add to hate list");
end