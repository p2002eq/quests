function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1459})) then --tainted avalance ale
		e.self:Say("You gotta be kiddin me, Avalanche Ale? Haven't had a bottle a this stuff in ages. Brell bless you, $name!");
		e.self:Say("Glug, glug, glug...");
		eq.set_timer("1", 5000);
	end
	item_lib.return_items(e.self, e.other, e.trade);

end

function event_timer(e)
	if (e.timer == "1") then
		eq.stop_timer("1");
		e.self:DoAnim(58);
		eq.set_timer("2", 5000);
	elseif (e.timer == "2") then
		eq.stop_timer("2");
		e.self:DoAnim(58);
		eq.set_timer("3", 5000);
	elseif (e.timer == "3") then
		eq.stop_timer("3");
		e.self:DoAnim(21);
		eq.set_timer("4", 5000);
	elseif (e.timer == "4") then
	    eq.depop_with_timer();
		--eq.spawn2(116605, 0, 0, e.self:GetX(), e.self:GetY(), e.sef:GetZ(), e.self:GetHeading());
		eq.spawn2(116605, 0, 0, 2365.00, -58.80, 150.65, 130.0);   -- wouldn't spawn with the GetX/etc line.
	end

end
