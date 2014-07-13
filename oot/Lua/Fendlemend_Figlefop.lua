function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sighs and looks up at you.");
		e.self:Say("What a horrible expedition!");
		e.self:Say("No goblin relics, not even some goblin dishes! My rebreather is broken and the only thing we [found] was not even from the goblinempires!");
	end
	if(e.message:findi("found")) then
		e.self:Emote("huffs for a moment, looking quite upset.");
		e.self:Say("I found a [silly sword blade]. It is useless to me. The only thing I study is goblins, and this thing is definitely not goblin insign.");
	end
	
	if(e.message:findi("silly sword blade")) then
		e.self:Say("You will have to ask Denken about the blade. I gave it to him to get it out of my way.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

--End of File, Zone:oot  NPC:69062 -- Fendlemend_Figlefop

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
