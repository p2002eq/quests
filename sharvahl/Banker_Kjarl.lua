function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Royal Coin and Mint of Shar Vahl. His majesty King Raja Kerrath guarantees all deposits in his benevolence. We also have storage available for your gear. Please rest assured that your treasured items are safe with us.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
