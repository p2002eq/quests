function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("If you are in need of poisons. then your presence is not a waste of my time. However. if you seek idle chit-chat or have come for some other affair than to purchase my wares. begone with you. I haven't the time nor the desire to engage in activities that will not yield me profit.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
