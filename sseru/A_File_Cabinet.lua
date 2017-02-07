
function event_trade(e)
	local item_lib=require("items");

	if (e.other:GetFaction(e.self) <= 5) then -- you must be indiff
		if (item_lib.check_turn_in(e.self, e.trade, { item1 = 29855 })) then -- 29855 :  Replacement Records
			e.other:SummonItem(29856); -- 29856  Original Records
			e.self:Emote("slams shut after you take the original records out.");
			eq.spawn2(159798,0,0,-760,-768,122,175):AddToHateList(e.other, 1);
		end
		
		item_lib.return_items(e.self, e.other, e.trade); -- returns only if you have faction
	else
		e.self:Say("I will do nothing to aid beings like you."); -- not at least indiff, he will say this
	end
	
end

 -- End of File, Zone:sseru  NPC:159420 -- A_File_Cabinet
