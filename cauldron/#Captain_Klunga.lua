function event_spawn(e)
	eq.set_anim(70072,1);
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12278})) then
		e.other:Ding();
		eq.set_anim(70072,0);
		eq.move_to(-395.87, 807.04, 70.53, 0, 1);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)
	eq.create_ground_object(12274, e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

-- EOF #Captain Klunga - Cauldron