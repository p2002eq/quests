
function event_spawn(e)
    eq.set_timer("depop", 180000); -- this triggered mob is only available for three minutes then depops
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1708})) then
		e.self:say("Failure! Incompetence! The whole squad anihilated! I knew this would happen if left in the hands of a worthless mercenary! Well, you can take this report back to Drioc then. Now get out of my sight, mercenary.");
		e.other:QuestReward(e.self,0,0,0,0,1709,1000);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
	eq.stop_timer("depop");
end

--fiddle