--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a deep, respectful nod of his head toward " .. e.other:GetName() .. ". 'Welcome, " .. e.other:GetName() .. ". I am Sorcerer Farin, ancient wizard of Erudin and head sorcerer of Selia. In light of your arrival, those who walk the path of light and hold the virtues of honor and justice high in their spirits. I offer my aid to any that would be so obliged as to accept it. In my former years, I was one of few guild masters in the newfound city of Erudin and what knowledge I have of that past is at your disposal.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 1225})) or (item_lib.check_turn_in(e.trade, {item1 = 1226})) or (item_lib.check_turn_in(e.trade, {item1 = 1227})) or (item_lib.check_turn_in(e.trade, {item1 = 1228})) or (item_lib.check_turn_in(e.trade, {item1 = 1229})) or (item_lib.check_turn_in(e.trade, {item1 = 1230})) or (item_lib.check_turn_in(e.trade, {item1 = 1231}))) then --Carmine Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
