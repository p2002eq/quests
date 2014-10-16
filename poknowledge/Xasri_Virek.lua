--Xasri_Virek.pl
--Intermediate Combat Manual

function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:HasItem(28788)) then
			e.self:Say("I see by the beginner manual you carry that you are on the right track. Let us continue your lessons, shall we? Bring me the power source of the junk beast.  It resides in the Plane of Innovation.  Return this along with your Beginner Combat Manual.");--text made up/adapted from intermediate magic manual.
		else
			e.self:Say("Hail. and welcome to the Kartis meeting hall.  I trust you are keeping busy here in New Tanaan?  It is truly a wonderful city. there are many interesting new things to discover here.  I came here from my home of Cabilis long ago. but I could not dream of returning now.  My life is here. wading in the font of knowledge that this place has to offer.  Hopefully I will be able to help you discover your own knowledge one day.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28788, item2 = 29145})) then--Beginner Combat Manual, Junk Beast Power Source
		e.self:Say("Very impressive, " .. e.other:GetName() .. ". This proves you have clearly graduated to the next phase of training we have to offer. Keep this book by your side and speak to Gwiraba Gelrid when you are ready for your next lesson.");
		e.other:QuestReward(e.self,0,0,0,0,28790);--Intermediate Combat Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
