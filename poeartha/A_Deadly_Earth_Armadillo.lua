--A_Deadly_Earth_Armadillo (218007)
--splitter script
--poeartha

function event_death_complete(e)
	local spawns = math.random(1,3);
	for n = 1, spawns do
		mob = eq.spawn2(218356,0,0,e.self:GetX() + math.random (-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(), e.self:GetHeading());	--#A_Miniature_Dustrunner (218356)
		eq.set_timer("depop", 15 * 60 * 1000, mob);
	end
end
