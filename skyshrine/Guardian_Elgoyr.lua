function event_say(e)
	if (e.message.findi("hail")) then
		e.self:Say(("We were created to protect the Kin and the shrine from attack. This is what we've always done. Do not try to alter this.");
	end		
end

function event_trade(e)
	local item_lib = require('items');

	item_lib.return_items(event.self, event.other, event.trade);
end