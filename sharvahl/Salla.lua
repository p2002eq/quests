function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to our market! If you are looking for grains. I should be able to fill your order.  We are open to bartering. so please bring us any grains. fruits. and vegetables that you may want to trade.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
