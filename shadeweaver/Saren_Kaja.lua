---- Quest: Chialle's Friendship Ring
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there friend, would you like to buy some of my delicious [Payala] goodies?");
	elseif(e.message:findi("Payala")) then
		e.self:Say("Payala has the sweetest nectar in all the lands. You can find them throughout the thicket beneath the blue leafed Payala tree. Try some. I have many Payala goodies for sale. I always say, 'the quickest way to someones heart is a freshly baked Payala tart!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30619, item2 = 30619, item3 = 30619, item4 = 30619})) then -- 4x Payala Fruit
		e.self:Say("Oh thank you ever so much! You are truly as sweet as the gift you bring.");
		e.self:Say("You're just wonderful " .. e.other:GetName() .. "! I have little to repay your kindness with, but I will squeeze you some fresh Payala Nectar.");
		e.other:Faction(132,1); -- Guardians of SharVahl
		e.other:QuestReward(e.self,0,0,0,0,30625,1000); -- Sweet Payala Nectar
	end
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
