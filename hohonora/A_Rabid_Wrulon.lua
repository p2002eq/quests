--A_Rabid_Wrulon (211044)
--script to spawn #A_Rabid_Wrulon_Pup adds on death
--hohonora

function event_death_complete(e)
	local rand = math.random(1,100);
	local mob_count = 0;
	
	if rand <= 40 then	--get random mob count 60% chance of 2, 40% of 3 adds
		mob_count = 3
	else
		mob_count = 2
	end
	
	for n = 1,mob_count do
		eq.spawn2(211120,0,0,e.self:GetX() + math.random (-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(), e.self:GetHeading());	--#A_Rabid_Wrulon_Pup (211120)
	end
end