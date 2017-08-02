function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Buy. or leave.  Make up your mind.  I have no time for idle chitchat.");
	end
end