function event_click_door(e)
	door_id = e.door:GetDoorID();
	entity_list = eq.get_entity_list();
	
  	if (door_id == 8) then
		if(e.self:HasItem(17274)) then
			OpenDoors(e,entity_list,door_id);
		end
	end
	if(door_id == 10) then
		if(e.self:HasItem(17274)) then
			OpenDoors(e,entity_list,door_id);
		end
	end
	if(door_id == 11) then
		if(e.self:HasItem(17274)) then
			OpenDoors(e,entity_list,door_id);
		end
	end
	if(door_id == 35) then
		if(e.self:HasItem(17274)) then
			OpenDoors(e,entity_list,door_id);
		end
	end
	if(door_id == 40) then
		if(e.self:HasItem(17274)) then
			OpenDoors(e,entity_list,door_id);
		end
	end
	if(door_id == 46) then
		if(e.self:HasItem(17274)) then
			OpenDoors(e,entity_list,door_id);
		end
	end
end

function OpenDoors(e, entity_list, door_id)
	--EVENT_CLICKDOOR executes before the rest of the door processing
	--so by unlocking and removing the lockpick value we can simulate live behavior
	--and not incorrectly show that the door is locked and we are not holding the key.

	--remove lockpiock and key item.
	
	entity_list:FindDoor(door_id):SetLockPick(0);
	entity_list:FindDoor(door_id):SetKeyItem(0);
	--s locked message
	e.self:Message(4,"This is locked...");

	e.self:Message(4,"You got it open!");
	--set 2 second timer to relock door. use door as timer.
	--doors stay open longer than 2 seconds.
	eq.set_timer(tostring(door_id),2000);
end

function event_timer(e)
	if(e.timer == "8" or e.timer == "11") then
		lock_doors(e.timer,20511);
	elseif(e.timer == "10") then
		lock_doors(e.timer,20513);
	elseif(e.timer == "35") then
		lock_doors(e.timer,20515);
	elseif(e.timer == "40") then
		lock_doors(e.timer,20514);
	elseif(e.timer == "46") then
		lock_doors(e.timer,20516);
	else
		--should never happen
		eq.stop_all_timers();
	end
end

function lock_doors(door_id,keynumber)
	eq.get_entity_list():FindDoor(tonumber(door_id)):SetKeyItem(keynumber);
	eq.get_entity_list():FindDoor(tonumber(door_id)):SetLockPick(201);
	eq.stop_timer(door_id);
end
