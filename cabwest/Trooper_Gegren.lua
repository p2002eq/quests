function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Do not approach the Tower of Death unless you have been summoned to rebirth.  My brother was unfortunate enough to venture into their halls and he has never been seen again.");
	end
end