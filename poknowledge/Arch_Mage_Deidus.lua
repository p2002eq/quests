--Arch_Mage_Deidus.pl
--Planar Armor Exchange/Magician Tomes/Some other text, preserved but cleaned

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a loathsome, unwavering stare upon " .. e.other:GetName() .. ". His features are steely and cold in their disdain. 'Kartis is the place of shadow - the cornerstone of the seed of corruption in this universe. You have no place here as you are. Return to Selia. for you will find nothing of use to you here. If you intend to decipher the purpose of the shadow or interrupt the training of our disciples, then you are grievously mistaken in your cause. We will share nothing with the likes of you in the ways of knowledge. Though slowly, if you choose to remain, we shall corrupt and contort you to our will. Even through mere acts of training, you will be fueling the shadow and will become a part of it unwittingly or no.'");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 1239})) or (item_lib.check_turn_in(e.trade, {item1 = 1240})) or (item_lib.check_turn_in(e.trade, {item1 = 1241})) or (item_lib.check_turn_in(e.trade, {item1 = 1242})) or (item_lib.check_turn_in(e.trade, {item1 = 1243})) or (item_lib.check_turn_in(e.trade, {item1 = 1244})) or (item_lib.check_turn_in(e.trade, {item1 = 1245}))) then --Apothic Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
