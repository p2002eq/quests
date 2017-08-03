function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ".  Thank you for coming in and looking at our wares.  We should have just about everything you need if you wish to take a trip.");
	end
end