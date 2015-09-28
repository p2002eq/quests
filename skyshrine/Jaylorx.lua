
function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Watch out in the water. Yelinak keeps a few small fish there.");
  end
end

function event_trade(e)
	local item_lib = require('items');
	item_lib.return_items(event.self, event.other, event.trade);
end
