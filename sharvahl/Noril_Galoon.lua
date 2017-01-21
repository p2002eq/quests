function event_say(e)
	if(e.message:findi("more about shields")) then
		e.self:Say("Shields and bucklers are very versatile. They can be used to deflect blows, knock your opponents off balance, and even offer a secondary form of attack. If you want me to help you to modify your shield, I'll need you to gather some rough ore pieces. They can be taken from the rhinobeetles that reside in the moor. Place them in a forge with a flask of water and your set of files to create bolts. Combine the full bag of bolts and return the product and the buckler to me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5545})) then -- Leather Gripped Short Sword
		e.self:Emote("examines the hilt for a moment and hands the sword back to you.");
		e.self:Say("This looks like it will work fine.' He says. 'If you are up to doing me a favor, I can teach you how to modify your shield as well. Take this bag and these files and come back to me when you have some spare time and want to learn [more about shields].");
		e.other:SummonItem(5545); -- Leather Gripped Short Sword
		e.other:SummonItem(5546); -- Set of Engraved Files
		e.other:QuestReward(e.self,0,0,0,0,17605); -- Grime Covered Bag
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5556, item2 = 3452})) then -- Bag of Bolts & Buckler of the Recruit
		e.self:Say("Thanks for the Bag of Bolts " .. e.other:GetName() .. ".");
		e.self:Say("Thank you for making those for me. I was almost out. I'll modify your buckler immediately after I finish what I am doing here. Meanwhile, take this shopping list to Friaz. Do what you can to assist her. I need the bag of beetle horns she will give you if I am to work on your shield today.");
		e.other:QuestReward(e.self,0,0,0,0,18321); -- Friazs Shopping List
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5549})) then -- Bag of Beetle Horns
		e.self:Say("Great work " .. e.other:GetName() .. ".  Thanks for the tools to finish your upgrade.  Here is your new shield.  Take your buckler, cloak and sword back to Armsman Khaigesh and show him the progress you have made.");
		e.other:Faction( 132,10 ); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,5550,2000); -- Horn Covered Buckler
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
