-- Sergeant_Johson_Popoah
--ID:208015
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
	
	if e.message:findi("hail") and qglobals.pov_key_quest == nil then
		e.self:Say("State your business or leave our {" .. eq.say_link("compound") .. "].");
   	elseif e.message:findi("compound") and qglobals.pov_key_quest == nil then
		e.self:Say("This is the primary command center for Che Virtuson. We fall under the leadership and guidance of Captain Ryglot. I must now ask you to leave.");
		eq.set_global("pov_key_quest", "1", 5, "F");
	elseif e.message:findi("hail") and qglobals.pov_key_quest ~= nil then
		e.self:Say("Leave now before there is bloodshed.");
	end
end 

function event_trade(e)
	local item_lib = require("items");	
	item_lib.return_items(e.self, e.other, e.trade)
end