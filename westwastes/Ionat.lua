-- 



function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. It is good to see that you have traveled so far to be in my presence. I do believe that you are the one chosen to aid us in our fight against the giants. If you are then I am sure that you will need my rune for your research.");
	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1908})) then
		e.other:Faction(42,10);   --Claws of Veeshan
		e.other:Faction(362,10);  --Yelinak
		e.other:Faction(189,-30); --Kromzek
	    e.other:QuestReward(e.self,0,0,0,0,1894,1000);
	    if (e.self:HasItem(1893) and e.self:HasItem(1896) and e.self:HasItem(1895)) then
			e.other:QuestReward(e.self,0,0,0,0,1908,1000); -- Jualicn's Token
		end
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end