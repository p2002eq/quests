--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("peels back his thin, scaled lips, revealing a row of flawless tiny fangs in a grim gaze that brings even the bravest paladin to a moment of hesitation. 'We are somewhat. . . put off by your presence among us, though this is something I'm certain will not take long to remedy once you understand the peril you have come into. Strange, however, that you would wander into Kartis of either your own free will or the misdirection of your own footsteps. Perhaps you feel that you may learn from us what the other minions of the shadow have kept in their souls to use against us. I assure you, no such thing will come as you expect. Begone from this place, " .. e.other:GetName() .. ", for you will only burden or distract the best of us with the temptation to lure you into our folds. Aaaah, yes, that is the action of Kartis -- to bring our shadow into your soul, for we have emerged beyond the blade and drawing of blood in our convictions. By all means, continue in our midst and engage in that test if you believe yourself above it.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 1232})) or (item_lib.check_turn_in(e.trade, {item1 = 1233})) or (item_lib.check_turn_in(e.trade, {item1 = 1234})) or (item_lib.check_turn_in(e.trade, {item1 = 1235})) or (item_lib.check_turn_in(e.trade, {item1 = 1236})) or (item_lib.check_turn_in(e.trade, {item1 = 1237})) or (item_lib.check_turn_in(e.trade, {item1 = 1238}))) then --Blighted Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
