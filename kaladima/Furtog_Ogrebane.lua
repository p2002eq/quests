function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, mighty " .. e.other:GetName() .. "! Welcome to Stormguard Hall. I am Captain Furtog Ogrebane, only surviving descendant of the legendary Trondle Ogrebane, slayer of the [Mudtoes]. If you wish to serve the grand city of Kaladim. I urge you to speak with any of the trainers. Good day.");
	elseif(e.message:findi("mudtoes") and not e.message:findi("searching")) then
		e.self:Say("The Mudtoes were a small but mighty clan of ogres. My great father [Trondle] destroyed them. I have heard disturbing rumors of one Mudtoe surviving. Would you mind [searching for the Mudtoes] or have you other duties to perform?");
	elseif(e.message:findi("trondle")) then
		e.self:Say("Trondle was my great father and slayer of the Mudtoes. He was killed by those vile Crushbone orcs. If you truly wish to help Kaladim remain safe. speak with trainer Canloe Nusback. Say that you are ready to serve Kaladim.");
	elseif(e.message:findi("searching")) then
		e.self:Say("I have heard persistent rumors of two Mudtoe ogres who survived the slaughter.  Go to the port of Butcherblock.  Those dock hands must have heard of the name [Mudtoe].  Bring me the remaining heads of the Mudtoes!!  I want all the Mudtoes dead!!  Do not return until you have them both!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18766})) then -- Recruitment Letter
		e.self:Say("Greetings, friend, and welcome to Stormguard Hall! I am Furtog Ogrebane, Captain of the Guard. We shall train you to be a fearless warrior, who will serve and protect King Kazon well. Here is your tunic.  Now, let's begin your training.");
		e.other:SummonItem(13515); -- Dirt Stained Tunic*
		e.other:Faction(314,100); -- Storm Guard
		e.other:Faction(169,15); -- Kazon Stormhammer
		e.other:Faction(219,15); -- Miners Guild 249
		e.other:Faction(215,25); -- Merchants of Kaladim
		e.other:Faction(57,-25); -- Craknek Warriors
		e.other:AddEXP(100);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13316, item2 = 13317})) then -- Ogre Heads
		e.self:Say("Finally my great father's work has been completed. All the Mudtoe ogres have been exterminated. Thank you. Take this weapon which my father pried from the cold, dead hands of the Mudtoe ogre captain. It is called an ogre war maul. May you wield it with honor in the name of Kaladim.");
		e.other:SummonItem(6302); -- Ogre War Maul
		e.other:Faction(314, 25); -- Storm Guard
		e.other:Faction(169, 25); -- Kazon Stormhammer
		e.other:Faction(219, 25); -- Miners Guild 249
		e.other:Faction(215, 25); -- Merchants of Kaladim
		e.other:Faction(57, -25); -- Craknek Warriors
		e.other:AddEXP(250);
		e.other:GiveCash(0, 3, 7, 1);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
