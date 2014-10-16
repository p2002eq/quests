--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("closes his eyes and in a graceful motion, gives a low, sweeping bow. 'Greetings to you, friend, and welcome to the district of Selia. We are the beacon of light and justice, of all that is good and kind. As Tanaan is the cornerstone of neutrality, we are the shining jewel of righteousness, valor, and honor. I am Phantasmist Abaur and in my years upon Norrath, served as an enchanter within the arcane council of Freeport. Then, the city was in a fledgling state of being -- the Temple of Truth was still in the primordial beginnings of its construction and the city served mostly as a port rather than the functioning metropolis I'm told it has come to be today. If you practice the same art and require aid in learning the fundamental basic skills, then I will be more than pleased to oblige that necessity.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 1246})) or (item_lib.check_turn_in(e.trade, {item1 = 1247})) or (item_lib.check_turn_in(e.trade, {item1 = 1248})) or (item_lib.check_turn_in(e.trade, {item1 = 1249})) or (item_lib.check_turn_in(e.trade, {item1 = 1250})) or (item_lib.check_turn_in(e.trade, {item1 = 1251})) or (item_lib.check_turn_in(e.trade, {item1 = 1252}))) then --Insidious Armor, the comments on Alla's about this not being taken are in error, I believe.  It's Fine Insidious that's not taken.
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
