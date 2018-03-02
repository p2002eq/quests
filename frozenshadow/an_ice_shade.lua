function event_death_complete(e)
    eq.unique_spawn(111252,0,0,-398,400,22,125); --VhalSera
    
   
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end