function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I only train those who follow the path of the Patriarchs of Cabilis and have yet to develop their [powers] over the beasts of the wild.");
	elseif(e.message:findi("powers")) then	--Armor of the Patriarch Quest
		e.self:Say("Good. In order to develop your powers over the beasts of the wild, you must complete several [tests] which will prove your loyalty to our cause. ");
	elseif(e.message:findi("tests")) then 	--Armor of the Patriarch Quest (part 1 - Patriarch's Bracer)
		e.self:Say("In order to develop your powers you will need to collect various items which will serve to me as proof of your continued training. When you return the items to me, I will reward you with a piece of armor to help protect you from the dangers found outside our city walls. Go now and bring me four leech husks as proof of growing powers. ");
	elseif(e.message:findi("aid")) then 	--Claw of the Cub Quest (Claw of the Spiritual Elder Quest Line 1/6)
		e.self:Say('Good. Well we shall see how well you match up with our needs with this first mission. Go out beyond the safety of our city walls and bring back proof of your inner strength and training. This proof will be in the form of a sarnak raider brain, a froglok bounder javelin, an Iksar bandit mask, and a mandible from a rogue shaman.');
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12686, item2 = 12686, item3 = 12686, item4 = 12686})) then	--Armor of the Patriarch Quest (part 2 - Patriarch's Cap)
		e.self:Say("You have done well in your first test young patriarch! Wear these bracers to help protect you from the dangers you may find in your journey. Now for your next test you shall bring me three spiderling silks and one scarab carapace as continued proof our your growing powers. ");
		e.other:SummonItem(7827);
		e.other:Faction(282,20);
		e.other:Faction(193,10);
		e.other:AddEXP(20000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13099, item2 = 13099, item3 = 13099, item4 = 13849})) then	--Armor of the Patriarch Quest (part 3 - Patriarch's Leggings)
		e.self:Say("You have done well again young patriarch. Wear this cap proudly. Now for your next test, you shall bring me four watcher signal torches as proof of your growing powers. ");
		e.other:SummonItem(7828);
		e.other:Faction(282,20);
		e.other:Faction(193,10);
		e.other:AddEXP(20000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12441, item2 = 12441, item3 = 12441, item4 = 12441})) then	--Armor of the Patriarch Quest (part 4 - Patriarch's Claw)
		e.self:Say("You are doing very well in your training young patriarch! Wear these leggings proudly. For your next text, you will need to bring me two Sarnak Broodling fangs and two Goblin Hunter javelins. When you have completed this test, I will reward you with the Patriarch's claw. ");
		e.other:SummonItem(7829);
		e.other:Faction(282,20);
		e.other:Faction(193,10);
		e.other:AddEXP(20000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14599, item2 = 14599, item3 = 12432, item4 = 12432})) then	--Armor of the Patriarch Quest (part 5 - Patriarch's Leather)
		e.self:Say("You have made me proud young patriarch! Here is your Patriarch's claw, which will help you against the dangers you will find in your journeys. Now there is one final task that you will need to complete. For this task, you will need to bring me four froglok tuk bucklers. When you have completed this final task, you will indeed be a true Patriarch of Cabilis. ");
		e.other:SummonItem(7830);
		e.other:Faction(282,20);
		e.other:Faction(193,10);
		e.other:AddEXP(20000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 8999, item2 = 8999, item3 = 8999, item4 = 8999})) then		--Armor of the Patriarch Quest
		e.self:Say("Congratulations young Patriarch, you have proven yourself to be worthy of our cause. Wear your armor proudly, as it is the symbol of a true Patriarch of Cabilis. ");
		e.other:SummonItem(7831);
		e.other:Faction(282,20);
		e.other:Faction(193,10);
		e.other:AddEXP(20000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18848})) then											--A tattered note
		e.self:Say("The Hierophants have sensed that your spirit is strong with obedience inspiring fear! You must learn to harness your [powers] over the scaled wolves! Wear this tunic so that the Legion of Cabilis will recognize you as a Scaled Spiritist.");
		e.other:SummonItem(13577); 																		--Dusty Green Tunic
		e.other:Faction(282,15); 																		--Scaled Mystics
		e.other:Faction(193,3); 																		--Legion of Cabilis
		e.other:AddEXP(100);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
