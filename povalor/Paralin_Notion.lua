--Paralin_Notion
--ID:208066
--Zone:povalor 

--[[PoV Quest Access (Key to Aerin`Dar's Lair)
	qglobal name "pov_key_quest"
	qglobal value == 1  (Spoken to Sergeant_Johson_Popoah)
	qglobal value == 2	(Spoken wih Paralin_Notion (1st time)
	qglobal value == 3 	(Spoken with Master_Sergeant_Aaramis_Daryln 1st time)
	qglobal value == 4	(Handed-in Items to Paralin_Notion)
	qglobal value == 5 	(Spoken with Master_Sergeant_Aaramis_Daryln 2nd time -- final flag before speaking with Captain Ryglot Cupperhide)  
	qglobal value == 6	(Spoken with Captain Ryglot Cupperhide to collect final items)
	
]]

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if tonumber(qglobals.pov_key_quest) == 1 then
		if e.message:findi("hail") then
			e.self:Say("You're either [" .. eq.say_link("brave") .. "], or you're stupid");		 
		elseif e.message:findi("brave") then
			e.self:Say("That you are. Perhaps you'd be interested in helping our [" .. eq.say_link("company") .. "]?");		 
		elseif e.message:findi("company") then
			e.self:Say("We're a part of the Battalion of Marr. We're soldiers from Che Virtuson. We were dispatched to this part of the Plane of Valor to eliminate an age old target. Unfortunately, due to some recent events our mission has been placed on hold and our [" .. eq.say_link("squad") .. "] has been asked to remain behind."); 
		elseif e.message:findi("squad") then
			e.self:Say("We are a part of Ducee Tapferson. Our squad is known for our bravery. We were successful in capturing this [" .. eq.say_link("razorfiend") .. "] earlier today. You've shown some bravery as well my friend and that is the reason I request your [" .. eq.say_link("assistance") .. "]."); 
		elseif e.message:findi("razorfiend") then
			e.self:Say("These vile beasts live in the caves west of here."); 
		elseif e.message:findi("assistance") then
			e.self:Say("Many of us here are anxious to leave. Many wish to regroup with the rest of our company. Others wish to go back to the Halls to complete the [" .. eq.say_link("Trials") .. "].");
		elseif e.message:findi("trials") then
			e.self:Say("The Trials are overseen by the Heroes of Marr. It's these Trials that allow us to rise in rank. Only those who have passed the trials are able to enter the Temple of Marr. Now if you wish to aid us I must ask you to do a few [" .. eq.say_link("things") .. "].");
		elseif e.message:findi("things") then
			e.self:Say("You must find the Master Sergeant and tell him that you are here to [" .. eq.say_link("aid the cause") .. "].");
			eq.set_global("pov_key_quest", "2", 5, "F");
		end
	elseif tonumber(qglobals.pov_key_quest) == 3 then
		if e.message:findi("hail") then
			e.self:Say("I'm sorry the Master Sergeant was unable to help you. Perhaps you should [" .. eq.say_link("prove") .. "] yourself before you attempt to jump 'into the fire' so to speak.");
		elseif e.message:findi("prove") then
			e.self:Say("We've been running into a lot of problems lately with the razorfiends and the planarian larvae. Many soldiers have been getting sick because of the infestations that they cause. Capture the hearts of a razorfiend, a crystalline spider and a planarian larvae and bring them back to me. Our squad had enough problems capturing this small razorfiend here. This will become your first so called 'Trial' " .. e.other:GetName() .. ". It should be enough to prove your worth.");
		end
	elseif qglobals.pov_key_quest ~= nil and tonumber(qglobals.pov_key_quest) >= 4 then
		if e.message:findi("hail") then
			e.self:Say("Good luck!");
		end
	elseif e.message:findi("hail") then
		e.self:Say("Not now soldier!");
	end
end
   
function event_trade(e)
	local item_lib = require("items");	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25598, item2 = 25597, item3 = 25599})) then 	--Razorfiend's Heart, A Planarian Larvae's Heart, A Crystalline Spider's Heart
		e.self:Emote("looks at you with surprise. 'Very good my friend. You've definitely proven yourself. Find the Master Sergeant. He should be able to help you this time.'");
		eq.set_global("pov_key_quest", "4", 5, "F");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


 