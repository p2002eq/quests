function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	eq.unique_spawn(57000,37,0,-1150,1930,0); --a dark elf courier
end
