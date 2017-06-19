--#Aten_Ha_Ra (NPC ID# 158465)
--Zone:  vexthal

--script for (Destroy) Aten

function event_spawn(e)
     eq.set_timer("atenha",1);
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);
	if (e.timer == "atenha" and qglobals["aten"] ~= nil) then  --resets qglobal if needed
			eq.stop_timer("atenha");
			eq.depop_with_timer();
			eq.set_global("aten",nil,3,F);
	end
end

function event_death_complete(e)
	eq.set_global("aten","1",3,"H132");  --sets global for 5.5 day respawn time
end