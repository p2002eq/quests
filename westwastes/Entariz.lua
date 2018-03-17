-- Hsagra's Wrath
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " ..e.other:GetName().. ". I have heard that one is amongst us in the lands which will aid us in our cause. If you are the one that seeks my ancient rune for your studies please make sure it is not used in vain. I do not talk to many that pass through here and I feel in my heart that it is you that shall help us.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1908})) then -- Jualicn's Token
		e.self:Say("Ah of course " ..e.other:GetName().. " . You will need a Rune of Eradication for your lexicon. We are counting on your loyalty. Remember that you will need to bring the teachings of Relinar to Lawyla for further instructions, as she requires them to pass on the magic to those worthy of it. I bid you farewell " ..e.other:GetName().. ".");
		e.other:Faction(42,10);   -- Claws of Veeshan
		e.other:Faction(362,10);  -- Yelinak
		e.other:Faction(189,-30); -- Kromzek
		e.other:SummonItem(1908); -- Jualicn's Token
	    e.other:QuestReward(e.self,0,0,0,0,1893,1000); -- Rune of Eradication
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
