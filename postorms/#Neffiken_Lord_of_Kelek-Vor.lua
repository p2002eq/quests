--#Neffiken_Lord_of_Kelek'Vor
--ID: 210229
--Zone: PoStorms

function event_spawn(e)
	eq.set_timer("engage", 20*60*1000);   --20 min to engage
end

function event_combat(e)
	eq.stop_timer("engage");
	eq.set_timer("battle", 45*60*1000);   --45 min to kill
end

function event_timer(e)
	if e.timer == "engage" then  --if he was never engaged, respawns fake lord
		eq.stop_timer(e.timer);
		eq.spawn2(210176,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	elseif e.timer == "battle" then 	--if he was not killed in time, despawns
		eq.depop();
	end
end


