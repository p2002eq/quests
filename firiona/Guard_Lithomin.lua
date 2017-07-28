function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Halt!!  This is General Veredeth's keep.  It is currently under construction and is off limits to adventurers.  Only those with important business may enter.");
		e.self:DoAnim(67);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end