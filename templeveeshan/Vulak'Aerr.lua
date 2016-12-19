-- vulak, summons all named dragons within inner TOV
function event_spawn(e)
	e.self:Shout("Aid me my children!");
--	local dragons = {124010, 124008, 124011, 124074, 124072, 124076, 124077, 124103, 124289};
	local dragons = {124008, 124074, 124076, 124077, 124103, 124289};
	for i, dragon in ipairs(dragons) do
		summon_dragon(dragon, e.self:GetX(), e.self:GetY(), e.self:GetZ());
	end
end

function summon_dragon(npcid, x, y, z)
	local mob = eq.get_entity_list():GetMobByNpcTypeID(npcid);
	if(mob) then
		mob:CastToNPC():GMMove(x, y, z);
	end
end

function event_signal(e)
	if (e.signal == 1) then 	-- depop vulak and move any summoned dragons back to their bind.
		for i, dragon in ipairs(dragons) do
			local mob = eq.get_entity_list():GetMobByNpcTypeID(dragon);
			if(mob) then
				if (dragon == 124010) then
					mob:CastToNPC():GMMove(-781, 208, 98.7, 130.5);
				elseif (dragon == 124008) then
					mob:CastToNPC():GMMove(-1266,-49, 90, 40.8);
				elseif (dragon == 124011) then
					mob:CastToNPC():GMMove(-1362, 218, 134, 220);
				elseif (dragon == 124074) then
					mob:CastToNPC():GMMove(-1699, 197, 80, 8.1);
				elseif (dragon == 124072) then
					mob:CastToNPC():GMMove(-1760, 1604, 190, 73.4);
				elseif (dragon == 124076) then
					mob:CastToNPC():GMMove(-1643, 1622, 190, 160);
				elseif (dragon == 124077) then
					mob:CastToNPC():GMMove(-150, 974, 130, 181.5);
				elseif (dragon == 124103) then
					mob:CastToNPC():GMMove(-123, 738, 66, 36.7);
				elseif (dragon == 124289) then
					mob:CastToNPC():GMMove(-60, -285, 25, 255);
				end
			end
		end
		eq.depop();
	end
end