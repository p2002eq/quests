--The_shadows (207060)
--spider trap placeholder
--potorment

function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 35, xloc + 35, yloc - 35, yloc + 35);
end

function event_enter(e)
	if not e.other:GetGM() then 
		local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
		local spawned = eq.spawn2(207296, 0, 0, x + math.random(-5,5), y + math.random(-5,5), z, h);	--A_parylyx_hookcaster (207296)
		eq.set_timer('depop', 5 * 60 * 1000, spawned);
        
        e.self:Emote("around you erupt with activity!");
        eq.depop_with_timer();
	end
end

