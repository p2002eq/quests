function event_say(e)
	if (e.message.findi('hail')) then
		e.self:Say("There are many places for the likes of you. Why don't you go find one right now and leave me alone.");
	end

end

function event_trade(e)
	local item_lib = require('items');
	item_lib.return_items(event.self, event.other, event.trade);
end