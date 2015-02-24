--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a gentle smile and polite bow of respect to " .. e.other:GetName() .. ". 'Greetings and welcome to the district of Tanaan, traveler. This place of neutrality is quite content to have you among us, learning from us what we humbly can teach you. Many adepts who were adventurers not too different from yourself have stepped forward and offered their memories as present lessons to those willing to learn of them. I myself was a master of the elements in my time, though I do not make this declaration as one that craves due respect for the title. Rather, I hope that you may perhaps be of the same path and if you need tutoring in the way of skills, then I would be more than pleased to oblige your needs.'");
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
