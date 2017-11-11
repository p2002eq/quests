--Venril Sathir Remains Trigger
--zone: karnor

function event_spawn(e)
	eq.set_timer("timer_check",60*1000); --check routine every minute
end

function event_signal(e)
	local qglobals = eq.get_qglobals(e.self);
	
    --eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --VS dead
		eq.set_global("VSR_timer", "0", 3, "F")  --qglobal duration does not matter since qglobal will be removed when necessary
        eq.stop_timer("timer_check");
		eq.set_timer("timer_check", 60*1000);	--timer set for 1 min
    end
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.timer == "timer_check") then
		if qglobals.VSR_timer ~= nil and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(102099) then --qglobal should be nil if VS is up or if VSR epic hand-in has been completed
			eq.set_global("VSR_timer", tostring(tonumber(qglobals.VSR_timer) + 1),3,"F");	--increment counter every minute until 1440 minutes (24hrs)
						
			--sets timer limit to check for spawning VSR
			if tonumber(qglobals.VSR_timer) >= 2  then --24 hrs for counter and verifies VS is not already triggered
				eq.unique_spawn(102099,0,0,-559,-77,19); --spawn vsr
			end
		end
	end
end