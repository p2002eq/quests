function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("You seek to extinguish the hunger of the flesh.  You have come to the right place.");
	end
end