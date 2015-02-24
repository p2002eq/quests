--Beginner Combat Manual
--As a note, according to posts at Alla's (not the most reliable source I know,
--but all I've got right now) the Beginner's quests eat the Planar Traveler's Manual,
--so that quest must be completed 3 times in order to do all the Beginner's Manual
--Quests.  This is intended behaviour.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". If you are looking for something in particular, I might be able to help you. I spent many years teaching combat techniques to the finest warriors in Grobb. I came to New Tanaan to further develop my teaching skills; it seems we all have our own lessons to learn. I can teach you a few things if you are looking to be taught. I will teach you the basics of planar combat if you are [willing to learn].");
	elseif(e.message:findi("willing to learn")) then
		e.self:Say("This is good. One of the most important aspects to your battle readiness is your strong willpower and bravery. Years ago I discovered a particular concoction that will very readily put your willpower to the test. Unfortunately I ran out not too long ago and I am in need of some more [Planar Blood Brew]. If you can make some more for my students, it would certainly look favorably upon you in your future teachings. Bring me some along with your Planar Traveler's Manual.");
	elseif(e.message:findi("planar blood brew")) then
		e.self:Say("To make the infamous Planar Blood Brew, you must attain some Nightmare Mephit Blood, Slarghilug Blood, Bubonian Blood, Soda Water, Grapes, a Cask, a Cork, and a Corking Device. Mix them in a Brew Barrel, and if you are skilled enough, the resulting swill should curl the hairs on even the hardiest of traveler's heads!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28787, item2 = 28745})) then --Planar Blood Brew, Planar Traveler's Manual
		e.self:Say("Wow, this is great! Wow! This is may be the best Planar Blood Brew I have ever tasted! You have passed the first test with flying colors. Here, you take this book and learn well from it. When you are ready for your next lesson, speak to Xasri Virek.");
		e.other:QuestReward(e.self,0,0,0,0,28788); --Beginner Combat Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
