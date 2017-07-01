-- Hsagra's Wrath
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is not often that I see strangers in these dangerous lands. Perhaps you are the chosen that Jualicn speaks of that will aid us in our battle against the foul giants. I do not believe you would be here if you were not in need of my sacred rune.");
	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1908})) then -- Jualicn's Token
		e.self:Say("I have given you the Rune of Bleve, to assist you in your research for the once lost magic against the Kromzek. I hope that you can make good use of it for it is very sacred to me. May Veeshan guide your path! ");
		e.other:Faction(42,10);   -- Claws of Veeshan
		e.other:Faction(362,10);  -- Yelinak
		e.other:Faction(189,-30); -- Kromzek
		e.other:SummonItem(1908); -- Jualicn's Token
	    e.other:QuestReward(e.self,0,0,0,0,1895,1000); -- Rune of Bleve
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end