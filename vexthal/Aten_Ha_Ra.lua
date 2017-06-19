--Aten_Ha_Ra (NPC ID# 158436)
--Zone:  vexthal

--script for Real (Non-Destroy) Aten

function event_spawn(e) 
     eq.set_timer("depop",5.5*24*60*60*1000);  --sets depop for 5.5 days if real AHR is spawned and not killed
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_death_complete(e)
	eq.set_global("aten","1",3,"H132"); --sets global for 5.5 day respawn time
end


