function event_say(e)
	if(e.message:findi("task")) then
		e.self:Say("You will need to begin familiarizing yourself with the moor and its inhabitants. As a scout, there is one creature that roams the moor that you are going to need to focus on in particular. These creatures are wolf-like in their appearance, but have no need for sight and show absolutely no fear of the tactics that we usually use to scare off animals. They move in packs and attack swiftly. To learn their behavior, you will need to track a few down. Fill that bag with a few of their tongues and bring it back to me. Once you have seen them, I will be able to teach you more.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5558})) then
		e.self:Say("see that you have experienced some training from Elder Ternq. He is an amazing scout and very exciting to watch in combat. Years prior to being commissioned to act in this role, I served with the young Scout Ternq. Of course we were both much younger and more agile back in those days. Much like you are now. Ah well, enough with this chatter. Take this bag and stow it somewhere safe. I have a [task] for you.");
		e.other:QuestReward(e.self,0,0,0,0,17117);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 6274})) then
		e.self:Say("Very good " .. e.other:GetName() .. ", not only have you had a chance to see the creatures, you have also provided me with lunch. I hope that you learned something from your encounter. Those wolves, or sonic wolves as the Dar Khura call them, have destroyed more than a few scouting expeditions. Over the years, our research into the origins of these beasts has proven fruitful. We have found a means of making a weapon that reacts to their flesh. These items will assist you in making that item.");
		e.self:Say("Those items are to be used to not only produce your personal weapons, but to aid any other citizen that may be in need of the component that we, as Taruun, are best suited to produce... the poison. I understand that you are still young and new to poisons, but this will be an easy process for you. You will need only to grind the ingredients up in that mortar and pestle. Then heat the resulting powder in an oven by placing the powder and some water in a poison vial. Be sure not to over cook it.");
		e.self:Say("You will need to visit the Library of War History and purchase a book on the construction of this weapon. Read it and construct the weapon. I recall that the scholar that sells the book was also working on a construction kit for the weapons. Please take your finished weapon and your apprentice cloak to Elder Taruun Ternq. I am sure that he will be curious about your progress.");
		e.other:SummonItem(6146);
		e.other:QuestReward(e.self,0,0,0,0,17110);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
