-- 



function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I have heard that one is amongst us in the lands which will aid us in our cause. If you are the one that seeks my ancient rune for your studies please make sure it is not used in vain. I do not talk to many that pass through here and I feel in my heart that it is you that shall help us.");
	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1908})) then
		e.other:Faction(42,10);   --Claws of Veeshan
		e.other:Faction(362,10);  --Yelinak
		e.other:Faction(189,-30); --Kromzek
	    e.other:QuestReward(e.self,0,0,0,0,1893,1000);
	    if (e.self:HasItem(1895) and e.self:HasItem(1894) and e.self:HasItem(1896)) then
			e.other:QuestReward(e.self,0,0,0,0,1908,1000); -- Jualicn's Token
		end
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- fiddle