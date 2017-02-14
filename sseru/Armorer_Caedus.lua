function event_say(e)
	if(e.message:findi("Hail")) then
		e.self.Say("Greetings " .. e.other:GetName() .. ".");
	end
end

