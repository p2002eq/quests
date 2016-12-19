-- Part of Coldain Ring 5
local started;

function event_spawn(e)
	started = false;
end

function event_trade(e)

	local item_lib = require('items');

	if not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 30136}) then
		started = true;
		e.self:Shout("Aahhh.. You're too late! They're upon us! To arms, men! Death to Scarbrow!");
		spawn_event();
		
		e.other:Faction(49, 25);
		e.other:Faction(67, 6);
		e.other:Faction(188, -12);
		e.other:Faction(189, -2);	
	end

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
	eq.spawn2(116600, 0, 0, -650, -2744, 180, 45); --Scarbrow

	eq.spawn2(116586, 0, 0, -654, -2723, 180, 45); --Invader
	eq.spawn2(116586, 0, 0, -643, -2768, 180, 45); --Invader
	if (spawnInvaders == 3) then
		eq.spawn2(116586, 0, 0, -658, -2760, 175, 45); --Invader
	end

	eq.spawn2(116587, 0, 0, -681, -2739, 180, 45); --Oracle
	eq.spawn2(116587, 0, 0, -673, -2766, 180, 45); --Oracle
	if (spawnOracles == 3) then
		eq.spawn2(116587, 0, 0, -665, -2734, 180, 45); --Oracle
	end

end