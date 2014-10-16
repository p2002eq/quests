--Willamina's Needles/Planar Armor Exchange/Magician Tomes
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a deep nod of his head in formal and polite recognition of " .. e.other:GetName() .. " before him. 'Greetings. traveler. and welcome to the district of Tanaan. In light of your presence among us. we have gathered our knowledge and memories of lives past upon Norrath in hopes that our experiences would benefit you in the present. Do not hesitate to approach all citizens of this district. for we are equally fair and willing to grant you the aid that is within our individual power to provide. In my own personal experience upon Norrath. I was a wizard of some power -- though I do not boast. I have offered my knowledge of this art to any who would have the desire to learn from me. Unfortunately. time is not a luxury that you posses in the manner that we of the Plane are graced and thus. I may only offer instruction on skills. If you are in need of spells. then the library of Myrist should be your destination. The scholars there are infinitely wise despite their mortal lineage.'");
	elseif(e.message:findi("jewel")) then
		e.self:Emote("slams his book shut. 'So, the snake has legs after all! Tell Onirelin if he wants this back, he can come here himself and kiss my. . ., no wait. I have a better idea.' He draws closer and whispers, 'Did Onirelin tell you why I took this jewel? I did it in response to him taking my lady love, Elisha Dirtyshoes. We were to be married until she ran off with him. However, she also ran off with my engagement ring I gave to her. It is quite valuable to me, and I would be most happy to have it back. If you can procure it from her, I'll give Onirelin his jewel back. He's suffered long enough, I think.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28087})) then --Narik's Ring
		e.self:Say("This is truly excellent. You have done well recovering this for me. You may take Onirelin's jewel and also tell him never to set foot near me again. Leave me now, I have much work to do.");
		e.other:QuestReward(e.self,0,0,0,0,28088,250); --Onirelin's Jewel
	end
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
