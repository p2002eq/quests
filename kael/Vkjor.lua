function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Greetings, "..e.other:Race()..". Welcome to the great arena of Kael Drakkel. I am Vkjor, master of the arena. The games begin and end when I wish them to. Gladiators train themselves year round to entertain the populace of Kael. Have you come to watch, or is there [" .. eq.say_link("something else") .. "] I can [" .. eq.say_link("help you") .. "] with?");
	elseif (e.message:findi("something else")) then	
		e.self:Say("What is it you need? Do you wish to be a gladiator or something along those lines? I do not allow your kind to fight in the arena, I am sorry to say. It is a sacred place for the children of Zek. If you wish to hone your battle skills, however, I do have several things I need [" .. eq.say_link("taken care of") .. "].");
	elseif (e.message:findi("taken care of")) then	
		e.self:Say("I have several things which must be dealt with. However I must know if you are capable of the tasks before I send you off. Do you fight like an [" .. eq.say_link("ice wurm") .. "] or a [" .. eq.say_link("fight like a dragon",false,"dragon") .. "]?");
	elseif (e.message:findi("fight like a dragon")) then	
		e.self:Say("If you fight like a dragon, I suppose destroying one might not be that hard for you. Several years ago, Nevederia led a flight of dragons to defile the Temple of Rallos Zek. We beat them back to the skies but not without our [" .. eq.say_link("losses") .. "].");
	elseif (e.message:findi("losses")) then
		e.self:Say("My youngest son, Vkjrog, now rests with Rallos Zek in the Plane of War. The loss has sapped me nearly of my will to live. However, a few things keep me going - my duty to keep the arena in order and the knowledge that I might still bring pain and suffering to Nevederia. I wish her to suffer as I did with the loss of a child. She may stay safe in the Temple of Veeshan but her brood does not. Slay her three children and bring me proof of their deaths so they may serve as my message to Nevederia. I will compensate you with a pair of gloves fit for a fine warlord if you can give me this satisfaction.");
	elseif (e.message:findi("help you with")) then	
		e.self:Say("What is it you need? Do you wish to be a gladiator or something along those lines? I do not allow your kind to fight in the arena, I am sorry to say. It is a sacred place for the children of Zek. If you wish to hone your battle skills, however, I do have several things I need taken care of.");
	elseif (e.message:findi("Ice wurm")) then	
		e.self:Say("Very well, young one. A friend of mine named Graktar recently traveled to the Eastern Wastes in search of the remains of his brother, Vkalth. Please take this note to Graktar and assist him in his search. Return to me when you have news of his fate.");
		e.other:SummonItem(25102); --Large Note
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25128, item2 = 25129, item3 = 25127})) then
		e.self:Say("I honestly did not expect you to be able to destroy her children, "..e.other:GetName()..". Vkjrog must have guided your hand as you slew those beasts. Nevederia will now know sorrow the like of which she has never felt.' Vkjor drops a shiny pair of gauntlets on the ground before you as he turns his attention to the bloody claws he now holds.");
		e.other:Faction(189, 5); --Kromzek
		e.other:Faction(188, 5); --Kromrif
		e.other:Faction(179, 5); --KT
		e.other:Faction(42, -10); --CoV
		e.other:QuestReward(e.self, 0, 0, 0, 0, 25078, 40000); --Silver Steel Gauntlets
	end

end

