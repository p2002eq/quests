--#_Carprin_Deatharn (200007)
--Version with Guards
--codecay

local spawn;
local guards = {200221,		--Fran_Prisoal (200221)
				200222,		--Breddan_Rutyl (200222)
				200223}; 	--Abroan_Drian (200223)
				
local guard_locs = {[1] = {375,-110,-59,0},
					[2] = {387,-131,-59,0},
					[3] = {387,-92,-59,0} };

function event_spawn(e)
	spawn = false;		--guard adds
	eq.depop(200264);	--depop #Carprin_Deatharn (200264) if spawned
	depop_guards();		--depop guards if needed
end

function event_combat(e)
	if e.joined then
		eq.set_timer("blur", math.random(6,12) * 1000);	--set frequency for memblur
		if not spawn then
			eq.set_timer("reset", 10 * 60 * 1000); 		--10 min reset
			spawn_guards(e,false,e.self:GetHateTop());
			spawn = true;
		end
	else
		eq.stop_timer("blur");
	end
end

function event_timer(e)
	if e.timer == "reset" then
		if not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
			spawn = false;
			depop_guards();
		else
			eq.set_timer("reset",15 * 1000);	
		end
	elseif e.timer == "blur" and player_check(e) then	--checks to ensure player within aggro range before wiping hatelist
		eq.stop_timer(e.timer);
		eq.set_timer("blur", math.random(6,12)*1000);
		e.self:WipeHateList();
	end
end

function event_signal(e)
	if e.signal == 1 then
		 if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(200221) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(200222) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(200223) then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "A scream of rage engulfs the crypt as the last vestiges of the shield of dark force surrounding Carprin Deatharn fades away.");
			eq.unique_spawn(200264,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --#Carprin_Deatharn (200264)
			eq.depop_with_timer();
		end
	end
end

function event_death_complete(e)	--Carprin should never die if all 3 guards are killed first at the same time.  If he is killed before his guards then he will respawn with his guards
	eq.unique_spawn(200264,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); --#Carprin_Deatharn (200264)
	spawn_guards(e,true,e.self:GetHateTop());
end

function spawn_guards(e,loc,target)	--if loc is true then mob spawns randomly on mob location rather than at spawn
	for n = 1,3 do
		if not loc then
			guard = eq.unique_spawn(guards[n],0,0,unpack(guard_locs[n]));
			guard:AddToHateList(target,1);
		else
			guard = eq.unique_spawn(guards[n],0,0,e.self:GetX() + math.random(-10,10), e.self:GetY() + math.random(-10,10), e.self:GetZ(), e.self:GetHeading());
			guard:AddToHateList(target,1);
		end
	end
end

function depop_guards()
	for n = 1,3 do
		eq.depop_all(guards[n]);
	end
end

function player_check(e)
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 30 and not client:GetFeigned() then
				return true; --client in range
			end
		end
	end
	return false;
end