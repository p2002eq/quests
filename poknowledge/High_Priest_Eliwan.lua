--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("makes an almost unearthly graceful gesture as he bows politely at the waist in formal greetings. 'May the light of Tunare shine brightly upon your fate, my friend, and may the purity of goodly virtues guide your convictions. I am High Priest Eliwan, former scholar, historian, and spiritual leader in the faith dedicated toward the Mother of All. In the era that housed my life, Takish`Hiz was my home in the beautiful forest of Elddar, the shining crown jewel of Tunare's grace and infinite splendor. We were at peace then -- the trolls and ogres had yet to rise against us and the foul Teir`Dal still far from their surfacing from the bowels of the underfoot. Eventually, the time would come for me to pass beyond and it was the light of Selia that seduced my spirit with its decadent allure of purity. Though I love my goddess, I did not wish to leave her service in the universe and this recent era has granted me the utmost pleasure of returning to that active service again.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 4881})) or (item_lib.check_turn_in(e.trade, {item1 = 4882})) or (item_lib.check_turn_in(e.trade, {item1 = 4883})) or (item_lib.check_turn_in(e.trade, {item1 = 4884})) or (item_lib.check_turn_in(e.trade, {item1 = 4885})) or (item_lib.check_turn_in(e.trade, {item1 = 4886})) or (item_lib.check_turn_in(e.trade, {item1 = 4887}))) then --Ethereal Mist Armor
		e.self:Say("Thank you, " .. e.other:GetName() .. "."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),698775); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
