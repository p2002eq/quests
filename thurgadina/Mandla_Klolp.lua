function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What can I do fer ya? If yer lookin' fer a handout I got nothin for ya. Me darn husband wastes what little money we make on gamblin'. What a sucker! I don't know why I married him.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
