function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome! Why don't you browse through my selection of fine goods and pick out some things you like " .. e.other:GetName() .. "?");
	end
end

-- END of FILE Zone:gfaydark  ID:54141 -- Innkeep_Wuleran