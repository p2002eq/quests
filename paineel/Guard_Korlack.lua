function event_say(e)
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Uggg. You needz [" .. eq.say_link("keyz") .. "]? Rrrrrrr.");
		elseif(e.message:findi("key")) then
			e.self:Say("Uggggg. Take dis keyz.");
			e.other:SummonItem(6378);
		end
	end
end