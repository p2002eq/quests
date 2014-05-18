function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you. Your city of stone walls is quite magnificent. Still, the glory of Surefall Glade puts this city to shame.");
	elseif(e.message:findi("assassin")) then
		e.self:Say("What!!?  Must be an Unkempt Druid Assassin nearby!!  Find him and slay him.  I am sure he stands to make a FORTUNE!  I believe the assassin may be carrying some sort of [black wood chip].");
		eq.spawn2(1179,0,0,-100,222,3,128);
	elseif(e.message:findi("black wood chip")) then
		e.self:Say("That is the mark of an Unkempt Druid.  Long ago there was a tree in Norrath we called the Great Tunarbos.  Legend says it spawned all the woodlands of Norrath.  Many centuries ago, long before the Combine Era, the Great Tunarbos was burned to the ground by unknown means.  The ancient rangers kept what little of the great tree they could find.  To make it short, all Unkempt Druids now carry burned wood chips to represent the great tree.  They are not real.  Take any black wood chips to Gerael Woodone in Surefall Glade.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 17) then
		e.self:Say("Even the beauty of the ocean pales in comparison to the towering pines of Surefall Glade.");
	elseif(e.wp == 27) then
		e.self:Say("I have had a tree sap from Surefall Glade which tastes better than this ale.");
	end
end

function event_spawn(e)
	eq.spawn_condition("qeynos",0,3,0);
	eq.spawn_condition("qeynos",0,4,0);
end

function event_signal(e)
	local count = eq.get_entity_list():CountClient();
	if(count == 1) then
		local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.	
		local hour = zone_time["zone_hour"] + 1;
		-- We know we can have a boat at 1,4,5,8,9,or 12
		if(hour ~= 1 and hour ~= 9 and hour ~= 5 and hour ~= 4 and hour ~= 12 and hour ~= 8 and
		hour ~= 13 and hour ~= 21 and hour ~= 17 and hour ~= 16 and hour ~= 24 and hour ~= 20) then
			eq.spawn_condition("qeynos",0,3,0);
			eq.spawn_condition("qeynos",0,4,0);
			e.self:Shout("Boat passengers: Sorry, you missed the boat and should be at safe coords.");
		else
			e.self:Shout("Letting spawn_events handle condition!");
		end
	end			
end