function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6980, item2 = 6978})) then -- Kejek Spirit Powder, Fading Soul Orb
		e.self:Say("I require a Fading Soul Orb and Kejek Spirit Dust in order to perform the ritual that will free the imprisoned souls.");
		e.self:Emote("scrawls an arcane symbol on the ground with an odd powder and places the orb in its center. He then begins reciting an incantation and waving his arms over the symbol and orb. Moments later the orb shatters and an apparition appears.");
		e.other:QuestReward(e.self,0,0,0,0,2577,100);  -- Shattered Fading Soul Orb
		e.other:Faction(172, 1, 0); -- Kejek Villiage
		e.other:Faction(247, 1, 0); -- Peace Keepers
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
