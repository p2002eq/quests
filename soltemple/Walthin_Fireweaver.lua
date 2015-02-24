-- Quests for Bard Lambent Armor

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". I am Walthin Fireweaver of the Temple of Solusek Ro. I am the protector of an ancient armor invented by long dead bards of the temple. This armor will help any bard in their journey across Norrath. Are you a bard that would desire to own some of this armor?");
	elseif(e.message:findi("no")) then
		e.self:Say("Very well.");
	elseif(e.message:findi("yes")) then
		e.self:Say("Very well. I craft a type of bardic armor that I invented called Lambent Armor. I can craft for you [boots], [gauntlets], and [greaves]. My friend Cryssia Stardreamer will craft for you the other pieces. I require a special kind of lambent stone for each of my armor pieces.  Find my friends Orstorm, Genni, Gardern, and Vilissia within the temple and they will help you create them.");
	elseif(e.message:findi("boots")) then
		e.self:Say("Alright, I will require some items. Go and get me some Firewalker Boots, a Lambent Sapphire, and the middle piece of the Rune of the One Eye. Return to me with these items and I will craft your boots.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("Alright, I need you to retrieve for me some Black Silk Gloves, a Lambent Star Ruby, and Shin Gauntlets. Return to me with these and I will craft your gauntlets.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("Very well, return to me with these items and I will craft them. A set of Icy Greaves, a Lambent Fire Opal, and Shin Greaves.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 2318, item2 = 10119, item3 = 10561})) then
		e.self:Say("Excellent. Here are your Lambent Boots.");
		e.other:Faction(320,5);        -- Temple of Solusek Ro better
		e.other:Faction(291,-5);       -- Shadow Men worse
		e.other:QuestReward(e.self,0,0,0,0,4159,1000); --boots
	elseif(item_lib.check_turn_in(e.trade, {item1 = 2319, item2 = 10117, item3 = 4114})) then
		e.self:Say("Excellent. Here are your Lambent Gauntlets.");
		e.other:Faction(320,5);        -- Temple of Solusek Ro better
		e.other:Faction(291,-5);       -- Shadow Men worse
		e.other:QuestReward(e.self,0,0,0,0,4157,1000); --gauntlets
	elseif(item_lib.check_turn_in(e.trade, {item1 = 4115, item2 = 10128, item3 = 4116})) then
		e.self:Say("Excellent. Here are your Lambent Greaves.");
		e.other:Faction(320,5);        -- Temple of Solusek Ro better
		e.other:Faction(291,-5);       -- Shadow Men worse
		e.other:QuestReward(e.self,0,0,0,0,4158,1000); --greaves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
