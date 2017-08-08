function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Shrine of the Diseased! You will be repaid for your service when your soul crosses the void into Bertoxxulous' waiting arms. Are you available to do His bidding?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end