-- Hsagra's Wrath
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " ..e.other:GetName().. ". It cannot be that you would present yourself before me without reason. What brings you to these lands on this day? Please be quick for I have many ancient runes I must study.");
	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1908})) then -- Jualicn's Token
		e.self:Say("" ..e.other:GetName().. ", which Relinar found to be necessary for the success of the magic against those foul Giants. I present this to you with faith that you are trusted amongst us or you would not have been sent to me. Make haste so that no time is wasted in extracting revenge for their past transgressions. ");
		e.other:Faction(42,10);   -- Claws of Veeshan
		e.other:Faction(362,10);  -- Yelinak
		e.other:Faction(189,-30); -- Kromzek
		e.other:SummonItem(1908); -- Jualicn's Token
	    e.other:QuestReward(e.self,0,0,0,0,1896,1000); -- Rune of Concentration
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
