function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to Halas! Home of the Wolves of the North.");
	end
end
