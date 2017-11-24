--Veteran Vadrel (NPCID 167194)
--


local started = false;
local veteran = 167196;	--Veteran Cullin
local officer = false;   --signal on officer's death

function event_spawn(e)
	started = false;
	officer = false;
end

function event_say(e)
	if started == false then
		if e.message:findi("hail") then
			e.self:Say("Greetings to you, " .. e.other:GetName() .. ". Are you [" .. eq.say_link("here to help") .. "] further our cause and continue to push back the Grimling forces? You look to be no stranger to the battles that go on and seem to be competent enough to aid us.");
		elseif e.message:findi("here to help") then
			e.self:Say("Very well, please show me the medal you received from your previous triumphs with Captain Necin and I will reveal the details of my mission.");
		end
	else
		e.self:Say("I'm sorry but I can't speak right now.");
		eq.pause(2);
	end
end

function event_trade(e)
    local item_lib = require("items");
	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if(not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 4396})) then --Silver Medal of War
        e.self:Say("Take these plans and study them carefully. You will need to gather up many allies to achieve our objectives.  Two dozen soldiers as powerful as me to be exact. When you have selected and briefed the troops that will carry out the offensive, give me the plans and we will begin our assault.");
        e.other:QuestReward(e.other,0,0,0,0,5987,0);	--Vadrel's Plans
	elseif (not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 5987})) then 	--Vadrel's Plans
		started = true;
		officer = false;
		e.self:SetRunning(true);	--debug set to false later
		eq.unload_encounter("Vadrels_Raid");
		e.self:Say("Very well, then. We'll be making our way to the grimling camps due north in the forest. It is our belief that these camps hold the reinforcement wave of their attack force, so it is important to rid ourselves of the threat. "); 
		eq.start(23);		
		--Cullin = eq.get_entity_list():GetMobByNpcTypeID(veteran)
		--Cullin:GMMove(e.self:GetX(), e.self:GetY(), e.self:GetZ());		--debug
		--eq.set_timer("raid_start", 5*1000);
	elseif (officer and item_lib.check_turn_in(e.self, e.trade, {item1 = 5988})) then 	-- Grimling Commander's Head
		e.self:Say("Great work " .. e.other:GetName() .. "! We have the grimling menace reeling after our efforts today.  Take this medal as proof of our triumph here today. We are ready to strike the final blow to drive the grimlings from this forest.  Please show the medal I gave you to General Staginar and he can guide you further.  Farewell!");
		e.other:QuestReward(e.other,0,0,0,0,5989,5000);  -- Golden Medal of Shar Vahl
		eq.signal(veteran,11);	--signal to reset at vah camp
		eq.get_entity_list():GetSpawnByID(334769):Repop(5);	--repop Veteran
		eq.depop();
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer == 'raid_start' then
		eq.stop_timer(e.timer);
		e.self:SetRunning(true);
		eq.move_to(-1223, 491, 40, 220, true);
		eq.signal(veteran,10)
		eq.stop();
		e.self:Say("Remember your training, and let the blood of beasts drench your swords! Charge!");
		eq.load_encounter("Vadrels_Raid");
	elseif e.timer == 'clear' then
		if not MobCheck() then
			eq.stop_timer(e.timer);
			e.self:Say("Let's keep moving");
			eq.resume();
		end
	elseif e.timer == 'conv2' then
		eq.stop_timer(e.timer);
		e.self:Say("We will need to split our forces to take over both camps simultaneously.  The largest force should accompany me to the larger camp to the northeast.  The remaining force will follow Veteran Cullin to the northwest camp.  If either myself or Veteran Cullin should perish then all will be lost.");
		eq.set_timer("conv3", 10 * 1000);
	elseif e.timer == 'conv3' then
		eq.stop_timer(e.timer);
		e.self:Say("Please make your final preparations.  We will begin our assault in one minute.  Bring me the head of the grimling commander once he has been defeated.");
		eq.set_timer("raid_start",60*1000);
	end
end

function event_signal(e)
	if e.signal == 1 then
		officer = true;		--signal from encounter once officer is killed
	end
end


function event_waypoint_arrive(e)
	if e.wp == 6 then
		e.self:Say("Do not stray, we are in the thick of the enemy and might be surprised at any moment.");
	elseif e.wp == 9 then
		e.self:Say("I hear grimlings nearby.  Prepare for an ambush!");
		eq.pause(3000);
		for n = 1,4 do
			grimling = eq.spawn2(167679,0,0,-707 + math.random(-10, 10),-239 + math.random(-10, 10), 25, 42);
			grimling:AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(167194), 1);
		end
		eq.set_timer("clear", 3 * 1000);
	elseif e.wp == 10 then
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(veteran) then
			eq.get_entity_list():GetSpawnByID(334767):Repop(5);	--repop Veteran Cullin
		end
	elseif e.wp == 11 then
			eq.get_entity_list():GetMobByNpcTypeID(veteran):GMMove(-874,250,47,141,true);	--moves Veteran to ambush site (he should be popped based on prior wp)
	elseif e.wp == 12 then
		e.self:Say("We have finally arrived at the ambush site.  There are two nearby camps on the sides of these hills that are overrun with grimlings.  If we are able to fight off the grimling horde for long enough then we expect the grimling commander will show himself.");
		eq.set_timer("conv2", 10 * 1000);
		eq.start(0);		--sets blank grid
		
	end
end

function MobCheck()
	local npc_list = eq.get_entity_list():GetNPCList();

	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(-647,-197,10) <= 125 and npc:GetNPCTypeID() == 167679 then
				return true	--mobs still in camp
			end
		end
	end
	return false;
end

function event_death_complete(e)
	eq.signal(veteran,11);	--signal to reset at vah camp
end

 
