--Vallon_Zek (214295)
--Real Vallon_Zek
--potactics

local final_round;

function event_spawn(e)
	final_round = false;
	eq.signal(214303,1,1*1000);		--#vz_controller (214303)
	if e.self:GetSpawnPointID() == 369024 then
		e.self:SetLevel(75);
	end
end

function event_combat(e)
	if e.joined then 
		eq.set_next_hp_event(61);
	end
end

function event_hp(e)
	if e.hp_event == 61 and not final_round then
		eq.signal(214303,10);	--#vz_controller (214303)
		e.self:Emote("fades into the shadows as five figures take shape around you.");
		eq.depop_with_timer();
	end
end

function event_signal(e)	--send signal to controller to get event stage
	if e.signal == 1 then	--returned signal that event not yet at final phase
		final_round = false;
	elseif e.signal == 2 then	--returned signal for final phase
		final_round = true;
	end
	eq.set_timer("reset", 20 * 60 * 1000);
end

function event_timer(e)
	if e.timer == "reset" then
		if not e.self:IsEngaged() then
			eq.signal(214303,99)	--signal #vz_controller to reset
			eq.get_entity_list():GetSpawnByID(369024):Repop(5)
			eq.depop_all(214300); --depop fake VZs
			eq.depop();
		else
			eq.stop_timer(e.timer);
			eq.set_timer("reset", 30 * 1000);	--check every 30 seconds to see if disengaged
		end
	end
end
		

function event_death_complete(e)
	eq.spawn2(214304,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	--A_Planar_Projection (214304)
	eq.signal(214303,99)	--signal #vz_controller to reset
end

