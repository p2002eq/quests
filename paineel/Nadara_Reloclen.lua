function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there. " .. e.other:GetName() .. ".  Fear not for your valuables.  I have known Marsa for many years and she has not once taken anyone's property.  She is. perhaps. the last honest person in this city.");
	end
end