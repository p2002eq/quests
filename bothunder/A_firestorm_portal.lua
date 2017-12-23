--NPCID: Bastion of Thunder >> A_firestorm_portal (209038)
function event_signal(e)	
	if e.signal == 1 then	--signals from Evynd_Firestorm (209054)		
		eq.set_timer("firestorm_portal_adds",30*1000);	--timer to spawn adds every 30 seconds
	elseif e.signal == 2 then
		eq.stop_timer("firestorm_portal_adds"); --stop spawning
	end
end

function event_timer(e)
	if e.timer == "firestorm_portal_adds" then		
		eq.spawn2(209037,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());  --spawn A_storm_guardian_
	end
end
