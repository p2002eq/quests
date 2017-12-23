-- NPCID: Bastion of Thunder >> A_storm_portal_ (209034)

function event_signal(e)	--signals from Emmerik_Skyfury (209053)
	if e.signal == 1 then
		eq.set_timer("storm_portal_adds", 30 * 1000);	--timer to spawn adds every 30 seconds
	elseif e.signal == 2 then
		eq.stop_timer("storm_portal_adds");		--stop making adds
	end
end

function event_timer(e)
	if e.timer == "storm_portal_adds" then
		eq.spawn2(209103,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --spawn --A_storm_guardian
	end
end


