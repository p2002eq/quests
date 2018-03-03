--Akhevan Warder Script
--zone: vexthal

function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 40, e.self:GetX() + 40, e.self:GetY() - 40, e.self:GetY() + 40, e.self:GetZ() - 10, e.self:GetZ() + 10);
end

function event_combat(e)
	if e.joined then
		BanishPlayer(e)
	end
end

function event_enter(e)
	BanishPlayer(e);
end

function BanishPlayer(e)
	local target = e.other:CastToClient();
    local instance_id = eq.get_zone_instance_id();
	local zone_id = eq.get_zone_id();
	local x,y,z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
	local qglobals = eq.get_qglobals(target);
	
	if not target:GetGM() then
		eq.target_global("vt_banished", "1", "D30", 0, target:CharacterID(), 158);	--exploiter/dumbass tracker
		target:MovePCInstance(zone_id, instance_id, 596,0,5,256);	--Outside Blob 1's room
		target:Message(7,"Shadows gather about your body and transport you.")
		e.self:WipeHateList();
	end
end
	
