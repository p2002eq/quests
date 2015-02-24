--Warrior Tomes/Planar Armor Exchange
--Created file, added warrior tomes as well -Kilelen
function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 5174})) or (item_lib.check_turn_in(e.trade, {item1 = 5175})) or (item_lib.check_turn_in(e.trade, {item1 = 5176})) or (item_lib.check_turn_in(e.trade, {item1 = 5177})) or (item_lib.check_turn_in(e.trade, {item1 = 5178})) or (item_lib.check_turn_in(e.trade, {item1 = 5179})) or (item_lib.check_turn_in(e.trade, {item1 = 5180})) or (item_lib.check_turn_in(e.trade, {item1 = 5181}))) then --Legionnaire Scale Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. ".");--Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
