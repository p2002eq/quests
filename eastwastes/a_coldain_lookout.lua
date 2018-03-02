-- Part of Coldain Ring 5
local started;

function event_spawn(e)
	started = false;
end

function event_trade(e)
	local item_lib = require('items');
	if not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 30136}) then -- Rygorr Invasion Plans
		started = true;
		e.self:Shout("Aahhh.. You're too late! They're upon us! To arms, men! Death to Scarbrow!");
		spawn_event();
		
		e.other:Faction(49, 25); -- Coldain
		e.other:Faction(67, 6); -- Dain Frostreaver IV
		e.other:Faction(188, -12); -- Kromrif
		e.other:Faction(189, -2); -- Kromzek
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	if e.signal == 99 then
		started = false;
	end
end

function spawn_event()
	local spawnOracles = math.random(2, 3);
	local spawnInvaders = math.random(2, 3);
	
	--locs made up
	eq.spawn2(116600, 0, 0, -650, -2744, 180, 45); -- Scarbrow Ga`Hruk

	eq.spawn2(116586, 0, 0, -654, -2723, 180, 45); -- a Ry`Gorr invader
	eq.spawn2(116586, 0, 0, -643, -2768, 180, 45); -- a Ry`Gorr invader
	if (spawnInvaders == 3) then
		eq.spawn2(116586, 0, 0, -658, -2760, 175, 45); -- a Ry`Gorr invader
	end

	eq.spawn2(116587, 0, 0, -681, -2739, 180, 45); -- a Ry`Gorr oracle
	eq.spawn2(116587, 0, 0, -673, -2766, 180, 45); -- a Ry`Gorr oracle
	if (spawnOracles == 3) then
		eq.spawn2(116587, 0, 0, -665, -2734, 180, 45); -- a Ry`Gorr oracle
	end
end