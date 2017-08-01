function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hullo. Buy sum of my stuff.");
	end
end