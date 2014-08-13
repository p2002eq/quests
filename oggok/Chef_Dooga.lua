function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome you. You look all skin 'n bones. Eat you must do. Chef Dooga can fix up goodies for you. Try [HEHE meat].");
	elseif(e.message:findi("hehe meat")) then
		e.self:Say("It is a secret ground meat made with high elf, human, and Erudite Flesh. Mmmm. It good stuff. Dooga make it and [the Gobbler] make it. If you find any of those meats in the swamps bring to me and I pay you.");
	elseif(e.message:findi("gobbler")) then
		e.self:Say("You no hear of the Gobbler!! Him great butcher. Have all kinds of meat. Him am low on froglok legs. Dooga supply him. Dooga need someone to [deliver froglok legs].");
	elseif(e.message:findi("froglok legs")) then
		e.self:Say("You think so!! That be good thing. Make the Gobbler happy. Maybe he give you something good. Maybe not. You take this. Deliver meat.");
		e.other:SummonItem(13384);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13364})) then -- Human flesh
		e.self:Say("MmmmMmm. Human make good meat pies. Here. A little coins for you.");
		e.other:Faction(46,1); 	--Clurg
		e.other:Faction(57,1); 	--Craknek Warriors
		e.other:Faction(128,1); 	--Green Blood Knights
		e.other:Faction(232,1); 	--Oggok Gaurds
		e.other:Faction(169,-1);	--Kazon Stormhammer
		e.other:QuestReward(e.self,0,3,6,9,0,1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13365})) then -- High Elf flesh
		e.self:Say("High elf!! Now that is a good meat.  Goes good with Ogre Swill.");
		e.other:Faction(46,1); 	--Clurg
		e.other:Faction(57,1); 	--Craknek Warriors
		e.other:Faction(128,1); 	--Green Blood Knights
		e.other:Faction(232,1); 	--Oggok Gaurds
		e.other:Faction(169,-1);	--Kazon Stormhammer
		e.other:QuestReward(e.self,0,3,6,9,0,1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13452, item2 = 13452, item3 = 13452, platinum = 1})) then
		e.self:Say("Eww icky frogs. Me promise to give you reward, here yous go."); --Not actual text
		e.other:Faction(46,10); 	--Clurg
		e.other:Faction(57,10); 	--Craknek Warriors
		e.other:Faction(128,10); 	--Green Blood Knights
		e.other:Faction(232,10); 	--Oggok Gaurds
		e.other:Faction(169,-15);	--Kazon Stormhammer
		e.other:QuestReward(e.self,0,0,0,0,12217);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
