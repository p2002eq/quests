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
	-- Player is zoning and on a boat. Make sure we have one waiting.
	local count = eq.get_entity_list():CountClient();
	if(count == 1) then
		local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
		local hour = zone_time["zone_hour"] + 1;
		if(hour == 7 or hour == 19 or hour == 13 or hour == 1) then	
			eq.spawn_condition("butcher",0,1,0);
			eq.spawn_condition("butcher",0,2,0);
			e.self:Shout("Reset spawn condition!");
			if(e.signal == 1) then
				e.self:Shout("Recieved signal 1!");
				eq.spawn_condition("butcher",0,1,1);
				e.self:Shout("Spawning StormBreaker!");
			elseif(e.signal == 2) then
				e.self:Shout("Recieved signal 2!");
				eq.spawn_condition("butcher",0,2,1);
				e.self:Shout("Spawning SirensBane!");
			elseif(e.signal == 3) then
				e.self:Shout("Recieved signal 3!");
			end
		else
			e.self:Shout("Letting spawn_events handle condition!");
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
