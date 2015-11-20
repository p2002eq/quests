function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You got a dispute to settle or are ya here to yap it up?");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
