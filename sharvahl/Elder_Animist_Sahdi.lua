---- Changes by Kagehi.
---- Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
---- Since we don't want to hand people things that they can't normally get, or
---- stuff they haven't earned, we need to track which stage in the quest they
---- are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
---- 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
---- and 7 = Initiate's Cloak.

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". are you one of our new recruits?");
	elseif(e.message:findi("application") and tonumber(qglobals.Shar_Vahl_Cit) == 1) then
		e.self:Say("Luckily for you someone found it.");
		e.other:SummonItem(2873); -- Application for Citizenship
	elseif(e.message:findi("cloak") and tonumber(qglobals.Shar_Vahl_Cit) == 7) then
		e.self:Say("Someone found a rockhopper chewing on this in the pit. Try not to lose it this time.");
		e.other:SummonItem(2878); -- Initiate's Cloak of Shar Vahl
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18849})) then -- Khati Sha Guild Summons
		e.self:Say("" .. e.other:GetName() .. ". welcome to the Animist's guild. You have grown strong in the safety of our city and it is now time for you to register for official citizenship of Shar Vahl. The Khati Sha. explorers of this hostile land. have granted your request of inclusion and deem you to be worthy of our training. Take this application to Registrar Bindarah and return to me with proof of your citizenship.");
		e.self:Say("I know that you may be nervous right now... after all. this should be a very exciting first step for you.  If you happen to get lost while looking for the registrar. just ask one of the other citizens or guards for directions.  They will most likely know where to find the place or person that you are looking for.");
		eq.set_global("Shar_Vahl_Cit","1",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2873,100); -- Application for Citizenship
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2897})) then -- Notarized Application
		e.self:Say("Allow me to be the first to welcome you to the Khati Sha. lords of the beasts. Accept this cloak. young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Animist Poren and he will give you instruction. May the spirits of the beasts guide you and keep you safe.");
		eq.set_global("Shar_Vahl_Cit","7",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2878,100); -- Initiate's Cloak of Shar Vahl
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
