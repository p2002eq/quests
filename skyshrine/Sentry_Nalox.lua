function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have no time to talk right now. I must keep watch for hostiles.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self,e.other,e.trade);
end
