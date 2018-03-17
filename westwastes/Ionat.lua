-- Hsagra's Wrath
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " ..e.other:GetName().. ". It is good to see that you have traveled so far to be in my presence. I do believe that you are the one chosen to aid us in our fight against the giants. If you are then I am sure that you will need my rune for your research.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1908})) then -- Jualicns Token
		e.self:Say("Take this Rune of Revenge " ..e.other:GetName().. " . You will need it to extract retribution in remembrance of our dear Hsagra. I thank you for your contributions to our cause, It is good to have you amongst our ranks.");
		e.other:Faction(42,10);   -- Claws of Veeshan
		e.other:Faction(362,10);  -- Yelinak
		e.other:Faction(189,-30); -- Kromzek
		e.other:SummonItem(1908); -- Jualicn's Token
	    e.other:QuestReward(e.self,0,0,0,0,1894,1000); -- Rune of Revenge
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
