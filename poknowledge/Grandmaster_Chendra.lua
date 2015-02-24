--Monk Tomes/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a deep-seated bow of respect and humble greetings. Her voice is gentle and calm, like the soothing melody of a grandmother with the youth of a newborn wind. 'Greetings, my friend, and may the light watch over your path. The district of Selia is one of light and upholds its virtues fervently, though we do not seek to impose upon others in our humble plane. You will find many whom, upon your world, are enemies but here, though they look upon you with disdain, are ultimately your equals in the quest for knowledge and enlightenment. If you are a student of the disciplines of the monk, then I shall lend my knowledge to you whenever you are in need of lessons in the martial skills of our order.'");
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
