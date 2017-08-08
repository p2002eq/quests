function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Rathe Mountains hideaway!");
	end
end