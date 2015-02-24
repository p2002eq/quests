--Bard Tomes/Planar Armor Exchange
--Added tome handins - Kilelen
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a warm smile of her comely features and a delicate bow of her head in greetings. 'Good day to you, " .. e.other:GetName() .. ", and welcome to the district of Selia. You will find that the light and mortal virtues of justly kindness, honor, valor, and untainted passion are represented in full upon this plane in our midst. Rather, each of the three districts that house the adepts of New Tanaan represent and fulfill the core elements and pure essence of mortal virtues within the universe, we collectively embody that of the light. I'm certain you will find yourself at home among us, and for this we are pleased and grateful. During your stay with us, I would suggest that you seek our adepts and merchants, for the knowledge we hold cannot be found in the library of Myrist. for it is one that is the key to purity and faith of the light. If you are one of the bardic traditions, then I may be of assistance to you should you need training the ways of your skills. Otherwise, it has been a pleasure to make your acquaintance.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 4861})) or (item_lib.check_turn_in(e.trade, {item1 = 4862})) or (item_lib.check_turn_in(e.trade, {item1 = 4863})) or (item_lib.check_turn_in(e.trade, {item1 = 4864})) or (item_lib.check_turn_in(e.trade, {item1 = 4865})) or (item_lib.check_turn_in(e.trade, {item1 = 4866})) or (item_lib.check_turn_in(e.trade, {item1 = 4867}))) then --Imbrued Platemail Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
