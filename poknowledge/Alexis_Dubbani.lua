--------------------------
--Quest Name: Alexis' Book Collection
--Author: CrabClaw
--NPCs Involved: Alexis_Dubbani
--Items Involved: All from Angelox's Database
--zone: poknowledge
--Revised CrabClaw v1.0 WIP

------RELATED QUESTS------
--	Curator_Merri: The Collector's Box
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Why hello there. " .. e.other:GetName() .. ".  I'm so glad you could take the time to see my exhibit.  I am a collector of [books]. and I seek many more volumes of strange and wonderful texts.  Perhaps I could hire your services to help me find some more?");
	elseif(e.message:findi("books")) then
		e.self:Say("I am still looking for the following. Please locate a Black Tome with Silver Runes, Tome of the Eternal, Codex of the Warrior, and a Book of Inspiration. Please store them inside a Collector's Box you can get from [Merri] for safekeeping. After you find all the books, be sure to close the box and return it to me. I appreciate your help.");
	elseif(e.message:findi("merri")) then
		e.self:Say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28078})) then
		e.self:Say("These will do. Please accept this as a show of my appreciation. Now if you'll excuse me I have much work left to do.");
		e.other:QuestReward(e.self,0,0,0,0,28240);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
