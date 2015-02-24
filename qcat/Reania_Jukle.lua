function event_say(e)
	if(e.message:findi("what is the ink of the dark")) then
		e.self:Say("Ink of the Dark, you say? That isn't an everyday item, you know. In fact, I can't remember the last time someone requested it. I have given up keeping any here with me. You are going to need to find your own supply now. Sorry.");
	elseif(e.message:findi("where can i find the ink of the dark")) then
		e.self:Say("The ink is the blood of a dark scribe. Tempt him and give him this vial. He should cooperate.");
		e.other:SummonItem(10626);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 18851})) then --Blood Stained Note
		e.other:Faction(21,100); --Bloodsabers
		e.other:Faction(135,-15); --Guards of Qeynos
		e.other:Faction(235,10); --Opal Dark Briar
		e.other:Faction(257,-25); --Priest of Life
		e.other:Faction(53,5); --Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,13596,100); --Dirty Purple Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF Zone: qcat ID: 45082 NPC: Reania_Jukle
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------