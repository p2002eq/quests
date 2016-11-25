--GM EVent
local counter = 0;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("squawks for more cockatrice meat!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13085,item2 = 13085,item3 = 13085,item4 = 13085})) then
		e.self:Emote("gobbles down chunks of cockatrice meat.");
		counter = counter + 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13085,item2 = 13085,item3 = 13085})) then
		e.self:Emote("gobbles down chunks of cockatrice meat.");
		counter = counter + 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13085,item2 = 13085})) then
		e.self:Emote("gobbles down chunks of cockatrice meat.");
		counter = counter + 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13085})) then
		e.self:Emote("gobbles down a chunk of cockatrice meat.");
		counter = counter + 1;
	end
	if (counter > 200) then
		eq.spawn2(93323,0,0,1471,-3675,337,6.5);
		eq.depop();
		counter = 0;
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end