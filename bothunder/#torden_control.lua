--#torden_control (209160)
--zone: bothunder

function event_spawn(e)
	eq.set_timer("monitor", 1 * 1000);
end

function event_timer(e)
	if e.timer == "monitor" then
		eq.stop_timer(e.timer);
		eq.set_timer("monitor", 30 * 1000);
		CheckMinis();
	end
end

function CheckMinis()	--If Agnarr is up then this will respawn the minis if down.  Mini's will respawn 6 hrs after death if Agnarr is still up.  Otherwise will respawn once Agnarr is back up
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(209053) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(209026) then	
		eq.unique_spawn(209053,0,0,-1104,-1733,1746,64);	--Emmerik_Skyfury (209053)
	end
	
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(209054) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(209026) then
		eq.unique_spawn(209054,0,0,-1121,-1731,1280,64);	--Evynd_Firestorm (209054)
	end
end

function event_signal(e)
	if e.signal == 1 then	--signal from Evynd_Firestorm's death 
		eq.depop_with_timer();	--6 hr repop
	end
end