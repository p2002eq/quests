function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Do not complain to me of the prices.  I charge what the Haggle Baron instructs me to charge.");
	end
end