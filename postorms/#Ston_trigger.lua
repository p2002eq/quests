--#Ston_trigger (210479))
--Trigger for  Ston`Ruak,_Ancient_of_Trees (210469)
--postorms

local started = false;

function event_spawn(e)
	started = false;
end

function event_signal(e)
	if e.signal == 0 then
		if not trash_check() and not started then
			SpawnEvent();
			started = true;
		elseif not trash_check() and not event_mob_check() and started then
			eq.unique_spawn(210469,0,0,-202,670,-370,165); --Ston`Ruak,_Ancient_of_Trees (210469)
			eq.depop_with_timer();
		end
	elseif e.signal == 99 then	--event reset
		started = false;
		eq.depop_all(210465);
		eq.depop_all(210481);
	end
end

function trash_check()	--iterate through related NPC ids to verify tree mobs are clear
	local mob_table = {210088,210087,210464};	--a_Koka`Vor_krovian (210088), a_Koka`Vor_senvar (210087), a_Koka`Vor_Chieftain (210464)

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end

function event_mob_check()	--iterate through related NPC ids to check if triggered event mobs are dead
	local mob_table = {210465,210481};	--#a_Koka`Vor_Elder (210465), #a_Koka`Vor_Chieftain (210481)

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end

function SpawnEvent()
	--Ston`Ruoak spawn room
	eq.spawn2(eq.ChooseRandom(210465,210481),0,0,-235,648,-369,167);
	eq.spawn2(eq.ChooseRandom(210465,210481),0,0,-180,640,-369,186);
	eq.spawn2(eq.ChooseRandom(210465,210481),0,0,-229,729,-369,91);
	eq.spawn2(eq.ChooseRandom(210465,210481),0,0,-164,700,-369,165);		

	--NW spot
	eq.spawn2(eq.ChooseRandom(210465,210481),0,0,214,1432,-369,223);
	eq.spawn2(eq.ChooseRandom(210465,210481),0,0,185,1317,-369,20);
	eq.spawn2(eq.ChooseRandom(210465,210481),0,0,212,1373,-369,218);
	eq.spawn2(eq.ChooseRandom(210465,210481),0,0,263,1337,-369,217);
end