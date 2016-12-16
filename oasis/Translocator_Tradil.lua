local helper = require('translocators');

function event_say(e)
    helper.hail_text(e, 'Timorous Deep', {zone=96, x=3538, y=6117, z=1.3, heading=110});
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13006})) then
		e.self:Say("Oh... thank you! I've been standing here in the heat for so long I can barely cast. Thank you for your kindness!");
		e.other:SummonItem(34029);
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
