--Rogue Tome Handins/Planar Armor Exchange
---- Added update for Training Day - mrhodes
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a sharply raised brow and cruelly wicked smirk, his comely features contorted in a sinister mask of disgust and amusement. 'Well, how charming of you to find it within your heart to visit Kartis, my dear pathetic " .. e.other:GetName() .. ". Do not think that you will be received in the manner you had hoped, for we are in the city of knowledge where tolerance for all beings to one extent or another is mandatory. Aaaah, yes, we will tolerate your existence among us, but only for the amusement of watching you squirm uncomfortably when presented with the truth of our purpose. Even further the amusement would stretch is if you would have the audacity to train from one of our adepts -- who are, I assure you, most eager to lend their dark arts to you, for it only fuels the shadow, despite your intent on learning from us.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- hate armor trade-ins disabled
	-- if((item_lib.check_turn_in(e.self, e.trade, {item1 = 4901})) or (item_lib.check_turn_in(e.self, e.trade, {item1 = 4902})) or (item_lib.check_turn_in(e.self, e.trade, {item1 = 4903})) or (item_lib.check_turn_in(e.self, e.trade, {item1 = 4904})) or (item_lib.check_turn_in(e.self, e.trade, {item1 = 4905})) or (item_lib.check_turn_in(e.self, e.trade, {item1 = 4906})) or (item_lib.check_turn_in(e.self, e.trade, {item1 = 4907}))) then --Woven Shadow Armor
		-- e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		-- e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	-- end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
