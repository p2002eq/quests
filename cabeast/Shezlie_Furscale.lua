function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Be careful around here. " .. e.other:GetName() .. ". Injured broodlings are no use to anyone. Many of these structures are yet unstable and could fall at any time. If you're a mystic, I can teach you how to [protect] yourself.");
	elseif(e.message:findi("protect")) then
		e.self:Say("Yes indeed. As a broodling, you will need some protection to avoid any... unfortunate accidents. Should you wish, I can fashion some [armor] for you from some basic components. Provided you risk your life gathering them for me first.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Armor, indeed. I can fashion protection for your [chest], [hands], [legs], or [head].");
	elseif(e.message:findi("chest")) then
		e.self:Say("To make a breastplate for you, you will have to bring me some banded mail, a star ruby, some watchman's spectacles, and some nectar of isolation. Now hurry back.");
	elseif(e.message:findi("hands")) then
		e.self:Say("For gauntlets, I will need some banded gauntlets, a ruby, some venomous parchment, and a warlord drawing pen.");
	elseif(e.message:findi("legs")) then
		e.self:Say("If you want to protect your legs with some greaves, then bring me some banded leggings, a fire emerald, a sarnak recruitment letter, and an exiled iksar head.");
	elseif(e.message:findi("head")) then
		e.self:Say("For a helment, bring me a banded helm, a sapphire, Bargynn's Digger, and Sythrax building plans.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 3056, item2 = 10032, item3 = 14777, item4 = 14778})) then
		e.self:Say("Ah. Very good. Take this breastplate for your own good.");
		e.other:SummonItem(4989); --scaled mystic breastplate
		e.other:Faction(282,10);
		e.other:Faction(193,5);
		e.other:Faction(30,5);
		e.other:AddEXP(2000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3062, item2 = 10035, item3 = 14773, item4 = 14774})) then
		e.self:Say("Hmmm? Oh. Your gauntlets. Yes. Here you are. Now be careful.");
		e.other:SummonItem(4985); --scaled mystic gauntlets
		e.other:Faction(282,10);
		e.other:Faction(193,5);
		e.other:Faction(30,5);
		e.other:AddEXP(1000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3063, item2 = 10033, item3 = 14775, item4 = 14776})) then
		e.self:Say("Ahhh yes. These will protect your legs from the threat of tables.");
		e.other:SummonItem(4987); --scaled mystic greaves
		e.other:Faction(282,10);
		e.other:Faction(193,5);
		e.other:Faction(30,5);
		e.other:AddEXP(1000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3053, item2 = 10034, item3 = 14771, item4 = 14772})) then
		e.self:Say("Take this helment and keep your head down when you leave. The door is a little low.");
		e.other:SummonItem(4990); --scaled mystic helm
		e.other:Faction(282,10);
		e.other:Faction(193,5);
		e.other:Faction(30,5);
		e.other:AddEXP(1000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
