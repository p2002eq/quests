function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Salutations, " .. e.other:GetName() .. "! Your devotion to our Lord Innoruuk is evident in your actions and on your soul. As a member of the Spires of Innoruuk, you are required to obtain and wear the symbol of your station among the clergy. I can award you the [hematite symbol of Innoruuk] worn by the initiates of the Spires.");
	elseif(e.message:findi("hematite symbol of Innoruuk")) then
		e.self:Say("The forest beyond the gates of our grand city has been shaped by the magic of our Lord Innoruuk to be more hospitable to our kind. There are halfling druids in the service of Karana who have set up shrines there in hopes of restoring the forest to its former state. They could never succeed in their task with their feeble powers granted by their insignificant god, yet still, they are a nuisance. Bring me four of the holy symbols worn by the druids and I shall grant you the initiate symbol of Innoruuk.");
	end
	
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 14550, item2 = 14550, item3 = 14550, item4 = 14550})) then--Woven Grass Amulets
		e.self:Emote("laughs. 'Here, take this then!  You are now and initiate of Innoruuk.  Speak with Ithvol K`Jasn for further advancement.'");--text made up
		e.other:Faction(256,10);--Priests of Innoruuk
		e.other:Faction(177,1);--King Naythox Thex
		e.other:Faction(258,-3);--Priests of Marr
		e.other:Faction(43,-2);--Clerics of Tunare
		e.other:Faction(257,-1);--Priests of Life
		e.other:Faction(260, -40); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,1369,2000); --Initiate Symbol of Innoruuk
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18756})) then --Tattered Note
		e.self:Say("Welcome, child of Hate. I am Perrir Zexus, High Priest. We all draw power from the very source that created us, the will of Innoruuk. Here, put on this tunic. It is the tunic of our guild. Represent us well.");
		e.other:Faction(256, 100); --Priests of Innoruuk
		e.other:Faction(177, 15); --King Naythox Thex
		e.other:Faction(258, -35); --Priests of Marr
		e.other:Faction(43, -25); --Clerics of Tunare
		e.other:Faction(257, -15); --Priests of Life
		e.other:Faction(260, -400); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,13585,100); --Crimson Training Tunic*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42084 -- Perrir_Zexus
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
