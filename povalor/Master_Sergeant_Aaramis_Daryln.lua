--Master_Sergeant_Aaramis_Daryln
--ID:208049
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
	
	if tonumber(qglobals.pov_key_quest) == 2 then
		if e.message:findi("aid the cause") then
			e.self:Say("What could you possibly do to aid our cause. Perhaps you think you can slay [" .. eq.say_link("Aerin`Dar") .. "] himself?' The Master Sergeant begins to laugh uncontrollably. 'I suggest you go back to whoever filled your head with this nonsense and stop wasting my time.");
		elseif e.message:findi("aerin`dar") then
			e.self:Say("I don't have time to explain the glass dragon to you. Leave before I get angry.");
			eq.set_global("pov_key_quest", "3", 5, "F");		 
		end
	elseif tonumber(qglobals.pov_key_quest) == 4 then
		if e.message:findi("hail") then
			e.self:Say("I heard what you did for Paralin Notion. That's quite a noble feat indeed. Perhaps we can use your help. However, you'll need to talk to the Captain first. After all, I can't have you walking in the [" .. eq.say_link("glass lair") .. "] without permission.");
		elseif e.message:findi("glass lair") then
			e.self:Say("It's the prison that [" .. eq.say_link("Aerin`Dar") .. "] has been encased in for many generations.");
		elseif e.message:findi("aerin`dar") then
			e.self:Say("Aerin`Dar is the crystalline dragon who once roamed the Plane of Valor. During a severe rainstorm it was struck down to the very core of its being. The mighty Aerin`Dar fell from the sky and landed in what is now known as the Glassy Wasteland. Planarian larvae began to infest its body eventually turning its pure heart to evil. Our [" .. eq.say_link("company") .. "] was dispatched to this region of Valor to eliminate the threat.");
		elseif e.message:findi("company") then
			e.self:Say("My squad of men are a part of Che Virtuson. However, we specifically are a part of Ducee Buled. We fall under the command of Captain Ryglot. Our [" .. eq.say_link("mission") .. "], for the time being, is simple. But we've run into some problems lately.");
		elseif e.message:findi("mission") then
			e.self:Say("Not too fast, " .. e.other:GetName() .. ". You'll have to speak to the Captain about that. I'm not at liberty to divulge that information at this time. That information is classified. I can tell you, but then I'd have to kill you.' Aaramis laughs. 'Go to Captain Ryglot and he'll be able to fill you in with all the details.");
			eq.set_global("pov_key_quest", "5", 5, "F");
		end
	elseif tonumber(qglobals.pov_key_quest) == 5 then
		if e.message:findi("hail") then
			e.self:Say("Good luck!");
		end   
	elseif e.message:findi("hail") then
		e.self:Say("Not now soldier!");
	end
end

function event_trade(e)
	local item_lib = require("items");	
	item_lib.return_items(e.self, e.other, e.trade)
end
   
 