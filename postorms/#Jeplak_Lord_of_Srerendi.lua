--#Jeplak_Lord_of_Srerendi
--ID: 210231
--Zone: Postorms

function event_spawn(e)
	eq.set_timer("engage", 20*60*1000);   --20 min to engage
end

function event_combat(e)
	eq.stop_timer("engage");
	eq.set_timer("battle", 45*60*1000);   --45 min to kill
	eq.spawn2(210233,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--spawn a mangled traveller
    eq.spawn2(210234,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--spawn a lost soul
end

function event_timer(e)
	if e.timer == "engage" then  --if he was never engaged, respawns fake lord
		eq.stop_timer(e.timer);
		eq.spawn2(210179,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	elseif e.timer == "battle" then 	--if he was not killed in time, despawns
		eq.depop();
	end
end

