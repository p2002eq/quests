function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

function event_death_complete(e)
	eq.unique_spawn(84408,0.0, 0, -518, 2490, 0, 0) --To spawn Vekis,  ** Need to find z axis
end
