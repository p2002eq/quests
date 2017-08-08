function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Looking for a good read?  You should visit the guild houses.  They have tomes which have been scribed for sale.");
	end
end