function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome back, " .. e.other:GetName() .. ". Why don't you purchase a few things before you head out into the tundra again?");
	end
end
