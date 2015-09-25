function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Move along.");
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end