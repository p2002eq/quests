--#Witchdoctor_Gnorgtarg  Event (Inner AC) #154404

--[[ELEMENTAL IMMUNE SUMMONER LISTING BY NPC ID
MR:	154393
FR:	154394
CR:	154392
PR:	154395
]]

local started = false;
local boss_timer = 10 * 60 -- set timer for boss spawn after event start (default 10 min (10 x 60)
local counter = 0;




function event_spawn(e)
	eq.set_timer("reset",5*1000);
end

function event_signal(e)
	if e.signal == 1 then		--signal from Witchdoctor death or on failed player check
		EventReset();
	elseif e.signal == 10 then		
		if not started then 
			started = true;
			eq.set_timer("apprentices",3 * 1000);  --checks to verify all apprentices are dead to start event
		end
	elseif e.signal == 20 then
		local WD = eq.get_entity_list():GetNPCByNPCTypeID(154401);
		WD:Emote("staggers as elemental energies drain from his body.")
	elseif e.signal == 99 then	--signal for Khati Sha event start (removes witchdoctor related event mobs)
		eq.stop_all_timers();
		started = true;
		eq.depop_all(154392);	--depop summoners
		eq.depop_all(154393);
		eq.depop_all(154394);
		eq.depop_all(154395);
		eq.set_timer("reset",15*60*1000);
	end
end

function event_timer(e)
	if e.timer == "apprentices" then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154423) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154115) then
			eq.stop_timer(e.timer);
			eq.set_timer("event_start",1);
		elseif counter == 20 then	--allows 1 minute to have all apprentices dead or timer will reset
			eq.stop_timer(e.timer);
			EventReset();
		else
			counter = counter + 1;
		end
	
	elseif e.timer == "event_start" then
		eq.stop_timer(e.timer);
		eq.set_timer("boss", boss_timer * 1000);  --sets time for boss is triggered
		eq.set_timer("player_check", 30 * 1000);  --player check every 30 seconds		
		eq.set_timer("adds", 15 * 1000); 	--initial timer is short
		eq.unique_spawn(154401,0,0,432.2,-297,39,128.6)  --spawn untargetable Witchdoctor		
		local WD = eq.get_entity_list():GetNPCByNPCTypeID(154401);	--gets untargetable Witchdoctor for emote
		WD:Shout("Summoners!  Focus your elemental powers to me at once!  We have tresspassers that must be dealt with!");		
		eq.signal(154392,10); 	--signals summoners to become targetable
		eq.signal(154393,10); 	--signals summoners to become targetable
		eq.signal(154394,10);	--signals summoners to become targetable
		eq.signal(154395,10);	--signals summoners to become targetable		
	elseif e.timer == "player_check" then
		if started and not player_check(e.self,100) then
			EventReset();
		end
	elseif e.timer == "adds" then
		eq.stop_timer(e.timer);
		eq.set_timer("adds", 60 * 1000);  --60 seconds on waves
		spawn_mob(154406,1);	--#an_enraged_apprentice (154406)
		spawn_mob(154406,2);	--#an_enraged_apprentice (154406)
		spawn_mob(154406,3);	--#an_enraged_apprentice (154406)
	elseif e.timer == "boss" then
		eq.stop_timer(e.timer);
		eq.unique_spawn(154391,0,0,432.2,-297,39,128.6)  --spawn real Witchdoctor
		eq.depop(154401);	--depop untargetable Witchdoctor
	elseif e.timer == "reset" then
		EventReset();
	end
end

function player_check(npc,dist)
	-- checks for players
	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do
			if player:CalculateDistance(npc:GetX(),npc:GetY(),npc:GetZ()) <= dist and not player:GetFeigned() then
				return true; -- player is within triggering range of archmage and not FD
			end
		end
	end
	return false; -- if nothing checks out, returns false
end

function spawn_mob(NPCID, loc)

	local spawn_loc = { [1] = {433,-338,36,260}, [2] = {393,-298,36,63}, [3] = {433,-258,36,128} };
	local count = math.random(1,3);	--up to 3 adds per spawn location
	
	for n = 1,count do
		mobz = eq.spawn2(NPCID,0,0,spawn_loc[loc][1] + math.random(-10,10) ,spawn_loc[loc][2] + math.random(-10,10) ,spawn_loc[loc][3],spawn_loc[loc][4]);
	end	

end

function EventReset()
	eq.stop_all_timers();
	started = false;
	SpawnSummoners();		--repops summoners if not already up
	eq.signal(154392,99); 	--signals summoners to deactivate if previously targetable
	eq.signal(154393,99); 	--signals summoners to deactivate if previously targetable
	eq.signal(154394,99);	--signals summoners to deactivate if previously targetable
	eq.signal(154395,99);	--signals summoners to deactivate if previously targetable
	counter = 0;
	eq.depop(154401);  		--depop Witchdoctor PH if previously spawned while mid-ring event.  Real Witchdoctor has his own depop timer
end

function SpawnSummoners()
	eq.unique_spawn(154392,0,0,442,-297,37,195);	--cold
	eq.unique_spawn(154393,0,0,433,-306,37,0);		--magic
	eq.unique_spawn(154394,0,0,425,-297,37,65);		--fire
	eq.unique_spawn(154395,0,0,433,-289,37,130);	--poison
end


