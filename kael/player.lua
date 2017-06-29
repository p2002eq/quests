--LUA for Iceshard Keep (AKA Kael Plate Cycle House)

function event_say(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.message:findi("The dain shall be slain for the peace we must obtain")) then	-- trigger phrase
		if (qglobals["platecycle"] == nil) then
			myX = e.self:GetX();
			myY = e.self:GetY();
			if(between(myX, 1115, 1175) and between(myY, -870, -810)) then -- check for distance from throne
				eq.unique_spawn(113636, 0, 0, 1125, -839.0, -120.80, 70);  -- spawns Doldigun on Throne to start trigger of cycle
				eq.set_global("platecycle","1",3,"H2");
			end
		end
	end
end

function between(loc, limit_low, limit_high) -- helper function to check that values are between targets
	if(loc <= limit_high and loc >= limit_low) then
		return true
	else
		return false
	end
end

--Controls respawn of Idol on zone repop/crash since Idol is a triggered NPC
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	
	if (qglobals["Idol"] == "1" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(113629) == false) then  --checks for Statue death and verifies Idol is not already up
		eq.unique_spawn(113629,0,0,1292,1267,-35,254.5);  --Spawns Idol if above is true
	end
end