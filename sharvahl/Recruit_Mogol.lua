function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Aye. Sir!");
		e.self:DoAnim(48); --nod
		eq.signal(155126,1,15);
	end
	if(e.signal == 2) then
		e.self:DoAnim(7); --bash
		eq.signal(155126,2,15);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
