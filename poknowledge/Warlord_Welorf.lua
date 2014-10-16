--Warrior Tomes/Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gathers a deep breath, his body seeming unnaturally stiff within the large suit of iron. His cold, steely eyes glance over you once before addressing you in a low, baritone voice. 'You stand before Welorf, Warlord of the North and former chief of the Steel Warrior's clan. Should you be a warrior, the knowledge of my blade is at your reach and perhaps in time, and with some training, a proper warrior can borne of the weak creature I see before me.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 4911})) or (item_lib.check_turn_in(e.trade, {item1 = 4912})) or (item_lib.check_turn_in(e.trade, {item1 = 4913})) or (item_lib.check_turn_in(e.trade, {item1 = 4914})) or (item_lib.check_turn_in(e.trade, {item1 = 4915})) or (item_lib.check_turn_in(e.trade, {item1 = 4916})) or (item_lib.check_turn_in(e.trade, {item1 = 4917}))) then--Indicolite Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
