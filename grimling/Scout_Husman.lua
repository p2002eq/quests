-- Scout_Husman (167203) in Grimling for BST epic

local started = false;
local officer = false;   --signal on officer's death

function event_spawn(e)
	started = false;
end

function event_say(e)
	if started == false then
		if e.message:findi("hail") then
			e.self:Say("Greetings " .. e.other:GetName() .. ", It's a good day for a [" .. eq.say_link("raid") .. "], wouldn't you agree?");
		elseif e.message:findi("raid") then
			e.self:Say("'I know the way to a grimling camp close to here. If you have about six people of my strength we have a good chance of taking it over. With luck, a grimling officer will take part in their counterattack, and they can carry valuable treasure indeed. Fetch me a polished acrylia sphere and I'll guide you.");
		end
	else
		e.self:Say("I'm sorry but I can't speak right now.");
		eq.pause(2);
	end
end

function event_trade(e)
    local item_lib = require("items");	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if(not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 3681})) then -- Polished Acrylia Sphere
        e.self:Say("Nothing better than killing grimlings for the king! Follow me closely and fight well. Make certain that I survive, for if I perish the mission will be a failure.");
        started = true;
		officer = false; 
		e.self:SetRunning(false);
		eq.start(19);	
		eq.unload_encounter("Husmans_Raid"); --if for some reason previously not unloaded correctly
		--eq.set_global("GrimlingWar1","1",5,"H2");
	elseif (officer and item_lib.check_turn_in(e.self, e.trade, {item1 = 4327})) then 	-- Grimling Officer's Scalp
		e.self:Say("Well done " .. e.other:GetName() .. "! Successful raids like this will bring you great glory among our people. Take this insignia as proof of your experience here in service of the king. Leave this place now, for it will be taken over by the enemy momentarily. Farewell!");
		e.other:QuestReward(e.other,0,0,0,0,4393,5000);  -- Copper Medal of War
		eq.get_entity_list():GetSpawnByID(334758):Repop(5);	--repop scout
		--eq.spawn2(167203, 0, 0, -1167, -862, 5, 134.6);	--repop scout
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
	if e.wp == 4 then
		e.self:Say("The camp is just ahead. To be safe, stay behind me until I give the word. Be silent and stay low... and may the spirits bless our effort.");
	elseif e.wp == 6 then
		e.self:Say("Here we are friends, prepare yourselves. I remind you to keep me alive or the mission will be a failure. At the hearing of my next words, follow me over this hill and slay every last grimling.");
		eq.start(0);		--sets blank grid
		eq.set_timer("raid_start",30*1000);
	end
end

function event_timer(e)
	if e.timer == 'raid_start' then
		eq.stop_timer(e.timer);
		e.self:SetRunning(true);
		e.self:MoveTo(-118,-1189,-5,100,true);
		eq.stop();
		e.self:Say("For the king! We claim this land in defiance of the grimling menace! Death to you all!");
		eq.load_encounter("Husmans_Raid");
    end
end


--[[
-- Scout_Husman (167203) in Grimling for BST epic (previous version from grimling forest 2.0

function event_spawn(e)
    at_camp = false;
end

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Greetings, " .. e.other:GetName() .. ". Are you [" .. eq.say_link("here to help") .. "]? You've no doubt heard of the issues with the Grimlings throughout the forest. I fear we may not be able to push them back enough this time to keep our people safe from the dastardly deeds of those vile things. Reports have come in that they may be trying to come at us from the North. While it wouldn't be unheard of, such a move might prove to be a decoy for other attacks coming from the West.");
    elseif e.message:findi("here to help") then
        e.self:Say("I'm glad to hear it. From our reports, they have a rather small group of soldiers North of here, comprising of two encampments not far from each other. We must begin pushing the Grimlings back to their mines so they cannot continue to have a stronghold in this area. For now, you must gather together a group of soldiers to venture with you to help us clear one of the camps out. When you are [" .. eq.say_link("ready to go") .. "], inform me of such and I will lead you to the camp where you can make preparations for battle.");
    elseif e.message:findi("ready to go") then
        e.self:Say("Right, then. We'll be making our way to, what we believe, is their number one camp, leading the way for the other camp northward down to us. Make sure you have everyone with you, we'll be making our way to the camp in just a minute.");
        eq.set_timer('start', 60 * 1000); -- waits 1 minute then paths to grimling camp
    elseif at_camp and e.message:findi("ready to start") then
        e.self:Say("Now is the time, my friends, to prove yourselves in the thick of battle! Charge to the enemy and leave no Grimling standing!");
        eq.unique_spawn(167716,0,0,-1247,535,40, 220); -- untargetable Ukigit
    end
end

function event_waypoint_arrive(e)
    if e.wp >= 13 and not at_camp then
        at_camp = true;
        e.self:Say("Here we are, at their primary camp to the direct North of our outpost. It is up to you to clear the camp of these worrisome Grimlings so we can help to push them back into those wretched mines. They'll likely use the hills behind those huts as cover for their casters, but be sure to clear out those in the huts first, as they will no doubt be more trouble than you are expecting. Also, watch out for any officers, as they can cause more problems still if you're not careful. When you are [" .. eq.say_link("ready to start") .. "], let me know and I will let you loose to wreak havoc on the Grimlings of that camp.");
    end
end

function event_timer(e)
    if e.timer == 'start' then
        eq.start(11);
    end
end]]
