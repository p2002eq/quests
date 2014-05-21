function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Step forward and speak up, young " .. e.other:GetName() .. "! Kaladim can always use another warrior. Are you [ready to serve Kaladim] or has a yellow streak appeared down your back?");
	elseif(e.message:findi("ready to serve kaladim")) then
		e.self:Say("Then serve you shall. Let your training begin on the battlefields of Faydwer. Seek out and destroy all [Crushbone orcs]. Return their belts to me.  I shall also reward you for every two orc legionnaire shoulder pads  returned.  A warrior great enough to slay one legionnaire shall surely have no problem with another.  Go. and let the cleansing of Faydwer begin.");
	elseif(e.message:findi("crushbone orcs")) then
		e.self:Say("The army of the Crushbone orcs is deadly indeed. They are great military strategists. It was a legion of them that brought down the great [Trondle Ogrebane]. Speak with Furtog Ogrebane about the Crushbones. He has need of warriors such as you.");
	elseif(e.message:findi("trondle ogrebane")) then
		e.self:Say("Trondle Ogrebane is the legary dwarven warrior who single-handedly exterminated the ogre clan called the [Mudtoes]. He was recently killed in battle. It took an entire legion of Crushbone orcs to bring him down. Furtog is still fuming about that.");
	elseif(e.message:findi("mudtoes")) then
		e.self:Say("The Mudtoes were a small clan of ogres. They lived somewhere in the Butcherblock Mountains. They had an insatiable appetite for dwarves. They were finally destroyed by the hand of Trondle Ogrebane.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13318, item2 = 13318, item3 = 13318, item4 = 13318})) then
		e.self:Say("Good work, warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
		e.other:SummonItem(eq.ChooseRandom(9009,2113,2114,2115,2116,2117,2118,2119,2120,2122,2123,2124));
		e.other:Faction(314,40);
		e.other:Faction(169,40);
		e.other:Faction(219,40);
		e.other:Faction(215,40);
		e.other:Faction(57,-120);
		e.other:AddEXP(14580);
		e.other:GiveCash(0,eq.ChooseRandom(5,6,7,8,9,10,11,12,13,14,15),0,0);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13318, item2 = 13318, item3 = 13318})) then
		e.self:Say("Good work, warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
		e.other:SummonItem(eq.ChooseRandom(9009,2113,2114,2115,2116,2117,2118,2119,2120,2122,2123,2124));
		e.other:Faction(314,30);
		e.other:Faction(169,30);
		e.other:Faction(219,30);
		e.other:Faction(215,30);
		e.other:Faction(57,-90);
		e.other:AddEXP(10935);
		e.other:GiveCash(0,eq.ChooseRandom(5,6,7,8,9,10,11,12,13,14,15),0,0);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13318, item2 = 13318})) then
		e.self:Say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
		e.other:SummonItem(eq.ChooseRandom(9009,2113,2114,2115,2116,2117,2118,2119,2120,2122,2123,2124));
		e.other:Faction(314,20);
		e.other:Faction(169,20);
		e.other:Faction(219,20);
		e.other:Faction(215,20);
		e.other:Faction(57,-60);
		e.other:AddEXP(7290);
		e.other:GiveCash(0,eq.ChooseRandom(5,6,7,8,9,10,11,12,13,14,15),0,0);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13318})) then
		e.self:Say("Good work. warrior! Now continue with your training. Only on the battlefield can one become a great warrior.");
		e.other:SummonItem(eq.ChooseRandom(9009,2113,2114,2115,2116,2117,2118,2119,2120,2122,2123,2124));
		e.other:Faction(314,10);
		e.other:Faction(169,10);
		e.other:Faction(219,10);
		e.other:Faction(215,10);
		e.other:Faction(57,-30);
		e.other:AddEXP(3645);
		e.other:GiveCash(0,eq.ChooseRandom(5,6,7,8,9,10,11,12,13,14,15),0,0);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13319, item2 = 13319})) then
		e.self:Say("Aha!! You have downed a Crushbone legionnaire!! You have shown yourself to be a strong warrior. Take this. This is more becoming of a great warrior such as yourself. Let no creature stand in the way of the Stormguard!");
		e.other:SummonItem(10017);
		e.other:Faction(314,10);
		e.other:Faction(169,10);
		e.other:Faction(219,10);
		e.other:Faction(215,10);
		e.other:Faction(57,-30);
		e.other:AddEXP(7290);
		e.other:GiveCash(0,0,4,0);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
