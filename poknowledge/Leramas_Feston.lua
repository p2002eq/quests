--Intermediate Stealth Manual
function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:HasItem(28792)) then
			e.self:Say("I see by the beginner manual you carry that you are on the right track. Let us continue your lessons, shall we? Bring me the Head of Rattican, who resides in the Plane of Disease.  Return this along with your Beginner Stealth Manual.");--text made up/adapted from intermediate magic manual.
		else
			e.self:Say("Hello and welcome to New Tanaan.  You are currently standing inside the Tanaan meeting hall. please feel free to relax and let your mind rest for a time here.  Surely the adventures of planar travel must have you weary by now.  The exploration of knowledge is a noble cause indeed. I have dedicated my life to helping others with their studies.  Perhaps once you have achieved a certain level of readiness you should seek me out again.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28792, item2 = 29133})) then--Beginner Stealth Manual, Rattican's Head
		e.self:Say("Very impressive, " .. e.other:GetName() .. ". This proves you have clearly graduated to the next phase of training we have to offer. Keep this book by your side and speak to Ethoach Trokith when you are ready for your next lesson.");--Text borrowed from intermediate combat manual, instructor's name changed to match advanced magic manual.
		e.other:QuestReward(e.self,0,0,0,0,28793);--Intermediate Stealth Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
