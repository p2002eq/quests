--A_Vekerchiki_Warrior (218025)
--depop script for trap mob version
--poeartha

function event_combat(e)
	if e.self:GetSpawnPointID() == 0 then	--only applies to trap spawned mobs
		if e.joined then
			eq.stop_timer("depop");
		else
			eq.set_timer("depop", 15 * 60 * 1000);
		end
	end
end

function event_timer(e)	--only spawned mobs should ever hit timer check
	if e.timer == "depop" then
		eq.depop();
	end
end