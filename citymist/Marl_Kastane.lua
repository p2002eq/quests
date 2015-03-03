-- Part of SK Epic 1.0
function event_spawn(e)
	
	eq.set_timer("depop",4800000);
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 14384})) then
	    e.self:Say("Very good, I will go deliver this right away.");
	    e.other:QuestReward(e.self,0,0,0,0,14383);
	end
		item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end


--fiddlemetimbers