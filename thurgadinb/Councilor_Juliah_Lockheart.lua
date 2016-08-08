function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, my what a nice looking "..e.other:Race().." you are, not that I've seen many of your kind mind you. I am Councilor Lockheart, representing the people of Thurgadin. Here is where we aid the Dain by presenting the peoples' will to him in the hopes that laws are made with the good interest of all our people in mind.");
	end		
end

function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1464})) then
		eq.depop();
		eq.spawn2(129102, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
	end
	item_lib.return_items(e.self, e.other, e.trade)			
end

function event_signal(e)
	if(e.signal == 1) then --Night
		eq.move_to(14,883,-2,232,1);
	elseif(e.signal == 2) then --Day
		eq.move_to(-25,542,65,0,1);
	end
end