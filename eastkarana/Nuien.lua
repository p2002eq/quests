local move;

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20451})) then -- Frayed Braided Grass Amulet
		e.self:Say("So be it. Do as you have done before and find the next. Teloa is the last.");
		e.other:QuestReward(e.self,0,0,0,0,20451,0); -- Frayed Braided Grass Amulet
		eq.spawn2(15170,0,0,-2854,-3840,126.5,123.6); -- Teloa
		eq.move_to(-1590,-3671,-18, 0, true);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 99) then
		e.self:DoAnim(61)
		e.self:Emote("growls as his power seeps into the earth.");
	end
end

function event_waypoint_arrive(e)
	eq.signal(15044,1,0); -- Althele
end
