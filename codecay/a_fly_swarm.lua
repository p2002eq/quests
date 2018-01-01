--a_fly_swarm (200134)
--fly trap placeholder
--codecay

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40);
end

function event_enter(e)
	if not e.other:GetGM() then 
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
		local spawns = math.random(2,4) -- 2-4 spawns per trap
		for n = 1,spawns do 
			local spawned = eq.spawn2(200232, 0, 0, x + math.random(-5,5), y + math.random(-5,5), z, h);	--a_swarming_fly (200232)
			eq.set_timer('depop', 5 * 60 * 1000, spawned);
		end
        
        e.self:Emote("erupts from a pile of bloody flesh."); 
        eq.depop_with_timer();
	end
end