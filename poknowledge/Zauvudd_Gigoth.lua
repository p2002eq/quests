--Zauvudd_Gigoth (202045)
--zone: Plane of Knowledge
--Beginner Combat Manual Questline

--As a note, according to posts at Alla's (not the most reliable source I know,
--but all I've got right now) the Beginner's quests eat the Planar Traveler's Manual,
--so that quest must be completed 3 times in order to do all the Beginner's Manual
--Quests.  This is intended behavior.


function event_say(e)
	if (e.other:GetLevel() >= 20 and e.other:HasItem(28745)) then	--Requires min level 20 and Planar Traveler's Manual
		if (e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". I see you have obtained a manual on planar travel. It is good to see your determination has taken its first step to true glory. I think you may finally be ready to learn the basics of planar combat, that is if you are [" .. eq.say_link("willing to learn") .. "]. Remember, courage is imperial. It underlies true achievement. With your courage you shall achieve many great things.");
		elseif(e.message:findi("willing to learn")) then	
			e.self:Say("This is good. One of the most important aspects to your battle readiness is your strong willpower and bravery. Years ago I discovered a particular concoction that will very readily put your willpower to the test. Unfortunately I ran out not too long ago and I am in need of some more [" .. eq.say_link("Planar Blood Brew") .. "]. If you can make some more for my students, it would certainly look favorably upon you in your future teachings. Bring me some along with your Planar Traveler's Manual.");
		elseif(e.message:findi("planar blood brew")) then	
			e.self:Say("To make the infamous Planar Blood Brew, you must attain some Nightmare Mephit Blood, Slarghilug Blood, Bubonian Blood, Soda Water, Grapes, a Cask, a Cork, and a Corking Device. Mix them in a Brew Barrel, and if you are skilled enough, the resulting swill should curl the hairs on even the hardiest of traveler's heads!");
		end
	elseif(e.message:findi("hail")) then	
		e.self:Say("Hello, " .. e.other:GetName() .. ". If you are looking for something in particular, I might be able to help you.  I spent many years teaching combat techniques to the finest warriors in Grobb.  I came to New Tanaan to further develop my teaching skills; it seems we all have our own lessons to learn.  I can teach you a few things if you are looking to be taught.  You will need to prepare yourself with the necessary equipment before I can begin though.");
	elseif(e.message:findi("willing to learn") or e.message:findi("planar blood brew")) then	--Response when not having Planar Traveler's Manual
		e.self:Say("I am glad to see you are willing to learn, however I'm afraid you are not ready for my teachings.  Come back when you have acquired the proper tools of learning.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((e.other:GetLevel() >= 20) and item_lib.check_turn_in(e.self, e.trade, {item1 = 28787, item2 = 28745})) then --Planar Blood Brew, Planar Traveler's Manual
		e.self:Say("Wow, this is great! Wow! This is may be the best Planar Blood Brew I have ever tasted! You have passed the first test with flying colors. Here, you take this book and learn well from it. When you are ready for your next lesson, speak to Xasri Virek.");
		e.other:QuestReward(e.self,0,math.random(9),math.random(9),0,28788,10000); --Beginner Combat Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
