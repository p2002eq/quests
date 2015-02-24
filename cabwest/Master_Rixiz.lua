function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You are on the grounds of the Brood of Kotiz. If you do not belong, you must leave at once. There shall be no [third rank skullcap] for you.");
	elseif(e.message:findi("third rank skullcap")) then
		e.self:Say("I offer the third rank apprentice skullcap to those who wear the second. If that is you, then you will do the [bidding of the tower].");
	elseif(e.message:findi("bidding of the tower")) then
		e.self:Say("Take this glass canopic. Within it you shall place a brain for me. The brain I seek is that of a sarnak crypt raider. Any shall do. The ones we seek should be near the Lake of Ill Omen. When you obtain the brain, you must quickly put it into the glass canopic with [embalming fluid]. When these are combined, the canopic shall seal and if you return it to me with your second rank skullcap, I shall hand you the next and final skullcap.");
		e.other:SummonItem(17023);
		e.self:Say("You shall get no skullcap until I have the preserved raider brain and your second circle apprentice skullcap.");
	elseif(e.message:findi("embalming fluid")) then
		e.self:Say("Embalming fluid is created through brewing, but do not drink it!! You can learn about the process of brewing on our grounds.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- preserved sarnak brain and necro skull cap 2, gives skull cap 3
	if(item_lib.check_turn_in(e.trade, {item1 = 12411, item2 = 4261})) then
		e.self:Say("You have done well. Here is your final apprentice skullcap.");
		e.other:SummonItem(4262);
		e.other:Faction(193,20);
		e.other:Faction(24,20);
		e.other:AddEXP(150);
		e.other:GiveCash(0,0,10,0);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14794})) then
		e.self:Emote("takes the note and after reading a few lines opens his eyes wide in astonishment. He looks up at you and stares at you a while before he says,");
		e.self:Say("You spoke to the Brothers? A common soldier such as yourself interested in silly stories to frighten broodlings? Fine, then. You shall know confidence, if you live. If you have the strength to stride into a lair, go before the owner, and kill that thing in its own home, you will acquire a small part of the virtue we as necromancers must master to ply our art. In the Frontier Mountains lives a unit of the troublesome burynai. Invade their home and destroy their leader. Bring me proof and two fire emeralds.");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 14810, item2 = 10033, item3 = 10033})) then
		e.self:Say("Well done, here is your reference.");
		e.other:SummonItem(14813);
		e.other:AddEXP(10000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
