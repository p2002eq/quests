function event_click_door(e)
	if(e.door:GetDoorID() == 8) then
		if(e.self:KeyRingCheck(17274)) then
			open_doors(8,0);
		else(e.other:HasItem(17274))
			open_doors(8,1);
	end
	elseif(e.door:GetDoorID() == 10) then
		if(e.self:KeyRingCheck(17274)) then
			open_doors(10,0);
		else(e.other:HasItem(17274))
			open_doors(10,1);
	end
	elseif(e.door:GetDoorID() == 11) then
		if(e.self:KeyRingCheck(17274)) then
			open_doors(11,0);
		else(e.other:HasItem(17274))
			open_doors(11,1);
	end
	elseif(e.door:GetDoorID() == 35) then
		if(e.self:KeyRingCheck(17274)) then
			open_doors(35,0);
		else(e.other:HasItem(17274))
			open_doors(35,1);
	end
	elseif(e.door:GetDoorID() == 40) then
		if(e.self:KeyRingCheck(17274)) then
			open_doors(40,0);
		else(e.other:HasItem(17274))
			open_doors(40,1);
	end
	elseif(e.door:GetDoorID() == 46) then
		if(e.self:KeyRingCheck(17274)) then
			open_doors(46,0);
		else(e.other:HasItem(17274))
			open_doors(46,1);
	end
end

function open_doors(e)
	--EVENT_CLICKDOOR executes before the rest of the door processing
	--so by unlocking and removing the lockpick value we can simulate live behavior
	--and not incorrectly show that the door is locked and we are not holding the key.

	--remove lockpiock and key item.
	eq.get_entity_list():FindDoor(_[0]):SetLockPick(0);
	eq.get_entity_list():FindDoor(_[0]):SetKeyItem(0);
	--s locked message
	e.self:Message(4,"This is locked...");
	--add to keyring if specified
	if(_[1] == 1) then
		e.self:KeyRingAdd(17274);
	end

	--s open message
	e.self:Message(4,"You got it open!");
	--set 2 second timer to relock door. use door as timer.
	--doors stay open longer than 2 seconds.
	eq.set_timer(_[0],2000);
end

function event_timer(e)
	if(timer == 8 or timer == 11) then
		lock_doors(timer,20511);
	elseif(timer == 10) then
		lock_doors(timer,20513);
	elseif(timer == 35) then
		lock_doors(timer,20515);
	elseif(timer == 40) then
		lock_doors(timer,20514);
	elseif(timer == 46) then
		lock_doors(timer,20516);
	else
		--should never happen
		eq.stop_all_timers();
	end
end

function lock_doors(e)
	eq.get_entity_list():FindDoor(_[0]):SetKeyItem(_[1]);
	eq.get_entity_list():FindDoor(_[0]):SetLockPick(201);
	eq.stop_timer(_[0]);
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
