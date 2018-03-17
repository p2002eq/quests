function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Beyond these gates is the city of our people. Be respectful and obey our laws else I'll toss yer carcass into the pit meself.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
