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
	EventReset();
end

function event_signal(e)
	if e.signal == 1 then		--signal from Witchdoctor death or on failed player check
		EventReset();
		eq.zone_emote(2,"Event Complete!");  --debug
	elseif e.signal == 10 then		
		if not started then 
			e.self:Shout("Kill signal received!  1 min left to kill remaining apprentices");  --debug
			started = true;
			eq.set_timer("apprentices",3 * 1000);  --checks to verify all apprentices are dead to start event
		end
	elseif e.signal == 20 then
		local WD = eq.get_entity_list():GetNPCByNPCTypeID(154401);
		WD:Emote("staggers as the elemental energies drain from his body.")
	end
end

function event_timer(e)
	if e.timer == "apprentices" then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154423) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154115) then
			eq.stop_timer(e.timer);
			eq.set_timer("event_start",1);
		elseif counter == 20 then	--allows 1 minute to have all apprentices dead or timer will reset
			eq.stop_timer(e.timer);
			eq.zone_emote(4,"Apprentices not killed within timer.  Resetting Event");  --debug
			EventReset();
		else
			counter = counter + 1;
			eq.zone_emote(8,"Spawn check counter: " .. counter .. " (Event will reset at 20)" );  --debug
		end
	
	elseif e.timer == "event_start" then
		eq.stop_timer(e.timer);
		eq.set_timer("boss", boss_timer * 1000);  --sets time for boss is triggered
		eq.set_timer("player_check", 30 * 1000);  --player check every 30 seconds		
		eq.spawn2(154401,0,0,432.2,-297,39,128.6)  --spawn untargetable Witchdoctor		
		local WD = eq.get_entity_list():GetNPCByNPCTypeID(154401);	--gets untargetable Witchdoctor for emote
		WD:Shout("Summoners!  Make haste and focus your elemental powers to me at once!  We have tresspassers that must be dealt with!");		
		eq.signal(154392,10); 	--signals summoners to become targetable
		eq.signal(154393,10); 	--signals summoners to become targetable
		eq.signal(154394,10);	--signals summoners to become targetable
		eq.signal(154395,10);	--signals summoners to become targetable		
	elseif e.timer == "player_check" then
		eq.zone_emote(5,"PLAYER CHECK")	--debug
		if started and not player_check(e.self,100) then
			EventReset();
			eq.zone_emote(5,"PLAYER CHECK IS FALSE")	--debug
		end
	elseif e.timer == "boss" then
		eq.stop_timer(e.timer);
		eq.spawn2(154391,0,0,432.2,-297,39,128.6)  --spawn real Witchdoctor
		eq.depop(154401);	--depop untargetable Witchdoctor
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

function EventReset()
	eq.zone_emote(6,"EVENT RESET")	--debug
	eq.stop_all_timers();
	started = false;
	eq.signal(154392,99); 	--signals summoners to deactivate if previously targetable
	eq.signal(154393,99); 	--signals summoners to deactivate if previously targetable
	eq.signal(154394,99);	--signals summoners to deactivate if previously targetable
	eq.signal(154395,99);	--signals summoners to deactivate if previously targetable
	counter = 0;
	eq.depop(154401);  		--depop Witchdoctor PH if previously spawned while mid-ring event.  Real Witchdoctor has his own depop timer
end



