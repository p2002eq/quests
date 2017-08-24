-- trap spawner (163390) in Grieg's End

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 30, xloc + 30, yloc - 30, yloc + 30);
end

function event_enter(e)
	if (e.other:GetGM() == false) then
		local x = e.self:GetX();
		local y = e.self:GetY();
		local z = e.self:GetZ();
		local h = e.self:GetHeading();
		local mob = eq.ChooseRandom(163386, 163375, 163106, 163376, 163354, 163150, 163383, 163135, 163378, 163379, 163380, 163381, 163385, 'rare');
		if mob == 'rare' then
			local rare = eq.ChooseRandom(163124, 163065, 163062, 163384);
			eq.spawn2(rare, 0, 0, x, y, z, h);
		else
			eq.spawn2(mob, 0, 0, x, y, z, h);
		end
		eq.depop_with_timer()
	end
end
