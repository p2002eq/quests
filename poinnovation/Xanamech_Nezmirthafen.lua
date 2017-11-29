--Xanamech_Nezmirthafen (NPCID 206068)
--UNTARGETABLE VERSION
--poinnovation


function event_spawn(e)
	eq.set_timer("sleep", 3 * 1000);
end

function event_timer(e)
	e.self:SetAppearance(3);	--sleep position
	eq.stop_timer(e.timer);
end