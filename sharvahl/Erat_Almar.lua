function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Eh, what do you mean by peculiar?");
	end
	if(e.signal == 2) then
		e.self:Say("Whoa! What did you do?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
