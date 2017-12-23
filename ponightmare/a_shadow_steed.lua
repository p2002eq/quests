--a_shadow_steed
--Mujaki the Devourer Event
--ponightmare

function event_death_complete(e)
	if e.self:GetX() > 100 and e.self:GetX() < 1200 and e.self:GetY() > -3050 and e.self:GetY() < -2000 then	--instance #1 boundaries
		eq.signal(204039, 100); 	--signal Mujaki to start event
	end
end