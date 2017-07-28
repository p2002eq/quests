function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ".");
	end
end
