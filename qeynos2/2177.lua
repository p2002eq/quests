--Qeynos Research Badge Quest
--Quest script for tiles on Enchanted Rat Minigame

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2584})) then 
		e.other:SummonItem(2587);
		eq.spawn2(2181, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);  -- spawn enchanted rat
		eq.signal(2052,1);  -- Velarte Selire signal for counter
		eq.depop(); --depop tile
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2585})) then 
		e.other:SummonItem(2588);
		eq.spawn2(2181, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);  -- spawn enchanted rat
		eq.signal(2052,1);  -- Velarte Selire signal for counter
		eq.depop(); --depop tile
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2586})) then 
		e.other:SummonItem(2589);
		eq.spawn2(2181, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);  -- spawn enchanted rat
		eq.signal(2052,1);  -- Velarte Selire signal for counter
		eq.depop(); --depop tile
	end
		item_lib.return_items(e.self, e.other, e.trade)
end