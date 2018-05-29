--#_A_Custodian_of_Marr (Rydda`Dar Trigger)
--Trydan Faye (Trial #1 - Rydda`Dar)
--hohonora

function event_spawn(e)
	eq.set_timer("depop",2*60*60*1000);	--2hr timer
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(211105,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --#Rydda`Dar (211105)
end

