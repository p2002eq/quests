--Assistant Kelrig (NPCID: 206203)
--Endurance Testing Event (Room One)
--poinnovation

local round;
local controller = 206093;	--Endurance_Room_One
local room = 1; 

function event_spawn(e)
	eq.set_timer("depop", 5 * 60 * 1000) -- 5 min depop
	eq.signal(controller,50);  --request round count
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop(controller);
		eq.depop();
	end
end

function event_say(e)
	local instance_id = eq.get_zone_instance_id();
	local zone_id = eq.get_zone_id();
	local group = e.other:GetGroup();
	
	if e.message:findi("hail") then
		if round == 1 then
			e.self:Say("Interesting, your abilities have shown you to be sufficient. We would like to continue testing, are you [" .. eq.say_link("ready to continue") .. "] or would you like to [" .. eq.say_link("quit") .. "] here?")
		elseif round == 2 then
			e.self:Say("Once again you have provided sufficient data.  More data is required, are you [" .. eq.say_link("ready to continue") .. "] or would you like to [" .. eq.say_link("quit") .. "] here?")
		elseif round == 3 then	
			e.self:Say("Data shows you working above the standards of other mortals, what is the extra factor to your success?  You must continue, are you [" .. eq.say_link("ready") .. "] or do you need to [" .. eq.say_link("quit") .. "] here?")
		elseif round == 4 then					
			e.self:Say("Excellent.  This data will be of great use to us.  Thank you for your time.  Goodbye.")
			group:TeleportGroup(e.self, zone_id, instance_id, 264, 528, -50, 105);
			eq.delete_global(instance_id .. "_poi_endurance_" .. room);
			eq.depop(controller);
			eq.depop();
		end
	elseif e.message:findi("ready") and round < 4 then		
		e.self:Say("Your cooperation is appreciated, prepare yourselves.")
		eq.signal(controller,1);  --start next round
		eq.depop();
	elseif e.message:findi("quit") and round < 4 then
		e.self:Say("We shall process the data that you have afforded us. Good bye.");
		group:TeleportGroup(e.self, zone_id, instance_id, 264, 528, -50, 105);
		eq.delete_global(instance_id .. "_poi_endurance_" .. room);
		eq.depop(controller);
		eq.depop();
	end
end

function event_signal(e)
	round = e.signal;	--only signal sent should be the round count
end