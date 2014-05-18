function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Pleasure to meet you.  Keep your eye out for the ship.  You don't want to miss it.");
	end
	if(e.message:findi("mudtoes")) then
		e.self:Say("Mudtoes!! I have heard tales of that foul clan of ogres. A few passengers aboard the ships have claimed to have seen one of them, off and on, amongst the pirates in the Ocean of Tears!!");
	end
end

function event_spawn(e)
	eq.spawn_condition("butcher",0,1,0);
	eq.spawn_condition("butcher",0,2,0);
end

function event_signal(e)
	local count = eq.get_entity_list():CountClient();
	if(count == 1) then
		local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
		local hour = zone_time["zone_hour"] + 1;
		if(hour ~= 6 and hour ~= 18 and hour ~= 12 and hour ~= 24) then	
			eq.spawn_condition("butcher",0,1,0);
			eq.spawn_condition("butcher",0,2,0);
			e.self:Shout("Boat passengers: Sorry, you missed the boat and should be at safe coords.");
		else
			e.self:Shout("Letting spawn_events handle condition!");
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
