--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("sneers darkly, revealing a row of unmanaged teeth beneath his grim visage. 'You travel too leniently, child of the light. Return to Selia, for you will find no welcoming here -- only darkness and shadow that would wish to consume you. However, if you are intent upon being among us, then by all means, do so at your own peril -- I care not for what fate befalls you and honestly, do not think you worthy of the shadow's service. Disregard my warnings if you must, but while you do so, do take the time to speak with the other adept minions of the shadow. They present most pressing arguments and will often give you the opportunity to learn from them the ways of their specific art. How marvelous it would be -- oh the irony indeed, that a child of the light would learn the ways of their craft from those whom they claim to detest! Aaaah. . . how you fuel us, and how we marvel at it.'");
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
