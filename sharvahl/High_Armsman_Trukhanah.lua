---- Changes by Kagehi.
---- Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
---- Since we don't want to hand people things that they can't normally get, or
---- stuff they haven't earned, we need to track which stage in the quest they
---- are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
---- 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
---- and 7 = Initiate's Cloak.

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("Hail")) then
		e.self:Say("Well met. friend.  May I be of assistance?");
	elseif(e.message:findi("application") and tonumber(qglobals.Shar_Vahl_Cit) == 1) then
		e.self:Say("Luckily for you someone found it.");
		e.other:SummonItem(2873); -- Application for Citizenship
	elseif(e.message:findi("cloak") and tonumber(qglobals.Shar_Vahl_Cit) == 7) then
		e.self:Say("Someone found this stuck in the top of a palm tree in the center of the plaza. I don't even want to know how it got there, just try not to lose it this time.");
		e.other:SummonItem(2878); -- Initiate's Cloak of Shar Vahl
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18553})) then -- Khala Dun Guild Summons
		e.self:Say("Good " .. e.other:GetName() .. ". I am pleased to see you. You have come of age and it is time for you to register as a citizen of Shar Vahl. Your invitation indicates that the Khala Dun. defenders of our society. have noticed you and consider your potential to be worthy of our training. First. take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		e.self:Say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
		eq.set_global("Shar_Vahl_Cit","1",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2873,100); -- Application for Citizenship
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2897})) then -- Notarized Application
		e.self:Say("Congratulations " .. e.other:GetName() .. "! Welcome to your new life as an official citizen of Shar Vahl. This cloak symbolizes your commitment to serving this people through continuous self-improvement. For now, you must strenghten yourself until you become worthy to train in the way of the Khala Dun. Show your acylia slate to Guard Hebijeb. He will direct you further. May the spirits of our ancestors be your guide.");
		eq.set_global("Shar_Vahl_Cit","7",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2878,100); -- Initiate's Cloak of Shar Vahl
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
