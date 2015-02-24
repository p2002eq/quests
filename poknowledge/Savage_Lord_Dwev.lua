--Beastlord Tomes/Planar Armor Exchange
--I added the tome handin, it didn't exist previously - Kilelen
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("growls lowly, the rumble from the depths of his throat akin to that of a starved tiger prepared to pounce upon its first prey. 'Yoo worm! Yoo worm stupidly come to shadow, and now shadow wants worm to be its slave. Worm shood stay and be shadow's slave, be Dwev's slave. Dwev teech worm how to rip spirits frum spirit world and make beasts worm's slaves, like worm be to Dwev! HAHA! Yes. Dwev smart! Dwev serve shadow faith. . . faithful. . . gud with new worm slave.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 7817})) or (item_lib.check_turn_in(e.trade, {item1 = 7818})) or (item_lib.check_turn_in(e.trade, {item1 = 7819})) or (item_lib.check_turn_in(e.trade, {item1 = 7832})) or (item_lib.check_turn_in(e.trade, {item1 = 7833})) or (item_lib.check_turn_in(e.trade, {item1 = 7834})) or (item_lib.check_turn_in(e.trade, {item1 = 7835}))) then --Anthemion Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
