--Captain_Ryglot_Cupperhide
--ID:208021
--Zone:povalor 

--[[PoV Quest Access (Key to Aerin`Dar's Lair)
	qglobal name "pov_key_quest"
	qglobal value == 1  (Spoken to Sergeant_Johson_Popoah)
	qglobal value == 2	(Spoken wih Paralin_Notion (1st time)
	qglobal value == 3 	(Spoken with Master_Sergeant_Aaramis_Daryln 1st time)
	qglobal value == 4	(Handed-in Items to Paralin_Notion)
	qglobal value == 5 	(Spoken with Master_Sergeant_Aaramis_Daryln 2nd time)  
	qglobal value == 6	(Spoken with Captain Ryglot Cupperhide to collect final items)

]]

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if tonumber(qglobals.pov_key_quest) == 5 then
		if e.message:findi("hail") then
			e.self:Say("I am very [" .. eq.say_link("busy") .. "] at the moment. Perhaps you should come back at another time, " .. e.other:GetName() .. ".");
		elseif e.message:findi("busy") then
			e.self:Say("I can't go into any great detail, but the Crystalline Globe was taken from our command structure. It's believed to have been separated into three pieces. Unfortunately, we're having a lot of trouble relocating it. Perhaps you'd like to [" .. eq.say_link("help") .. "]?");
		elseif e.message:findi("help") then
			e.self:Say("That's good to hear, " .. e.other:GetName() .. ". I wish we had more soldiers like yourself willing to help. I'm going to need you to locate the missing pieces of the globe and bring them back to me. After you've acquired the pieces perhaps you'd be able to rally enough people to lend us a hand with another [" .. eq.say_link("mission") .. "] objective we've been unable to fulfill do to our diminished numbers.");
		elseif e.message:findi("mission") then
			e.self:Say("Well, I can't go into any details as to our main purpose is, but one of our missions was to exterminate the crystalline dragon. However, due to our company being split we are unable to go forward with this part of the operation. It has been placed on hold, pending the outcome of the [" .. eq.say_link("war") .. "].");
		elseif e.message:findi("war") then
			e.self:Say("Unfortunately, that is one of the things that I'm unable to speak of at this time. However, if you are [" .. eq.say_link("willing") .. "] to help rally some people together I may be able to release some more information to you.");
		elseif e.message:findi("willing") then
			e.self:Say("Please bring me three peices from the Crystaline Globe. You will find them in the nearby areas among various creatures. Once you have all three, let me have them.");
			eq.set_global("pov_key_quest", "6", 5, "F");	
		end
   elseif tonumber(qglobals.pov_key_quest) == 6 then
		if e.message:findi("hail") then
			e.self:Say("Have you found those crystalline globe pieces yet, soldier?");
		end
	elseif e.message:findi("hail") then 
		e.self:Say("Please leave. I am extremely busy at the moment.");
	end
end
   
function event_trade(e)
	local item_lib = require("items");	
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if tonumber(qglobals.pov_key_quest) == 6 and (item_lib.check_turn_in(e.self, e.trade, {item1 = 25796, item2 = 25797, item3 = 25798})) then 	--A piece of the crystalline globe
		e.self:Emote("looks up at you in surprise. 'I can't believe you brought the missing pieces back to me so quickly. I have a team of men who have been looking for these pieces for weeks now. That's quite a feat. Unfortunately, I will be unable to make use of the Crystalline Globe at this time. A message has been dispatched to my platoon asking us to return to the Halls of Honor. It looks as if we'll be joining up with the rest of our company fairly soon. Keep the globe. If you're able to rally enough people together to take on Aerin`Dar then perhaps you'll be able accomplish an objective that our platoon was unable to do. I must go now. Good luck to you, " .. e.other:GetName() .. ".'");
		e.other:QuestReward(e.other,0,0,0,0,25596,100000);	--summons Crystalline Globe
		eq.delete_global("pov_key_quest");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

