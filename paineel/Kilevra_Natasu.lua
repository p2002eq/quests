function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Have you spoken with Danus?  If not. I suggest you do. so that I will not waste my breath further.");
	end
end