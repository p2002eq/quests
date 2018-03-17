function event_say(e)
	if(e.message:findi("hail")) then
			e.self:Say("Can I help you with something? If you want anything to do with carpentry, somethin' I grew up with and was raised on, I can't help ya. Nope.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
