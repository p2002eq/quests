-- NPCID: Bastion of Thunder >> Evynd_Firestorm (209054)
function event_combat(e)
	-- tell the A_firestorm_portal I have engaged
	eq.signal(209038,1,1);
	-- create a timer to check if I have lost all aggro and need to reset the event
	eq.set_timer("evynd_aggro_check",60 * 1000);
end

function event_death_complete(e)
	-- spawn --Askr_the_Lost to port players to the next floor
	eq.spawn2(209101,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	-- tell the A_firestorm_portal I have died
	eq.signal(209038,2,1);
end

function event_timer(e)
	if e.timer == "evynd_aggro_check" then
		if not e.self:IsEngaged() then
			-- if I have no aggro stop the portals from spawning adds
			eq.signal(209038,2,1);
			--depop the firestorm portal adds.
			eq.depop_all(209037);
			eq.stop_timer("evynd_aggro_check");
		end
	end
end
		