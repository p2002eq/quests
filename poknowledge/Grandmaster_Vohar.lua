--Monk Tomes/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sneers coldly, his face contorting into a wretched, gruesome stare of hate. His eyes fill with an untamed, feral bloodlust as his low, hissing voice begins to seep from his throat. 'You stand within the district of Kartis -- the cradle of the seed of corruption in the universe. How strange it is that we find a child of the goodly mortal virtues willingly engaging in conversation with those they have sworn to destroy. I see that perhaps you feel yourself immune to the corruption, or that you will cast down your blade and use wit and the power of your 'pure' soul to overcome the shadow at its core. How amusing -- pathetically naive and vain, but amusing nonetheless. Learn from our adepts -- convince yourself it is a means to learn our secrets, if you will, but learn from us. You will serve us most efficiently without even a conscious awareness of your deeds.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 1201})) or (item_lib.check_turn_in(e.trade, {item1 = 1202})) or (item_lib.check_turn_in(e.trade, {item1 = 1203})) or (item_lib.check_turn_in(e.trade, {item1 = 1204})) or (item_lib.check_turn_in(e.trade, {item1 = 1205})) or (item_lib.check_turn_in(e.trade, {item1 = 1206}))) then --Shiverback-hide Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
