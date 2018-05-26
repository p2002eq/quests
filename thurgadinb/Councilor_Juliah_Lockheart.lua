--Councilor_Juliah_Lockheart (129045)
--thurgadinb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, my what a nice looking "..e.other:Race().." you are, not that I've seen many of your kind mind you. I am Councilor Lockheart, representing the people of Thurgadin. Here is where we aid the Dain by presenting the peoples' will to him in the hopes that laws are made with the good interest of all our people in mind.");
	end		
end

function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1464})) then
		eq.depop_with_timer();
		juliah = eq.spawn2(129102, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		juliah:AddToHateList(e.other, 1);	--she will immediately attack
	end
	item_lib.return_items(e.self, e.other, e.trade)			
end

function event_signal(e)
	if(e.signal == 1) then --Night
		e.self:SetCurrentWP(0);
		eq.start(34);
		--eq.move_to(14,883,-2,232,true);
	elseif(e.signal == 2) then --Day
		e.self:SetCurrentWP(0);
		eq.start(33);
		--eq.move_to(-25,542,65,0,true);
	end
end