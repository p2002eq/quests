function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("The purchase of a water extractor would be wise for any lizard who expects to venture deep into the wilds of Kunark.");
	end
end