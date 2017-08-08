function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". If you're looking to sell a brown horse, I'll be happy to give you a fair price. If you've got a different color horse you'd like to sell talk to one of my brothers.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 21815})) then -- Brown Rope Bridle
		e.other:SummonItem(21820); -- Bag of Platinum Pieces
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 21816})) then -- Brown Leather Bridle
		e.other:SummonItem(21821); -- Heavy Bag of Platinum
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 21817})) then -- Brown Silken Bridle
		e.other:SummonItem(21822); -- Big Bag of Platinum
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 21818})) then -- Brown Chain Bridle
		e.other:SummonItem(21823); -- Huge Bag of Platinum
	end
	item_lib.return_items(e.self, e.other, e.trade)
end