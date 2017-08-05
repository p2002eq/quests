---- Quest:Researcher's Badge (Badge #3)
-- QGlobal Helpers for Badge Quest #3 (qeynos_badge3)
-- 1 = Started Badge Quest #3 (Completed Quest #2 and turned in badge)
-- 2 = Handed in Research Briefing to start Enchanted Rat Experiment
-- 3 = Successfully completed Experiment (Badge Complete)

local jars = 0;
local spawner = 999106; -- NPC control script ID

function event_spawn(e)
	jars = 0;
end

function event_say(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
    if(e.message:findi("hail")) then
        e.self:Say("Hello " .. e.other:GetName() .. ". Antonius Bayle and the council have ordered a full investigation of these folks that call themselves the Bloodsabers. I hear his plan is to eventually round up every member of this strange disease worshipping cult and bring them in to answer for their terrible crimes against our city and people. Vegalys Keldrane is heading up the investigation. ");
    elseif(e.message:findi("research") and tonumber(qglobals.qeynos_badge2) == 6) then
        e.self:Say("We are currently in the process of conducting research into viable ways to bring an end to this terrible plague. This suffering has gone on long enough. Being a researcher doesn't take strength or brute force, though those qualities do sometimes help. Being a researcher takes intelligence first and foremost. No offense, but not everyone has that quality. This will be no easy task. Are you still [".. eq.say_link("interested") .. "] in helping us with our research? ");
    elseif(e.message:findi("interested") and tonumber(qglobals.qeynos_badge2) == 6) then
        e.self:Say("Still interested? Very well then " .. e.other:GetName() .. ", you look rather intelligent. As a show of your commitment to this task, please turn in your Interrogator's Badge");
    elseif(e.message:findi("problem") and tonumber(qglobals.qeynos_badge3) == 1) then
        e.self:Say("Unfortunately, those vile followers of the Plague Bringer are still attempting to foul up our plans. Several our [".. eq.say_link("test animals") .. "] have been stolen from us by a gnome, a member of the Dark Reflection. These animals are very important to our research, as the briefing describes.");
    elseif(e.message:findi("test animals") and tonumber(qglobals.qeynos_badge3) == 1) then
        e.self:Say("These animals were enchanted with a sort of anti-disease aura. It sounds crazy but we thought that perhaps we could use a sort of 'anti-epidemic' to spread a cure to this disease. However, this aura is as of yet imperfect and also quite [".. eq.say_link("volatile") .."]. We had hoped to use rats to spread the cure, much in the same way they often spread disease.");
    elseif(e.message:findi("volatile") and tonumber(qglobals.qeynos_badge3) == 1) then
        e.self:Say("Yes, the enchantment we placed on the rodents does not last long at all. It disperses its curing magic almost instantly. We fashioned several containers at great expense and they have the ability to preserve an enchantment for long periods of time. After enchanting a rat we [".. eq.say_link("place them in the container") .. "] until we are ready to conduct our tests.");
    elseif(e.message:findi("place them in the container") and tonumber(qglobals.qeynos_badge3) == 1) then
        e.self:Say("Oh, I assure you it is completely humane and the rats do seem to enjoy prolonged exposure to the enchantment while in the container. In fact, it is all we can do to get them out of the containers once we put them in! In any case, those containers are dreadfully expensive to make and those rats. . . Well, we have begun to become sort of attached to them. Please find this [".. eq.say_link("gnome") .. "].");
    elseif(e.message:findi("gnome") and tonumber(qglobals.qeynos_badge3) == 1) then
        e.self:Say("Her name is Oobnopterbevny Biddilets. She was last seen high tailing it across the Plains of Karana. She infiltrated our temple and stole the containers that had our beloved rodents, which were already enchanted and prepared for our next round of tests. I shudder to think of what this monster may be doing to those poor animals. Anyway, retrieve them at any cost. You will need them for the [".. eq.say_link("test") .. "] you will be conducting.");
    elseif(e.message:findi("test") and tonumber(qglobals.qeynos_badge3) == 1) then
        e.self:Say("The briefing explains how the test is to be conducted but first you need to find the test animals. Get the rodents first from that gnome. Then give me your Researcher's Briefing and we will start the test. Release all three rodents as directed then give me the three Empty Enchanted Jars. If you were able to cure all of the diseased rodents by properly using our enchanted rodents, we will consider this test a success and you shall be rewarded with the Researchers Badge.");

    end
end

function event_trade(e)
    local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2387})) then -- Interrogators Badge
        e.self:Say("It seems Vegalys trusts you, so I guess I can trust you as well. Take this briefing. It explains the current state of our research and it explains the test you will be conducting. If you can conduct the test successfully, the Temple of Life shall be in your debt and we shall use the findings to continue our work. However, we have a [".. eq.say_link("problem") .. "] we need assistance with first.");
        eq.set_global("qeynos_badge3","1",5,"F"); -- Badge Globals
        e.other:QuestReward(e.self,0,0,0,0,18295,1000); -- Research Briefing
    elseif(tonumber(qglobals.qeynos_badge3) >= 1 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18295})) then -- starts event when Research Briefing handed in
		eq.spawn2(spawner,0,0,-225,-236,3,0)  -- spawns game control NPC script
		e.self:Say("Well done " .. e.other:GetName() .. "!  Now you must recall what you learned in the research briefing to successfully complete the experiment.  Time is of the essence!");
		eq.set_global("qeynos_badge3","2",5,"F"); -- Badge Globals
	elseif(jars == 3 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(2179) and tonumber(qglobals.qeynos_badge3) >= 2 and (item_lib.check_turn_in(e.self, e.trade, {item1 = 2587, item2 = 2588 , item3 = 2589}))) then -- many checks to confirm event is a sucess!
		e.self:Say("You did it! You have proven you have the intelligence required and you may wear this Researcher's Badge with pride! Thank you for returning the jars.");
		e.other:QuestReward(e.self,0,0,0,0,2583,10000); -- Research Briefing
		eq.set_global("qeynos_badge3","3",5,"F"); -- Badge Globals
		eq.signal(spawner, 1) -- signals control NPC to depop event
		eq.depop_with_timer();
	end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if (e.signal == 1) then
		jars = jars + 1;
	elseif (e.signal == 2) then
		e.self:Say("It seems our research experiment has failed.  You must improve your skills if you wish to attain your Researcher's Badge.  Please come back when you are ready to try again.");
		eq.depop_with_timer();
	end
end