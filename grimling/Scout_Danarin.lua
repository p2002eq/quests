--Scout Danarin (grimling war raids) 

local started = false;
local officer = false;   --signal on officer's death

function event_spawn(e)
	started = false;
end

function event_say(e)
	if started == false then
		if e.message:findi("hail") then
			e.self:Say("Hello " .. e.other:GetName() .. ", welcome to the front lines of our war against the bastard grimlings. As I'm sure you know, we Vah Shir shun violence, but with this enemy there is no other way. Let me know if you'd like to see some [" .. eq.say_link("action") .. "].");
		elseif e.message:findi("action") then
			e.self:Say("I can escort you to a camp rich with enemies. With my help you can take possession of their camp. They'll try desperately to reclaim their lost territory and, if we're lucky, an officer will show up. You'll want to bring about ten soldiers as powerful as me. When you're all here and ready for battle, give me a marbled acrylia sphere.");
		end
	else
		e.self:Say("I'm sorry but I can't speak right now.");
		eq.pause(2);
	end
end

function event_trade(e)
    local item_lib = require("items");
	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
    if(not started and item_lib.check_turn_in(e.self, e.trade, {item1 = 4349})) then -- Marbled Acrylia Sphere
        e.self:Say("May the spirits guide us " .. e.other:GetName() .. ". Now summon your friends and all the courage you possess, this won't be easy.");
        started = true;
		e.self:SetRunning(false);	--debug set to false later
		officer = false; 
		--eq.set_global("GrimlingWar2","1",5,"H2");	--qglobal not used at this 
		eq.start(21);
	elseif (officer and item_lib.check_turn_in(e.self, e.trade, {item1 = 4374})) then 	-- Grimling Officer's Tooth
		e.self:Say("Well done " .. e.other:GetName() .. "! Successful raids like this will bring you great glory among our people. Take this insignia as proof of your experience here in service of the king. Leave this place now, for it will be taken over by the enemy momentarily. Farewell!");
		e.other:QuestReward(e.other,0,0,0,0,4375,5000);  -- Silver Lined Copper Medal of War
		eq.get_entity_list():GetSpawnByID(334759):Repop(5);	--repop scout
		eq.depop();
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if e.signal == 1 then
		officer = true;		--signal from encounter once officer is killed
	end
end

--update
function event_waypoint_arrive(e)
	if e.wp == 4 then
		e.self:Say("As we approach the camp it's important that we remain silent. I'm sure you're aware of the advantages we gain with the element of surprise.");
	elseif e.wp == 6 then
		e.self:Say("Here we are, now half of you stay here with me and the other half quietly swing around to the ledge south of the camp. Make your final preparations and wait for my command. It is vitally important that I stay alive, the camp will fall to the grimlings if I am slain. Fight well friends");
		eq.start(0);		--sets blank grid
		eq.set_timer("raid_start",30*1000);
	end
end

function event_timer(e)
	if e.timer == 'raid_start' then
		eq.stop_timer(e.timer);
		e.self:SetRunning(true);
		eq.move_to(442, -1195, 9, 75,true);
		eq.stop();
		e.self:Say("For the honor of the Vah Shir, Attack!");
		eq.load_encounter("Danarins_Raid");
    end
end