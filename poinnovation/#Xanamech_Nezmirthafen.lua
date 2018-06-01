--#Xanamech_Nezmirthafen (206067)
--TARGETABLE VERSION
--poinnovation

function event_spawn(e)
	eq.set_timer("depop", 30 * 60 * 1000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.get_entity_list():GetSpawnByID(369168):Repop(1);	--Failed attempt - repop fake Xanamech
		eq.depop();
	end
end