--Leramas_Feston (202049)
--Zone: Plane of Knowledge
--Intermediate Stealth Manual


function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:HasItem(28792)) then	--Beginner Stealth Manual
			e.self:Say("I hope your first teachings have taught you well, " .. e.other:GetName() .. ". It is time for your next lesson. The accumulation of knowledge requires exploration and study. If you explore the cave system in the Plane of Disease, you may eventually discover a foul being by the name of Rallius Rattican. You are to bring me his head, along with your Beginner Stealth Manual. Once done, we may proceed with your next lesson.");
		else
			e.self:Say("Hello and welcome to New Tanaan.  You are currently standing inside the Tanaan meeting hall. please feel free to relax and let your mind rest for a time here.  Surely the adventures of planar travel must have you weary by now.  The exploration of knowledge is a noble cause indeed. I have dedicated my life to helping others with their studies.  Perhaps once you have achieved a certain level of readiness you should seek me out again.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28792, item2 = 29133})) then--Beginner Stealth Manual, Rattican's Head
		e.self:Say("Good work, " .. e.other:GetName() .. ". I must say I am quite impressed with your recovery of this. Clearly you have shown you are ready to begin your next lesson. Take this new book and when you are ready, speak to Ethoach Trokith. And remember, difficult tasks are put in our way not to stop us, but to call out our strength and resolve.");
		e.other:QuestReward(e.self,0,math.random(9),math.random(9),math.random(9),28793,100000);--Intermediate Stealth Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
