function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("Hail")) then
		e.self:Say("Well met. friend.  May I be of assistance?");
	elseif(e.message:findi("application") and tonumber(qglobals.Shar_Vahl_Cit) == 1) then
		e.self:Say("Luckily for you someone found it.");
		e.other:SummonItem(2873);
	elseif(e.message:findi("cloak") and tonumber(qglobals.Shar_Vahl_Cit) == 7) then
		e.self:Say("Someone found this stuck in the top of a palm tree in the center of the plaza. I don't even want to know how it got there, just try not to lose it this time.");
		e.other:SummonItem(2878);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18553})) then -- Khala Dun Guild Summons
		e.self:Say("Good " .. e.other:GetName() .. ". I am pleased to see you. You have come of age and it is time for you to register as a citizen of Shar Vahl. Your invitation indicates that the Khala Dun. defenders of our society. have noticed you and consider your potential to be worthy of our training. First. take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		e.self:Say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
		eq.set_global("Shar_Vahl_Cit","1",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2873,100); -- Application for Citizenship
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 2897})) then
		e.self:Say("Congratulations " .. e.other:GetName() .. "! Welcome to your new life as an official citizen of Shar Vahl. This cloak symbolizes your commitment to serving this people through continuous self-improvement. For now, you must strenghten yourself until you become worthy to train in the way of the Khala Dun. Show your acylia slate to Guard Hebijeb. He will direct you further. May the spirits of our ancestors be your guide.");
		eq.set_global("Shar_Vahl_Cit","7",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2878,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
