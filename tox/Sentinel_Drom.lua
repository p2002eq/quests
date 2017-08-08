function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. "! Be careful out in Toxxulia Forest! There are many venomous creatures out here. If things get too scary for you. run back to us and we shall take care of the threat.");
	end
end