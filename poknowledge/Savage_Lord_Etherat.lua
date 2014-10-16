--Beastlord Tomes/Planar Armor Exchange
--I added the tome handin, it didn't exist previously - Kilelen
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("performs an ancient, graceful gesture that is seemingly arcane in nature, though no energy can be felt entering or dispersing in the room. 'Tanaan welcomes you to its midst, traveler, There is much to be found in the whole of New Tanaan and specifically, the great library of Myrist. However, there is only so much that the tangible world can teach you. friend. for true, infinite knowledge lies eternally beyond the confines of material and astral domains. Within yourself. your very spirit and the spirits that surround you lays the key to true enlightenment and self-progress. Should you follow the path of the Beastlords. then I may be of aid in guiding your further toward the realization of your potential and the true elements surrounding you.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 7817})) or (item_lib.check_turn_in(e.trade, {item1 = 7818})) or (item_lib.check_turn_in(e.trade, {item1 = 7819})) or (item_lib.check_turn_in(e.trade, {item1 = 7832})) or (item_lib.check_turn_in(e.trade, {item1 = 7833})) or (item_lib.check_turn_in(e.trade, {item1 = 7834})) or (item_lib.check_turn_in(e.trade, {item1 = 7835}))) then --Anthemion Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
