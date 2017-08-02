function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. " .. e.other:GetName() .. ". I hope you are faring well this day.");
	end
end