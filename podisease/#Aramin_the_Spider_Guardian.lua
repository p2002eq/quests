--Aramin_the_Spider_Guardian
--podisease

function event_death_complete(e)
	eq.local_emote({1788, 222, 374},7,200,"Spiders erupt from Aramin's corpse.")
	for n = 1,8 do
		eq.spawn2(205154,0,0,1788 + math.random(-45,45), 222 + math.random(-20,20), e.self:GetZ(), e.self:GetHeading());	--An_Arachnae_Maleveler x 8 spawns on death
	end
end

