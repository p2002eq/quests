function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Looking for a challenging fray?  Perhaps there is a combatant waiting for a duel within the Gauntlet.");
	end
end