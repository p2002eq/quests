function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well, hello there, my good fellow. I see you've somehow found your way into my private quarters, very adventurous. Normally I'd have you removed but it's refreshing to see someone with guts like you have. Too many people in this cit... err ... world have no guts. No initiative. Someday that will change, though.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
