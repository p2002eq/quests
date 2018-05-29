-- Hatchling (204001) 
--spider trap placeholder
--ponightmare

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40);
end

function event_enter(e)
	if not e.other:GetGM() then 
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
		local spawns = math.random(2,3) -- 2-3 spawns per trap
		for n = 1,spawns do 
			local spawned = eq.spawn2(eq.ChooseRandom(204464, 204466), 0, 0, x + math.random(-5,5), y + math.random(-5,5), z, h);
			eq.set_timer('depop', 5 * 60 * 1000, spawned);
		end
        
        e.self:Emote("Spiders descend from the canopy above, hungry for flesh");
        eq.depop_with_timer();
	end
end