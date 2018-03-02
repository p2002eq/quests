--#the_grimling_archmage in AC  #154103

local started = false

function event_spawn(e)
	started = false;
end

function event_signal(e)
	if e.signal == 1 then
		eq.spawn2(154388,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());  --spawns AM
		eq.depop_with_timer();
	elseif e.signal == 99 then	--signal from elite guards death
		npc = eq.get_entity_list():IsMobSpawnedByNpcTypeID(154099)  -- checks to see if elite guard is dead
		if not npc then 
			eq.set_timer("check",1);
		end
	end
end


function event_timer(e)
	if e.timer == "check" then
		if not started and player_check(e.self,30) then 
			eq.stop_timer(e.timer);
			eq.set_timer("check",15*1000);  --sets future player checks every 30 seconds
			started = true;
			eq.signal(154104,99);	--signal archmage trigger for event to start
			e.self:Shout("Master! The intruders have interrupted my sacred work! I beg, send minions to my aid!");
		elseif started and not player_check(e.self,75) then
			eq.stop_timer(e.timer)
			eq.signal(154104,1);
			eq.depop_with_timer();
		end
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


function event_death_complete(e)
	eq.signal(154104,1) -- send signal to event trigger that event can be reset
end
