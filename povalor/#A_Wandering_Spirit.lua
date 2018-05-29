--#A_Wandering_Spirit
--ID:208177
--Zone:povalor 

function event_spawn(e)
	eq.set_timer("depop", 60 * 1000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_trade(e)
    local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 20607, item2 = 20608})) then 	--Unwavering Shield of Faith, Unwavering Sword of Faith
	    e.self:Say("It's been quite some time since I've been without my weaponry. Thank you for returning them to me, " .. e.other:GetName() .. "." );
		e.other:AddEXP(150000);  
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

