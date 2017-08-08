function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello.  I love to come out and gaze at the sky.  Isn't it beautiful?");
	end
end