function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I have heard stories that there is a lost valley of great treasures within the Dreadlands.  Some say it was there the Green Death first arose.");
	end
end