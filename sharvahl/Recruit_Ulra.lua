function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("I guess so...");
		e.self:DoAnim(48); --nod
		eq.signal(155132,1,1);
	end
	if(e.signal == 2) then
		e.self:DoAnim(7); --bash
		eq.signal(155132,2,1);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
