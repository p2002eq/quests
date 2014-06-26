--Note: All text contained herein is non-Live. Need to acquire original

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, youngling. Are you here seeking wisdom or are you here to [work]?");
	elseif(e.message:findi("work")) then
		e.self:Say("Ah! Excellent! Than you shall acquire wisdom THROUGH work! As a mystic, you will need to learn [arts of creation], and you can learn that by watching me work.");
	elseif(e.message:findi("arts")) then
		e.self:Say("Yes yes... the arts of creation. You'll need to do some leg work in the fields to gather the materials for me to show you how to create [boots], [bracers], a [cloak], or [vambraces].");
	elseif(e.message:findi("boots")) then
		e.self:Say("I'll need you to bring me some banded boots, a fire emerald, some spirit caller beads, and a rhino hoof. Come back to me when you have all the components and then give them to me, then I'll show you how to make boots.");
	elseif(e.message:findi("bracers")) then
		e.self:Say("I'll need you to bring me a banded bracer, a ruby, a coercion implant, and some gooey adhesive. Bring all that back to me and I'll show you how to make a bracer.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("To make a cloak for you, I'll need a banded cloak, a star ruby, a forest giant hammer, and some worn charbone. Good luck getting all those components together. Bring them back when you have them and I'll show you how to make your cloak.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("Ah! You want arm coverings? Well fetch me some banded sleeves, a sapphire, a frenzied gnawer tail, and some froglok treated planks.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 3064, item2 = 10033, item3 = 14767, item4 = 14768})) then
		e.self:Say("Ah! Excellent! Now just watch... and... here! Now you know how to make your own boots! Take this pair in case you didn't actually learn anything.");
		e.other:AddEXP(1000);
		e.other:SummonItem(4984); --scaled mystic boots
		e.other:Faction(282,10);
		e.other:Faction(193,5);
		e.other:Faction(30,5);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3061, item2 = 10035, item3 = 14769, item4 = 14770})) then
		e.self:Say("What's this? Oh the parts for your bracer. Well just watch me work... and... done! Take these as an example of what a skilled craftsman can do. Strive for this perfection.");
		e.other:SummonItem(4988); --scaled mystic bracers
		e.other:AddEXP(1000);
		e.other:Faction(282,10);
		e.other:Faction(193,5);
		e.other:Faction(30,5);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3058, item2 = 10032, item3 = 14765, item4 = 14766})) then
		e.self:Say("Well you finally brought the parts to learn how to make your cloak. Just watch this... and... all done. It's not the best I've ever made, but it's fitting for a novice.");
		e.other:SummonItem(4991); --scaled mystic cloak
		e.other:AddEXP(1000);
		e.other:Faction(282,10);
		e.other:Faction(193,5);
		e.other:Faction(30,5);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3060, item2 = 10034, item3 = 14763, item4 = 14764})) then
		e.other:AddEXP(1000);
		e.other:SummonItem(4986); --scaled mystic vambraces
		e.other:Faction(282,10);
		e.other:Faction(193,5);
		e.other:Faction(30,5);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
