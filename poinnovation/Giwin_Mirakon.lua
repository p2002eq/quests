local flag_counter = 0;
local tactics_flag = false;

function event_spawn(e)
	flag_counter = 0;
	tactics_flag = false;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if qglobals.pop_poi_behometh_preflag == nil and not tactics_flag then
		if e.message:findi("hail") then
			e.self:Say("How did you get in here?  Hrmm no matter, you will be helping me now for I am a [" .. eq.say_link("great warrior") .. "] of Rallos Zek and I know you wish not to provoke my fury!")
		elseif e.message:findi("great warrior") then
			e.self:Say("Yeah, you heard me!  You know that I must be important if Rallos himself has plucked me from the battlefield to complete this [" .. eq.say_link("task") .. "].  Even though I serve my lord, I am desperate to return to my place on the eternal battlefield.");
		elseif e.message:findi("task") then
			e.self:Say("Ya, you see Rallos sent me here to contract the machines to work on a mana powered piece of machinery that could test all on the eternal battlefield.  This weapon of ultimate destruction is taking quite a long time to be completed.  You know... if you were to go [" .. eq.say_link("test the machine") .. "] and it were to fail against you I could be on my way back to tell Rallos that it was defeated by mere mortals.  Help me to get back to the battlefield and out of this rusted out junk heap.");
		elseif e.message:findi("test the machine") then
			e.self:Say("Haha!  I knew I sensed the warring spirit within you.  Go through over there.  Ignore those steam powered soldiers and their talk of perimeters.  Go into the main construction area, you will know you are there when you see power carriers taking energy to power up the machine.  If you can stop the energy carriers from releasing their energy the machine will activate to see what has happened.  I shall come to check on you and take a full report when you have destroyed it.  Long live Rallos!");
			eq.set_global("pop_poi_behometh_preflag", "1", 5, "F")
			e.other:Message(15,"You have received a character flag!");
		end
	elseif e.message:findi("hail") and tonumber(qglobals.pop_poi_behometh_preflag) == 1 and qglobals.pop_poi_behometh_flag == nil and tactics_flag and flag_counter < 72 then
		e.self:Emote("gives you a look of disbelief and then concern. 'You destroyed the machine?! You should come with me to the Plane of Tactics. Surely the Zeks will want to honor you in your warring spirit. I will go on ahead of you to prepare for your arrival. I believe that you can access the Plane through the portal that the weakli... Er tranquil have opened in the Plane of Tranquility. I anticipate our next meeting on the Battlefields of Zek!");
		flag_counter = flag_counter + 1;
		eq.set_global("pop_poi_behometh_flag", "1", 5, "F");
		e.other:Message(15,"You have received a character flag!");
	elseif e.message:findi("hail") and tonumber(qglobals.pop_poi_behometh_preflag) == 1 and not tactics_flag then
		e.self:Say("Well go on then, what are you cowering around for, let us see what kind of warrior you are!")
	end
end

function event_signal(e)
	if e.signal == 1 then
		flag_counter = 0;
		tactics_flag = true;
		e.self:GMMove(1115,-3,3.2,192,true);
		e.self:SetRunning(true);
		e.self:CastToNPC():MoveTo(1005, 0, 3.2, 65, true);
		e.self:Shout("Quickly! Come see me!");
		eq.set_timer("depop", 10 * 60 * 1000);
	elseif e.signal == 2 then
		e.self:Shout("Fool! The machine cannot work outside of the room!");
	end
end

function event_timer(e)
	if e.timer == "depop" then
		tactics_flag = false;
		eq.depop_with_timer();
	end
end

function event_death_comoplete(e)
	tactics_flag = false;
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
