--a_blazing_mephit (210458)
--part of Relv The Mysterious/Falto,Lord_of_Thunder event
--script to spawn three a_fiery_mepheeka adds on death
--postorms

function event_spawn(e)
	e.self:AI_SetRoambox(eq.ChooseRandom(100,150,200,250),0,-1000,6000,4900);	--set random distance intervals
end

function event_death_complete(e)
	eq.signal(210484,0);	--#Falto_trigger (210484)
	for n = 1,3 do
		eq.spawn2(210460,0,0,e.self:GetX() + math.random (-15,15), e.self:GetY() + math.random(-15,15), e.self:GetZ()+5, e.self:GetHeading());	--a_fiery_mepheeka (210460)
	end
end