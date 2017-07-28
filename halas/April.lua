function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ". I'm a maker of weapon molds. Care to view my wares?");
	end
end
