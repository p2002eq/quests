--Ranger Tomes/Planar Armor Exchange
--Added tome turn-ins -Kilelen
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("closes her eyes and gives a nod of respect to " .. e.other:GetName() .. ". 'Welcome to the district of Tanaan. You will find the cornerstone of neutrality and balance within the whole of the known universe resides in the hearts, spirits, and minds of Tanaan's citizens. We accept all in our midst, should they choose not to disrupt what we have striven for countless eras to create and preserve with the speeches of the zealous. Both crusaders of light and shadow threaten our ways, though we do not hold a true disdain toward either. We are the true soldiers of balance -- that which you do not even realize you strive for in your valiant causes. Understand that light will pit against light should it overrun the primal universe, and likewise shall shadow consume shadow. We of Tanaan embrace this philosophy and live by its code most fiercely. If you are unable to yield to this path during your visit of us, then I would humbly suggest that you seek the district of Selia where the other soldiers of the light dwell.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 4891})) or (item_lib.check_turn_in(e.trade, {item1 = 4892})) or (item_lib.check_turn_in(e.trade, {item1 = 4893})) or (item_lib.check_turn_in(e.trade, {item1 = 4894})) or (item_lib.check_turn_in(e.trade, {item1 = 4895})) or (item_lib.check_turn_in(e.trade, {item1 = 4896})) or (item_lib.check_turn_in(e.trade, {item1 = 4897}))) then --Thorny Vine Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
