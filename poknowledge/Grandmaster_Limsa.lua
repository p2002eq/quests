--Monk Tomes/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("closes his eyes and gives a deep-seated bow before " .. e.other:GetName() .. ". 'Greetings, traveler. I am Grand Master Limsa, master of the tranquil order of the Tanaan district of the Plane of Knowledge. Monks of both Norrathian orders may approach me for guidance and knowledge through the long path of self-mastery and discipline.'");
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
