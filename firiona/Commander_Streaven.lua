function event_say(e) --Unknown text
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

