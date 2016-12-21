function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello! I am Jaylin's new assistant, Kiolna. If you wish to hand in your keys, please give them to me and I will be happy to assist you! It is a pleasure doing business with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12143})) then --H.K. 102
		e.self:Say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
        e.other:QuestReward(e.self,0,8,3,0,18936,500); -- A Sealed Note
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12193})) then -- H.K. 106
		e.self:Say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
        e.other:QuestReward(e.self,2,0,4,1,13323,500);  -- Emerald Shard
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13823})) then -- H.K. 401
        e.self:Say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
        e.other:QuestReward(e.self,0,0,0,0,13828,500); -- *Staff Segment B
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
