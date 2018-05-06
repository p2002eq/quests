--A_faint_rattle (207062)
--spider trap placeholder
--potorment

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 35, xloc + 35, yloc - 35, yloc + 35, zloc - 20, zloc + 20);
end

function event_enter(e)
	if not e.other:GetGM() then 
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
		local spawns = math.random(1,2) -- 1-2 spawns per trap
		for n = 1,spawns do 
			local spawned = eq.spawn2(207295, 0, 0, x + math.random(-5,5), y + math.random(-5,5), z, h);
			eq.set_timer('depop', 5 * 60 * 1000, spawned);
		end
        
        e.self:Emote("of chains draws your attention to a sudden movement in the mist above you!");
        eq.depop_with_timer();
	end
end

