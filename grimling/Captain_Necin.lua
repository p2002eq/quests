--Captain Necin (167200)
--


local started = false;
local sergeant = 167515;
local officer = false;   --signal on officer's death

function event_spawn(e)
	started = false;
	officer = false;
end

function event_say(e)
	if started == false then
		if e.message:findi("hail") then
			e.self:Say("Hello, " .. e.other:GetName() .. ". I'm looking for an [" .. eq.say_link("I am an accomplished soldier",false,"accomplished soldier") .. "] to help me carry out a very dangerous mission. If you know of one please have them report to me at once.");
		elseif e.message:findi("accomplished soldier") then
			e.self:Say("Very well, acquire a chest of valor and fill it with the medals you receive from scouts Husman, Danarin, and Derin. Give me the resulting soldier's chest and I will reveal the details of my mission.");
		end
	else
		e.self:Say("I'm sorry but I can't speak right now.");
		eq.pause(2);
	end
end

function event_trade(e)
    local item_lib = require("items");
	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if(not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 4397})) then -- Soldier's Chest
        e.self:Say("Take this map and study it carefully. The mission we are preparing to embark upon will make your previous raids seem like child's play. Many friendly forces will need to help us to achieve our objectives. Two dozen soldiers as powerful as me to be exact. When you have selected and briefed the troops that will carry out the offensive, give me the map and I will lead the assault.");
        e.other:QuestReward(e.other,0,0,0,0,4398,0);
	elseif (not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 4398})) then 	-- Map of Grimling Forest
		started = true;
		officer = false;
		e.self:SetRunning(true);	--debug set to false later
		eq.unload_encounter("Necins_Raid");
		e.self:Say("Alright, let's be on our way. Sergeant Cursah will be joining our raiding party just outside the grimling camps."); 
		--eq.set_global("GrimlingWar2","1",5,"H2");	--qglobal not used at this 
		eq.start(22);		
		--eq.set_timer("raid_start",30*1000);
		--Cursah = eq.get_entity_list():GetMobByNpcTypeID(167515)
		--Cursah:GMMove(e.self:GetX(), e.self:GetY(), e.self:GetZ());		--debug
	elseif (officer and item_lib.check_turn_in(e.self, e.trade, {item1 = 4399})) then 	-- Grimling Officer's Toes
		e.self:Say("Great work " .. e.other:GetName() .. "! We have put a dent in the grimling menace on this day.  Take this medal as proof of your exceptional service. Leave this place now, for it will be taken over by the enemy momentarily. Please show your medal to Veteran Vadrel if you'd like to further aid our cause.  Farewell!");
		e.other:QuestReward(e.other,0,0,0,0,4396,5000);  -- Silver Medal of War
		started = false;
		e.self:SetRunning(true);
		eq.signal(sergeant,11);	--signal to reset at vah camp
		--eq.move_to(-1109, -598, 9, 130,true);  -- move back to spawn
		eq.spawn2(167200, 0, 0, -1109, -598, 9, 260);	--repop captain
		eq.depop();
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer == 'raid_start' then
		eq.stop_timer(e.timer);
		e.self:SetRunning(true);
		eq.move_to(1118, -76, 8, 112, true);
		eq.signal(sergeant,10)
		eq.stop();
		e.self:Say("Shed their blood until no Grimlings are left standing! Charge!");
		eq.load_encounter("Necins_Raid");
    elseif e.timer == 'talk_delay' then
		eq.stop_timer(e.timer);
		e.self:Say("Please make your final preparations.  We will begin the onslaught in one minute.");
		eq.set_timer("raid_start",60*1000);
	end
end

function event_signal(e)
	if e.signal == 1 then
		officer = true;		--signal from encounter once officer is killed
	elseif e.signal == 90 then
		e.self:Say("Thank you Sergeant.  We will need to split our forces to take over both camps simultaneously.  The largest force should accompany me to the larger camp to the northwest.  The remaining force will follow Sergeant Cursah to the southeast camp.  If either myself or Sergeant Cursah should perish then all will be lost.")
		eq.set_timer("talk_delay",15*1000);		
	end
end


function event_waypoint_arrive(e)
	if e.wp == 4 then
		e.self:Say("As we approach the camps it's important that we remain silent. I'm sure you're aware of the advantages we gain with the element of surprise.");
	elseif e.wp == 5 then
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(sergeant) then
			eq.get_entity_list():GetMobByNpcTypeID(sergeant):GMMove(865,-462,85,376,true);
		else
			eq.spawn2(sergeant,0,0,865,-462,85,376);
		end
	elseif e.wp == 7 then
		e.self:Say("Hail Sergeant Cursah.  I have brought some abled bodied soldiers that have a thirst for grimling blood.  What is the current status of the nearby grimling camps?");
		eq.signal(sergeant,90,10*1000);
		eq.start(0);		--sets blank grid
		
	end
end

 
