--Planar Armor Exchange
--New file, no text at all for him, so just going with the armor turn-ins and that's all.
function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 5182})) or (item_lib.check_turn_in(e.trade, {item1 = 5183})) or (item_lib.check_turn_in(e.trade, {item1 = 5184})) or (item_lib.check_turn_in(e.trade, {item1 = 5185})) or (item_lib.check_turn_in(e.trade, {item1 = 5186})) or (item_lib.check_turn_in(e.trade, {item1 = 5187})) or (item_lib.check_turn_in(e.trade, {item1 = 5188})) or (item_lib.check_turn_in(e.trade, {item1 = 5189}))) then --Scaled Hierophant Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
