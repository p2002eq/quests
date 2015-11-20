function event_say(e)
	if(e.message:findi("hail")) then	
		e.self:Say("Uuuhh, this be a private room, me friend. Mayhap ye should leave before somethin' unfortunate happens.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
