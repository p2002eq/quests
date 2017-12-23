--NPCID: Bastion of Thunder > Emmerik_Skyfury (209053)
function event_combat(e)
	--tell A_storm_portal_ I have engaged
	eq.signal(209034,1,1);	
	-- create a timer to check if I have lost all aggro and need to reset the event
	eq.set_timer("emmerik_aggro_check", 60*1000);	
end

function event_death_complete(e)
	--spawn --Askr_the_Lost_ to port players to the next floor
	eq.spawn2(209102,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); 
	--tell the A_storm_portal_ I have died
	eq.signal(209034,2,1); 
end

function event_timer(e)
	if e.timer == "emmerik_aggro_check" then
		if not e.self:IsEngaged() then
			-- if I have no aggro stop the portals from spawning adds
			eq.signal(209034,2,1); 
			--depop the portal adds
			eq.depop_all(209103);
			eq.stop_timer("emmerik_aggro_check");
		end
	end
end