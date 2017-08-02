function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ".  Feel free to peruse my wares but waste not my time with idle browsing if you do not intend to purchase something.");
	end
end