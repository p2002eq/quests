---- Changes by Kagehi.
---- Shar_Vahl_Cit tracks the steps you take to gain your initiate cloak.
---- Since we don't want to hand people things that they can't normally get, or
---- stuff they haven't earned, we need to track which stage in the quest they
---- are at. 1 = Citizen Application. 2 = Cert. of Taxability, 3 = Stamped Cert.,
---- 4 = Note to King Raja, 5 Note 'from' the king, 6 = Notarized Application
---- and 7 = Initiate's Cloak.

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("Hail")) then
		e.self:Say("Well met. Friend.  May I be of assistance?");
	----Non-canon, for fixmes if you lose certain items (which are needed for this quest line and others).
	----No idea if Live does this now or not. If these do exist there, feel free to adjust it.
	elseif(e.message:findi("application") and tonumber(qglobals.Shar_Vahl_Cit) == 1) then
		e.self:Say("Luckily for you someone found it.");
		e.other:SummonItem(2873);
	elseif(e.message:findi("cloak") and tonumber(qglobals.Shar_Vahl_Cit) == 7) then
		e.self:Say("Someone found this in a scorpian nest down in the pit. Try not to lose it this time.");
		e.other:SummonItem(2878);
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- A Taruun Guild Summons
	if(item_lib.check_turn_in(e.trade, {item1 = 18554})) then
		---- We don't care at this point who gives you the application, cloak, etc.
		---- Only later, when we get into class specific quests will the person you
		---- come to, in order to recover lost items, matter.
		---- Using "all npc, this player, and all zones", since some later stuff in
		---- the class quest lines, linked to the cloak, are in other zones, should we
		---- use this to track cloak progress as well.
		eq.set_global("Shar_Vahl_Cit","1",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2873); -- Application for Citizenship
	end
	-- Notorized Application
	if(item_lib.check_turn_in(e.trade, {item1 = 2897})) then
		e.self:Say("Allow me to be the first to welcome you. Accept this cloak, young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Harbin Gernawl and he will give you instruction. May the spirits of the beasts guide you and keep you safe.'");
		eq.set_global("Shar_Vahl_Cit","7",5,"F");
		e.other:QuestReward(e.self,0,0,0,0,2878);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
