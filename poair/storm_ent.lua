--storm_ent (215025)
--spawns maurading stormriders to appear to charge at player in proximity
--poair

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40, zloc - 20, zloc + 20);
end

function event_enter(e)
	if not e.other:GetGM() then 	
		local x, y, z, h = -330,-620,103,400;	--near rock pond
		for n = 1,5 do
			local spawned = eq.spawn2(215432, 0, 0, x + math.random(-50,50), y + math.random(-20,20), z + 5, h);	--#a_marauding_stormrider (215432)
			spawned:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading(), true);
		end
		eq.depop_with_timer();
	end
end

