function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ". What brings you to the watery lands of Rathtear? Do you seek [" .. eq.say_link("enlightenment") .. "]?'");
	end
end
