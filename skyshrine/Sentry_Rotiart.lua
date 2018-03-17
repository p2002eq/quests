function event_trade(e)
	local item_lib = require('items');
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 29626})) then
		eq.depop();
		eq.spawn2(114437, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); 
		-- spawn: a kromzek spy
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

