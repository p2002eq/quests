--Paladin Tomes/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("kneels low before " .. e.other:GetName() .. ", offering a humble gesture of respect and greetings. 'The light of Selia embraces thee, my friend. If you reside in our midst in searching for knowledge and guidance, then know that we are your servants in that quest. Should you be a paladin, and your object of faith is of no consequence in this matter, then my services are humbly at your disposal should you need or wish them.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 4851})) or (item_lib.check_turn_in(e.trade, {item1 = 4852})) or (item_lib.check_turn_in(e.trade, {item1 = 4853})) or (item_lib.check_turn_in(e.trade, {item1 = 4854})) or (item_lib.check_turn_in(e.trade, {item1 = 4855})) or (item_lib.check_turn_in(e.trade, {item1 = 4856})) or (item_lib.check_turn_in(e.trade, {item1 = 4857}))) then --Valorium Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
