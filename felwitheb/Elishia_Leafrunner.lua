function event_say(e)
	if(e.message:findi("letter")) then
		e.other:SummonItem(8970); -- Letter to Jeremy
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8969})) then -- Letter to Elishia
		e.self:Say("Oh, a letter from my grandson? Thank you very much. I haven't been able to talk to him recently. Would you mind taking a [letter back to him] for me?");
		e.other:Faction(170,10);  -- Keepers of the Art
		e.other:Faction(178,2);  -- King Tearis Thex
		e.other:Faction(99,1);   -- Faydarks Champions
		e.other:Faction(322,-2); -- The Dead
		e.other:QuestReward(e.self,0,0,0,0,0,500); -- Faction and EXP
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- Elishia_Leafrunner