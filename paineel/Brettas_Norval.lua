function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. " .. e.other:GetName() .. "!  I thought I heard the clink of coins and now. here you stand!  Please feel free to browse through my stock.");
	end
end