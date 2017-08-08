function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Can't you see I'm on duty?!!  If you wish to converse. Might I suggest the Tink N' Babble tavern near the Temple of Terror?");
	end
end