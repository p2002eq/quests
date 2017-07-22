-- #RoF_spawner (154372) for Ring of Fire in Acrylia
--Original script written by Kalaylus

-- NPCs used in event
trash_mobs = { 154353, 154354, 154355, 154356, 154363 } -- 50 war, 50 SK, 55 war, 55 sk, priest
boss_mobs = { 154357, 154358, 154359, 154360, 154361, 154362 } -- Battlelord, Battlemaster, Warmonger, Warlord, Warmaster, Underking
grims = { 154374, 154375, 154376 } -- untargettable grims
warder = 154377 -- 2857 is the banish spell

-- locations used in event, using {x,y,z,h} format
-- trash_spawns = randomly inside the ring
boss_locs = { {-83, 13, -29, 0}, {-104, 62, -30, 0} } -- Only final wave boss spawns out here
grim_locs = { {-86, 99, -30, 172}, {-100, 112, -29, 147}, {-139, 102, -29, 96}, {-135, 59, -29, 26} }
warder_loc = { -96, -15, -30, 15 }
local wave = 0;
local round = 0;

function event_spawn(e)
	reset_event();
end

function event_enter(e)
	if not started then
		eq.clear_proximity();
		setup_event();
	end
end

function event_timer(e)
	eq.stop_timer(e.timer);
	if e.timer == 'main' then
		if player_check() then
			local next_timer = process_wave(); -- increments round/wave counters, spawns wave, returns timer for next wave
			eq.set_timer('main', next_timer * 1000);
		else
			reset_event();
		end
	end
end

function process_wave()
	local tim_ret;
	-- logic for all of the waves
	wave = wave + 1; -- wave always increments!
	eq.zone_emote(154,"Round #" .. round .. " Wave #" ..wave);
	if round == 0 then
		round, wave = 1, 1;
		spawn_trash(round);
		return 10;
		--return 120;
	elseif round == 1 then
		if wave < 10 then
			spawn_trash(round);
			return 10;
			--return 120;
		else
			spawn_boss(round);
			round, wave = end_round(round, wave);
			return 30;
			--return 300;
		end
	elseif round == 2 then
		if wave < 7 or (wave > 7 and wave < 14) then
			spawn_trash(round);
			return 10;
			--return 90;
		elseif wave == 7 then
			spawn_mini();
			return 10;
			--return 90;
		else
			spawn_boss(round);
			round, wave = end_round(round, wave);
			return 30;
			--return 300;
		end
	elseif round >= 3 and round <= 6 then
		if wave == 20 then
			spawn_boss(round);
			round, wave = end_round(round, wave);
			return 30;
			--return math.random(300, 500);
		elseif wave % 5 == 0 then
			spawn_mini();
			return 10;
			--return 60;
		else
			spawn_trash(round);
			return 10;
			--return 60;
		end
	else -- should only get here if round > 6 i.e. event is over!
		reset_event();
		return 1;	--avoids returning nil value error on main timer
	end
	
end

function end_round(rnd, wav)
	return rnd + 1, 0;
end

function spawn_mini()
	local x, y, z, h = math.random(-124, -110), math.random(74, 90), -27, math.random(255);
	local mob = eq.ChooseRandom(boss_mobs[1], boss_mobs[2]);
	eq.spawn2(mob, 0, 0, x, y, z, h);
end

function spawn_trash(rnd)
	-- spawn trash based on what round it is
	local mob_count = 0;
	if rnd <= 3 then
		mob_count = math.random(1,3);
	elseif rnd == 4 or rnd == 5 then
		mob_count = math.random(2,4);
	elseif rnd == 6 then
		mob_count = math.random(2,5);
	end
	
	for i=1,mob_count do
		local x, y, z, h = math.random(-124, -110), math.random(74, 90), -27, math.random(255);
		local mob;
		if rnd <= 4 then
			mob = eq.ChooseRandom(trash_mobs[1], trash_mobs[2]);
		elseif rnd == 5 then
			mob = eq.ChooseRandom(trash_mobs[3], trash_mobs[4]);
		elseif rnd == 6 then
			mob = eq.ChooseRandom(trash_mobs[3], trash_mobs[4], trash_mobs[5]);
		end
		
		eq.spawn2(mob, 0, 0, x, y, z, h);
	end
end

function spawn_boss(rnd)
	local boss = eq.spawn2(boss_mobs[rnd], 0, 0, unpack(boss_locs[1]));
	boss:Say("I now serve the master of the grimling horde. You too shall be reborn!");
	--boss:CastToNPC():MoveTo(unpack(boss_locs[2]), true);
	boss:CastToNPC():MoveTo(-104,62,-30,0, true);
end

function reset_event()
	cleanup();
	round = 0;
	wave = 0;
	started = false;
	eq.set_proximity(-124, -110, 74, 90);
end

function setup_event()
	eq.local_emote({-120, 80, -25}, 15, 150, "As you step into the grimlings' ring of fire, a hot breeze blows into the cavern and begins swirling about you. The grimlings' constant chanting seems to grow louder...")
	
	for _,v in pairs(grim_locs) do -- spawn untargettable grims
		local mob = eq.ChooseRandom(unpack(grims));
		eq.spawn2(mob, 0, 0, unpack(v));
	end
	eq.spawn2(warder, 0, 0, unpack(warder_loc));
	
	eq.set_timer('main', 1000); --initial timer is short!
	started = true;
end

function cleanup()
	eq.stop_all_timers();
	eq.signal(warder,1,3*1000);
	--eq.depop_all(warder); -- depop warder
	for _, v in pairs(grims) do -- depop grims
		eq.depop_all(v);
	end
end

function player_check()
	-- checks for players
	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do
			if player:CalculateDistance(-118, 81, -26) <= 15 and not player:GetFeigned() then
				return true; -- if player within 1 and not FD, return true
			end
		end
	end
	
	return false; -- if nothing checks out, returns false
end
