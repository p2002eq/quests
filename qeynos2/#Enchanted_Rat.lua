local diseased = 2179  --NPC ID for diseased rat
local healthy = 2180 -- NPC ID for healthy rat


function event_spawn(e)
	-- checks for NPC in area
    local x = e.self:GetX();
    local y = e.self:GetY();
    local z = e.self:GetZ();
	
	e.self:Emote("scurries happily out of the jar");
	
	local npc_list = eq.get_entity_list():GetNPCList();
	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			if npc:CalculateDistance(x, y, z) <= 15 and npc:GetNPCTypeID() == diseased then
				npc:Depop();		--depop diseased rat
				eq.spawn2(healthy,0,0,npc:GetX(),npc:GetY(),npc:GetZ(),0);	--spawns healthy rat
			end
		end
	end
end