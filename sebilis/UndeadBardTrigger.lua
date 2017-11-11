--Undead Bard Trigger
--zone:  sebilis

function event_spawn(e)
	eq.set_timer("timer_check",60*1000); --check routine every minute
end

function event_signal(e)
	local qglobals = eq.get_qglobals(e.self);
	
    --eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --trak dead
		eq.set_global("UDB_timer", "0", 3, "F")  --qglobal duration does not matter since qglobal will be removed when necessary
        eq.stop_timer("timer_check");
		eq.set_timer("timer_check", 60*1000);	--timer set for 1 min
    end
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.timer == "timer_check") then
		if qglobals.UDB_timer ~= nil and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(89168) then --qglobal should be nil if trak is up or if undead bard has been triggered and killed
			eq.set_global("UDB_timer", tostring(tonumber(qglobals.UDB_timer) + 1),3,"F");	--increment counter every minute until 1440 minutes (24hrs)
						
			--sets timer limit to check for spawning UDB
			if tonumber(qglobals.UDB_timer) >= 1440  then --24 hrs for counter and verifies UDB is not already triggered
				eq.unique_spawn(89168,0,0,-699,-2079,-141); --spawn UDB
			end
		end
	end
end