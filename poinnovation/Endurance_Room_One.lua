--Endurance Testing Controller (Room One) 206093
--poinnovation

local spawn_locs = {[1] = {-266,-879,78,2}, [2] = {-314,-880,78,255}, [3] = {-406,-783,78,65}, [4] = {-405,-735,78,63}, [5] = {-312,-644,78,125}, [6] = {-263,-642,78,127}, [7] = {-171,-734,78,188}, [8] = {-172,-785,78,193} };
local door_id = {116, 115, 114, 113, 120, 119, 118, 117};	--to open doors based on mob spawn location above (mobs drop from above)
local spiders = {206200, 206201, 206202};  
local pathing_target = {-287, -763, 4};
local kelrig_loc = {-380, -761, 4, 64}	--Assistant Kelrig spawns on east side of room
local kelrig = 206203; -- Assistant Kelrig;
local wave_timer = 90 --default is 90 seocnds
local wave;
local round;

function event_spawn(e)
	wave = 0;
	round = 1;
	eq.set_timer("waves", wave_timer * 1000);
end

function event_timer(e)
	if e.timer == "waves" then
		wave = wave + 1;
		if wave == 8 then
			eq.stop_timer(e.timer)
			spawn_mobs(e,wave);
			eq.set_timer("kelrig", 15 * 1000);
		else
			spawn_mobs(e,wave);
		end
	elseif e.timer == "kelrig" then
		eq.stop_timer(e.timer);
		eq.spawn2(kelrig, 0, 0, unpack(kelrig_loc));		
	end
end

function event_signal(e)
	if e.signal == 1 then
		round = round + 1;	--increment round
		wave = 0;
		eq.set_timer("waves", wave_timer * 1000);
	elseif e.signal == 50 then
		eq.signal(kelrig, round);	--sends back round number as signal
	end
end

function spawn_mobs(e,wav)
	mob_count = MobRoll(wav);	--get max mobs to spawn based on wave counter
	local spawns = {};
	local n = 1;
	
	--get random locations and add in spawns table
	while n <= mob_count do
		rand = math.random(1,8)
		if TableCheck(rand,spawns) then
			table.insert(spawns,n, rand);			
			n = n + 1;
		end
	end
	
	--spawn mobs based on table locations
	for i,v in pairs(spawns) do
		local door = eq.get_entity_list():GetDoorsByDoorID(door_id[v])
		if wav == 8 and i == 1 then
			mob = eq.spawn2(206207, 0, 0, unpack(spawn_locs[v]));	--spawns mob with loot table for final wave
		else
			mob = eq.spawn2(spiders[math.random(1,3)], 0, 0, unpack(spawn_locs[v]));
		end
		mob:CastToNPC():MoveTo(pathing_target[1] + math.random(-25, 25), pathing_target[2] + math.random(-25, 25), pathing_target[3], -2, true);
		door:ForceOpen(e.self);		--opens hatch to drop mob down based on location
	end
end

function TableCheck(ran, tab)
	for i,v in pairs(tab) do
		if v == ran then
			return false;	--already have this value in the table - skip and roll again			
		end
	end
	return true;	-- not a duplicate - OK to proceed
end
	

function MobRoll(w)		--get # of spawns per wave
	if w == 1 then
		return 3;	--always 3 mobs for 1st wave
	else
		rand = math.random(1,100);
		if rand <= 20 then
			return 3;
		elseif rand <= 45 then
			return 4;
		elseif rand <= 65 then
			return 5;
		elseif rand <= 85 then
			return 6;
		elseif rand <= 95 then
			return 7;
		else
			return 8;
		end
	end
end


