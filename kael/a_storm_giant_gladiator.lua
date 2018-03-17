function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("I am here to make sure no one flees the arena as a coward.");
	end
end
