--A_castellan_of_Air (215000)
--Splitter Script for Vengeful Spirits and Spawn Chance for Inlohker the Warlord
--poair

function event_death_complete(e)
	eq.signal(215424,1);	--#isle_one_controller (215424)


	--Mob Spawn chance rolls
	local rand = math.random(1,100);	--roll chance for named spawn or splitter adds
	local mob_count = 0;
	
	if rand <= 5 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(215415) then		--5% chance to trigger named if not already up else will spawn a variance of adds
		mob_count = 1
		npc_id = 215415;	 --#Inlokher_the_Warlord (215415)
	else
		npc_id = 215391;	--#a_vengeful_airspirit (215391)
		if rand <= 20 then
			mob_count = 4;
		elseif rand <= 50 then	
			mob_count = 3;
		elseif rand <= 80 then 
			mob_count = 2;
		else
			mob_count = 1
		end
	end
	
	for n = 1,mob_count do
		mob = eq.spawn2(npc_id,0,0,e.self:GetX() + math.random (-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(), e.self:GetHeading());	
		eq.set_timer("depop", 15 * 60 * 1000, mob);
	end
end