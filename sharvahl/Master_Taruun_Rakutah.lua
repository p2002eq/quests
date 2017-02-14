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
		e.self:Say("Well met, friend. May I be of assistance?");
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
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18554})) then -- Taruun Guild Summons
		e.self:Say("Good " .. e.other:GetName() .. ", I am pleased to see you. You have come of age and it is time for you to register for citzenship. Your invitation indicates that the Taruun, hunters and providers of Shar Vahl, have noticed you and consider your potential to be worthy of our training. First, take this application to the Registrar Bindarah and return to me with proof of citzenship.");
		e.self:Say("I know that you may be nervous right now... after all, this should be very exciting first step for you. If you happen to get lost while looking for the registrar, just ask one of the other citizens or guards for directions. They will most likely know where to find the place or person that you are looking for.");
		eq.set_global("Shar_Vahl_Cit","1",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2873,100); -- Application for Citizenship
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29828})) then -- Shadowscream Steel Boots
		e.self:Say("So you're Barkhem's newest student are you? I may not have taken your word for it, but craftsmanship this fine could only be from a student of our Master Smith. Take this and fill it with Shadowscream steel boots. I need 6 pairs to outfit some of my hunters. When you've finished, return the box to me.");
		e.other:QuestReward(e.self,0,0,0,0,17499); -- Boot Case
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29825})) then -- Shadowscream Boot Case
		e.self:Emote("inspects the boots for a moment and looks you square in the eyes. 'This is excellent work, " .. e.other:GetName() .. ", you do not disappoint! Wish that you could outfit all of my hunters with these boots, but I must not keep your talents all to myself. Take some change for your troubles and this seal back to Barkhem - let him know that I am very impressed with his new protege.'");
		e.other:Faction(132,10); -- Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,29826,500); --Rakutah's Seal
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2897})) then -- Notarized Application
		e.self:Say("Allow me to be the first to welcome you. Accept this cloak, young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Harbin Gernawl and he will give you instruction. May the spirits of the beasts guide you and keep you safe.'");
		eq.set_global("Shar_Vahl_Cit","7",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2878,100); -- Initiate's Cloak of Shar Vahl
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
