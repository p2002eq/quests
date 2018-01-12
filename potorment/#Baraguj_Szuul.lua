--#Baraguj_Szuul (207309)
--Fake version (ports players to start mouth event)
--potorment

function event_spawn(e)
	eq.set_timer("depop", 60 * 1000);
end

function event_timer(e)
	if e.timer == "depop" then 
		if not e.self:IsEngaged() then
			eq.depop_all(207028);	--Baraguj_Szuul - shouldn't be needed, but will depop incase for some reason trigger version is up
			eq.get_entity_list():GetSpawnByID(346955):Repop(5)	--Baraguj_Szuul (207028) repop
			eq.depop();
		else
			eq.stop_timer(e.timer)
			eq.set_timer("depop", 15 * 1000);
		end
	end
end