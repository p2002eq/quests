function event_spawn(e)
	eq.set_timer("follow", 1000);
end

function event_timer(e)
	if(e.timer == "follow") then
		local getmobbynpctype = eq.get_entity_list():GetMobByNpcTypeID(84131);
		local follow_target = getmobbynpctype:GetID();
		eq.follow(follow_target);
		eq.stop_timer("follow");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end