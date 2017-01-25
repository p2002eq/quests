---- Updated by Trust
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, friend. May I be of assistance?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6265})) then -- Note to Amat
		e.self:Say("So friend, I see Jaima is preparing you to deal with the sonic wolves. Have you heard the term 'sonic wolf' used yet? We call them that because of the face they do not use eyes like an ordinary wolf. They have overcome the night by using a sensory system similar to that of a bat. I sure hope we do not turn into such monstrosities over time... Blasted darkness! Well, back to your situation. You have your strainer, I'm sure. Now, you'll need to purchase the Sonic Wilf Bane books from my frien Qua in the other library and read them. Once you've read them, please take this voucher to Arrin Murij at the general mercantile. He will give you the staff that you will need for your weapon. Good luck, friend.");
		e.other:QuestReward(e.self,0,0,0,0,25270); -- Supply Voucher
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5544, item2 = 6268})) then -- Cloak of the Dar Khura Apprentice & Sonic Wolf Bane Spear
		e.self:Say("Well done!  You have proven your worth and can now be considered a Dar Khura Journeyman!");
		e.other:SummonItem(6268); -- Sonic Wolf Bane Spear
		e.other:QuestReward(e.self,0,0,0,0,6267,10000); -- Cloak of the Dar Khura Journeyman
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
