function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18848)) then -- A tattered note
		e.other:Message(15,"As your reptilian eyes adjust to the darkness of the room, an imposing Iksar turns towards you, addressing you with a sharp hiss. 'I am Prime Patriarch Vuzx. The time has come young one. You have chosen the path of the Beastlord. Open your inventory and read the note within. Once you are ready to begin your training, hand the note to me and we will continue.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I only train those who follow the path of the Patriarchs of Cabilis and have yet to develop their [" .. eq.say_link("powers") .. "] over the beasts of the wild.");
	elseif(e.message:findi("powers")) then	-- Armor of the Patriarch Quest
		e.self:Say("Good. In order to develop your powers over the beasts of the wild, you must complete several [" .. eq.say_link("tests") .. "] which will prove your loyalty to our cause. ");
	elseif(e.message:findi("tests")) then 	-- Armor of the Patriarch Quest (part 1 - Patriarch's Bracer)
		e.self:Say("In order to develop your powers you will need to collect various items which will serve to me as proof of your continued training. When you return the items to me, I will reward you with a piece of armor to help protect you from the dangers found outside our city walls. Go now and bring me four leech husks as proof of growing powers. ");
	elseif(e.message:findi("aid")) then 	-- Claw of the Cub Quest (Claw of the Spiritual Elder Quest Line 1/6)
		e.self:Say('Good. Well we shall see how well you match up with our needs with this first mission. Go out beyond the safety of our city walls and bring back proof of your inner strength and training. This proof will be in the form of a sarnak raider brain, a froglok bounder javelin, an Iksar bandit mask, and a mandible from a rogue shaman.');
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12686, item2 = 12686, item3 = 12686, item4 = 12686})) then -- 4x Leech Husk
		e.self:Say("You have done well in your first test young patriarch! Wear these bracers to help protect you from the dangers you may find in your journey. Now for your next test you shall bring me three spiderling silks and one scarab carapace as continued proof our your growing powers. ");
		e.other:Faction(282,20); -- Scaled Mystics
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7827,20000); -- Patriarchs Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13099, item2 = 13099, item3 = 13099, item4 = 13849})) then	-- 3x Spiderling Silk and Scarab Carapace
		e.self:Say("You have done well again young patriarch. Wear this cap proudly. Now for your next test, you shall bring me four watcher signal torches as proof of your growing powers. ");
		e.other:Faction(282,20); -- Scaled Mystics
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7828,20000); -- Patriarchs Cap
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12441, item2 = 12441, item3 = 12441, item4 = 12441})) then -- 4x Watcher Signal Torch
		e.self:Say("You are doing very well in your training young patriarch! Wear these leggings proudly. For your next text, you will need to bring me two Sarnak Broodling fangs and two Goblin Hunter javelins. When you have completed this test, I will reward you with the Patriarch's claw. ");
		e.other:Faction(282,20); -- Scaled Mystics
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7829,20000); -- Patriarchs Leggings
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14599, item2 = 14599, item3 = 12432, item4 = 12432})) then	-- 2x Sarnak Broodling Fang and 2x Goblin Hunter Javelin
		e.self:Say("You have made me proud young patriarch! Here is your Patriarch's claw, which will help you against the dangers you will find in your journeys. Now there is one final task that you will need to complete. For this task, you will need to bring me four froglok tuk bucklers. When you have completed this final task, you will indeed be a true Patriarch of Cabilis. ");
		e.other:Faction(282,20); -- Scaled Mystics
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7830,20000); -- Patriarchs Claw
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8999, item2 = 8999, item3 = 8999, item4 = 8999})) then -- 4x Froglok Tuk Buckler
		e.self:Say("Congratulations young Patriarch, you have proven yourself to be worthy of our cause. Wear your armor proudly, as it is the symbol of a true Patriarch of Cabilis. ");
		e.other:Faction(282,20); -- Scaled Mystics
		e.other:Faction(193,10); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7831,20000); -- Patriarchs Leather
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18848})) then -- A tattered note
		e.self:Say("The Hierophants have sensed that your spirit is strong with obedience inspiring fear! You must learn to harness your [" .. eq.say_link("powers") .. "] over the scaled wolves! Wear this tunic so that the Legion of Cabilis will recognize you as a Scaled Spiritist.");
		e.other:Faction(282,15); -- Scaled Mystics
		e.other:Faction(193,3); -- Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,13577,100); -- Dusty Green Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end