function event_death_complete(e)
    --eq.unique_spawn(XXXXXX,0,0,200.0,978.0,186.60); --spawn 
    
    --quest::delglobal("omica");
    --quest::setglobal("omica",2,3,"F");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end