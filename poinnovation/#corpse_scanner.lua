--#corpse_scanner (206212)
--poinnovation

function event_spawn(e)
	if eq.get_zone_instance_id() == 0 then
		eq.set_timer("prox_scan", 5  * 1000);
	else
		eq.depop();
	end
end

function event_timer(e)
	if e.timer == "prox_scan" then
		local corpse_list = eq.get_entity_list():GetCorpseList();

		-- Move Player Corpses from the Factory door to the Grave Yard
		if (corpse_list ~= nil) then
			for corpse in corpse_list.entries do
				if (corpse:IsPlayerCorpse()) then
					if (corpse:CalculateDistance(0,92,3) <= 40) then	--shouldn't summon into factory
						corpse:GMMove(252 + math.random(-20,20),533 + math.random(-20,20),-50);  
					end
				end
			end
		end
	end
end