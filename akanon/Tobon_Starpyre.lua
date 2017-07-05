function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18774) == true) then -- Registration Letter
		e.other:Message(15,"A wise looking gnome stands before you. 'Welcome to the Library Mechanimagica young apprentice. I am Tobon Starpyre. Read the note in your inventory and give it to me so that we may begin your training'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is good to see the young show an interest in the ways of magic. Its circles can be used in tandem with our unique ways of tinkering. Have you [joined the Eldritch Collective] or are you [merely curious]?");
	elseif(e.message:findi("joined the Eldritch Collective")) then
		e.self:Say("Very good. Would you like to [go on a little mission] or are you busy studying?");
	elseif(e.message:findi("merely curious")) then
		e.self:Say("Please look around. We have much knowledge within these halls. May you soon find your place among our members. Good day.");
	elseif(e.message:findi("go on a little mission")) then
		e.self:Say("Fabulous! Here is a list of the observers outside of Ak'Anon. Go and ask each for a [spare telescope lens]. Each should give you one. We have need of them. I await your return as does your reward, either Fire Bolt or Fingers of Fire. Meant for a skilled wizard of the eighth trial.");
		e.other:SummonItem(18868); 	-- Observer List
	elseif(e.message:findi("yendar")) then
		e.self:Say("Oh, he is my older brother. Used to be the leader of the Eldritch Collective. Then he founded the Observers, a pretty good piece of work. Went off his rocker a long while back, though. Became obsessed with Innoruuk and the Teir'Dal. Stays away for days at a time, nobody knows where he has been. Mother still worries about him, asked me to keep an eye on him. But he is a grown gnome, and with his mastery of the art, has little to fear in this world or others. But if you are seeking him, I would look outside Ak'Anon, in the Steamfonts. That is where he makes his home these days.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18774})) then -- Registration Letter
		e.self:Say("Ah.. Welcome, friend! I am Tobon Starpyre, Master Wizard of Library Mechanimagica. This is our tunic - wear it with pride. Study hard, master your skills, and make us proud.");
		e.other:Faction(91,100,0); 	-- eldritch collective
		e.other:Faction(71,-15,0); 	-- Dark reflection
		e.other:Faction(322,-5,0);	-- the dead
		e.other:Faction(115,15,0); 	-- gem choppers
		e.other:Faction(176,15,0); 	-- king ak'anon
		e.other:QuestReward(e.self,0,0,0,0,13523,100); -- Soot Stained Gold Robe*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13275, item2 = 13276, item3 = 13277, item4 = 13279})) then -- A Telescope Lens, Telescope Lens, A Telescope Lens and A Telescope Lens
		e.self:Say("Thank you for your work. I heard news of the troubles you encountered. Besides these troubles you still completed your mission. We are grateful. And as I once stated, your reward awaits.");
		e.other:QuestReward(e.self,0,0,0,1,eq.ChooseRandom(15380,15477,15656),500); -- Spell: Column of Frost, Spell: Fire Bolt or Spell: Shock of Ice
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
