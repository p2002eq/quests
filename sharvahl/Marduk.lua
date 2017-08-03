function event_spawn(e)
	eq.set_timer("1",82000);
end

function event_timer(e)
	e.self:Say("The outdoors can be cold. Come pick up some extra cloth. Just have a look it wont hurt ya! I'll give you a good deal. Come now don't be shy.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
