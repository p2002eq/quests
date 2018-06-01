--#corpse_scanner (207314)
--potorment

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

		-- Move Player Corpses from the Tower Door to the Grave Yard
		if (corpse_list ~= nil) then
			for corpse in corpse_list.entries do
				if (corpse:IsPlayerCorpse()) then
					if (corpse:CalculateDistance(0,50,-60) <= 40) then	--shouldn't summon into tower
						corpse:GMMove(-341 + math.random(-20,20),1706 + math.random(-20,20),-495);  
					end
				end
			end
		end
	end
end