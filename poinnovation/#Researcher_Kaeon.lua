local room_locs = {[1] = {-286,-750,4,0}, [2] = {-287, -763, -168, 0} };
local controller = {206093, 206092};
local room;

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local group = e.other:GetGroup();
	local zone_id = eq.get_zone_id();
	local instance_id = eq.get_zone_instance_id();
	
	if qglobals[instance_id .. "_poi_endurance_1"] == nil then
		room = 1;	--room 1 available
	elseif qglobals[instance_id .. "_poi_endurance_2"] == nil then
		room = 2;  -- room 2 available
	else
		room = -1;	--no rooms available
	end
	
	if e.message:findi("hail") and room == -1 then
		e.self:Say("I am currently conducting an experiment.  Please come back later.");
	elseif e.message:findi("hail") and room > 0 then
		e.self:Say("Salutations. We have been monitoring your performance in the scrap yards. Your ability seems to rival your physical capabilities. We would like to test your endurance and mental abilities further. Would you [ " .. eq.say_link("I will comply", false, "comply") .. "] to endurance testing?");
	elseif e.message:findi("comply") and room > 0 then
		e.self:Say("Excellent. We would like to test a maximum of six at one time. Are you [" .. eq.say_link("ready") .. "] to begin testing?")
	elseif e.message:findi("ready") and room > 0 then 
		if e.other:IsGrouped() then
			e.self:Say("Excellent I will now send you down to the testing bay. Assistant Kelrig will be there shortly with further instructions.")
			eq.set_global(instance_id .. "_poi_endurance_" .. room,"1",3,"M75");	--total allowable event time should be roughly 68min.  The 75 min lockout only occurs on event failure/incompletion
			group:TeleportGroup(e.self, zone_id, instance_id, unpack(room_locs[room]));		--debug
			eq.unique_spawn(controller[room], 0, 0, unpack(room_locs[room]));		--spawns Endurance Room One trigger
		else
			e.self:Say("Error. We require at least two testing subjects before we may begin.")
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
