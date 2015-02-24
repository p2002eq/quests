--Quest Name: Necromancer Spells
--Author: JanusD
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Ahh, welcome! More souls to succumb to the inhabitants of the Outlands! My army of undead will grow stronger by the day, but it would be a pity if you perished before doing a [mortal bidding] for me.");
	elseif(e.message:findi("mortal bidding")) then
		e.self:Say("I see it as a win-win situation for me. If you succeed, I'll gain more power from the knowledge you bring back to me. If you fail, you become another addition to my undead minions. Thus, you cannot fail me in returning a scroll of Splurt, Defoliation, Covergence, or Thrall of Bones. In return, I will part with a scroll of mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 19423}) or item_lib.check_turn_in(e.trade, {item1 = 19296}) or item_lib.check_turn_in(e.trade, {item1 = 19294}) or item_lib.check_turn_in(e.trade, {item1 = 19299})) then
		e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19297,19421,19408,19409),500);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
