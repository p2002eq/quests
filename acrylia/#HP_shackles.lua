--High Priest Event in Acrylia Caverns (NPCID #: 154109)

--NPC definitions
grimlings = {	154353, 	--lvl 50 warrior
				154354,		--lvl 50 SK
				154355, 	--lvl 55 warrior
				154356, 	--lvl 55 SK
				154363,		--lvl 55 cleric
				154402};	--lvl 55 wiz
				
local sacrifice = nil;

local initial = 30;  --initial time to check if player is in proximity for event start (30sec default)
local wave_timer = 3 * 60;  --set in seconds for total wave timer  (3 min default)
local delay = 15 --set in seconds to provide delay between HP dialogue between waves and minions spawning (15 seconds default)
local wave = 0;
local started = false;

function event_spawn(e)		--Proximity Area Spawned
	EventReset();
end

function event_enter(e)
	if not started and eq.get_entity_list():IsMobSpawnedByNpcTypeID(154107) then		
		sacrifice = e.other:CharacterID();
		eq.set_timer("player_check",initial*1000); 	--initial player check to start event is longer
	elseif started then
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(154390) then
			eq.signal(154390,2);  --depop named HP if active
		else
			eq.signal(154107,2);  --deactivate HP if active
		end
		HPShout(true); --announce resetting of ring
		EventReset();
	end
end

function player_check(e)
	-- checks for players
	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do
			if player:CalculateDistance(40, -726, 11) <= 10 and player:CharacterID() == sacrifice then
				if not player:CastToMob():IsRooted() then
					eq.get_entity_list():GetMobByNpcTypeID(154108):CastSpell(2860, player:GetID(),0,0,0,0,0,0,-2000);  --#High Priest Gakkernog casting animation
				end
				return true; -- if player within 1 and not FD, return true
			end
		end
	end
	return false; -- if nothing checks out, returns false
end

function event_timer(e)
	if (e.timer == "player_check") then
			if wave == -1 then
				eq.stop_timer("player_check");
			elseif not player_check() then
				eq.stop_timer(e.timer);
				HPShout(true); --announce resetting of ring
				EventReset();
			elseif not started then		--Start Event
				eq.stop_timer("player_check");
				eq.set_timer("player_check",1000);
				eq.set_timer("waves",15 * 1000);  --first timer is short
				started = true
				HPShout();  --initial shout for event start
				eq.clear_proximity();
				eq.set_proximity(100, 125, -640, -615);
			end
	elseif (e.timer == "waves") then
		wave = wave + 1;
		if wave == 1 then
			eq.stop_timer(e.timer);
			eq.set_timer("waves", wave_timer * 1000)  -- sets time between waves
		end
		
		if (wave == -1) then
			eq.stop_timer(e.timer)
			return false;
		elseif wave <= 5 then
			spawn_mob(grimlings[1],1);		
			spawn_mob(grimlings[2],2);
		elseif wave == 6 then 
			HPShout();
			eq.set_timer("waves", delay * 1000);
		elseif wave <= 11 then
			eq.set_timer("waves", wave_timer * 1000)  -- sets time between waves
			spawn_mob(grimlings[math.random(3,6)],1);		
			spawn_mob(grimlings[math.random(3,6)],2);
		elseif wave == 12 then 
			HPShout();
			eq.set_timer("waves", delay * 1000);			
		elseif wave <= 17 then
			eq.set_timer("waves", wave_timer * 1000)  -- sets time between waves
			spawn_mob(grimlings[math.random(3,6)],1);		
			spawn_mob(grimlings[math.random(3,6)],2);			
			spawn_mob(grimlings[math.random(3,6)],3);						
		elseif wave == 18 then
			eq.stop_timer(e.timer);
			HPShout();
			wave = -1;
			eq.set_timer("HP",delay*1000);			
		end
	elseif e.timer == "HP" then
		eq.stop_timer(e.timer);	
		player = eq.get_entity_list():GetClientByCharID(sacrifice)
		
		--random roll to see if named HP will spawn.  
		local roll = math.random(1,10);
		if roll >= 7 then
			boss = 154390;		--#High Priest Gakkernog
			eq.depop_with_timer(154107); --depop grimling_high_priest
			eq.unique_spawn(boss,0,0,142,-690,2.3,65);  --spawn #High Priest Gakkernog
		else
			boss = 154107;		--#grimling_high_priest
		end
			
		player:MovePC(154, 150, -690, 2, 192);
		player:Message(15,"You have been summoned!");
		eq.signal(boss,sacrifice);	--signal to hp to aggro the assigned PC sacrifice after summon
	end
end

function HPShout(restart)
	local hp = eq.get_entity_list():GetMobByNpcTypeID(154107);
	if restart then
		hp:Shout("Master! The tresspassers have interrupted our sacred ritual.  We must restart!");
	elseif wave == 0 then
		hp:Shout("Master, intruders have wandered into our sacred altar! I beg, grant me power to make them a worthy sacrifice!");
	elseif wave == 6 then
		hp:Shout("Master, the intruders are powerful. I beg, send stronger minions!");
	elseif wave == 12 then
		hp:Shout("Master, the tresspassers persist. I beg, make them pay for their foolishness!");
	elseif wave == 18 then
		hp:Shout("Master! The minions have failed. I beg, empower me to rid the realm of the vile unbelievers!");
	end
	
end

function spawn_mob(NPCID, loc)
	local xloc = { 156,  156,  152};
	local yloc = {-737, -719, -728};
	local zloc = {   2,    2,    2};
	local hloc = { 194,  194,  194};
	
	mobz = eq.spawn2(NPCID,0,0,xloc[loc] ,yloc[loc] ,zloc[loc],hloc[loc]);
	mobz:AddToHateList(eq.get_entity_list():GetClientByCharID(sacrifice));
end

function event_signal(e)
	if e.signal == 1 then		--signal from HP death
		EventReset();
		cleanup();
	end
end

function EventReset()	
	wave = 0;
	started = false;
	sacrifice = nil;
	eq.clear_proximity();
	eq.set_proximity(36, 45, -730, -720);
	cleanup();

end

function cleanup()
	eq.stop_all_timers();
end

