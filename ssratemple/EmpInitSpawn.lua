--Controls respawn of Emp Cycle on zone repop/crash since its a triggered NPC

function event_spawn(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	
	if (qglobals[instance_id .. "_Emp_Cycle"] == "1" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(162504) == false) then  --checks for Blood Death death and verifies Emp is not already up
		eq.unique_spawn(162504,0,0,1000,-325,421,196);  -- Spawns Emp
	end
end

function event_say(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	
	if e.other:Admin() > 100 then
		if(e.message:findi("hail")) then
			e.other:Message(1, "Hello " .. e.other:GetName() .. ", would you like [" .. eq.say_link("help") .. "] with the Emp cycle?");
		elseif(e.message:findi("help")) then
			e.other:Message(1, "You can set cycle to [" .. eq.say_link("spawn") .. "],[" .. eq.say_link("activate") .. "] or [" .. eq.say_link("deactivate") .. "] Emperor.")
		elseif(e.message:findi("spawn")) then
			if eq.get_entity_list():IsMobSpawnedByNpcTypeID(162504) == false then
				eq.unique_spawn(162504,0,0,1000,-325,421,196);  -- Spawns Emp
				e.other:Message(1, "Emperor has been spawned.")	
			else
				e.other:Message(1, "Error - Emperor is already spawned.")	
			end
		elseif(e.message:findi("deactivate")) then
			eq.signal(162504, 10);
			e.other:Message(1, "Emperor has been deactivated.")
		elseif(e.message:findi("activate")) then
			eq.signal(162504, 98);
			e.other:Message(1, "Emperor has been activated and will become targetable in 30 seconds.")
		end
	end
end