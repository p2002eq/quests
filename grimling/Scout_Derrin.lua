--Scout Derrin (grimling war raids)

local started = false;
local officer = false;   --signal on officer's death

function event_spawn(e)
	started = false;	
end

function event_say(e)
	if not started then
		if e.message:findi("hail") then
			e.self:Say("Greetings " .. e.other:GetName() .. ", what brings you to the battlegrounds? Looking to [" .. eq.say_link("raid") .. "] a grimling camp perhaps?");
		elseif e.message:findi("raid") then
			e.self:Say("I can lead a dozen men of my strength on a raid against a well fortified grimling encampment. It's a risky mission, but one that has the potential to yield substantial rewards. If you have the manpower and the courage, give me a glowing acrylia sphere and we'll get started.");
			end
	else
		e.self:Say("I'm sorry but I can't speak right now.");
		eq.pause(2);
	end
end

function event_trade(e)
    local item_lib = require("items");	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if(not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 4376})) then -- Glowing Acrylia Sphere
        e.self:Say("Draw your best weapons, memorize your most deadly spells and cast your best enhancements. Prepare yourselves for a fierce battle!");
        started = true;
		officer = false;
		e.self:SetRunning(false);
		--eq.set_global("GrimlingWar3","1",5,"H2");	--not needed at this point
		eq.start(20);	
		eq.unload_encounter("Derrins_Raid"); --if for some reason previously not unloaded correctly
	elseif (officer and item_lib.check_turn_in(e.self, e.trade, {item1 = 4377})) then 	-- Grimling Officer's Eye
		e.self:Say("Excellent! Completing a raid upon this encampment is a feat to be proud of. May this medal dispell all doubt that you have indeed accomplished this feat. I advise you to leave now, as this area will surely be taken over by the enemy at any moment.");
		e.other:QuestReward(e.other,0,0,0,0,4378,5000);  -- Gold Lined Copper Medal of War
		--eq.spawn2(167201, 0, 0, -1127, -598, 9,259.0);	--repop scout
		eq.get_entity_list():GetSpawnByID(334760):Repop(5);	--repop scout
		eq.depop();
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if e.signal == 1 then
		officer = true;		--signal from encounter once officer is killed
	end
end

function event_waypoint_arrive(e)
	if e.wp == 6 then 
		e.self:Say("'I must survive this invasion in order for it to be successful. Stay alert and make certain that I do not perish! When you are ready to bring our invasion to a close hand me the eye of an officer.");
	elseif e.wp == 7 then
		e.self:Say("The target camp is just over this ridge to the west. Half of you stay here and make your last minute preparations. Listen, and when you hear my command, charge the camp. The other half of you follow me now.");
		eq.start(0);		--sets blank grid - we do not want him pathing back to first waypoint of grid
		eq.set_timer("raid_start",30*1000);
	end
end

function event_timer(e)
	if e.timer == 'raid_start' then
		eq.stop_timer(e.timer);
		e.self:SetRunning(true);
		e.self:MoveTo(1021, -1050, 26, 77, true);
		eq.stop();
		e.self:Say("For the king! We claim this land in defiance of the grimling menace! Death to you all!");
		eq.load_encounter("Derrins_Raid");
    end
end
