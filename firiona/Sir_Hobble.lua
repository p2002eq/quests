function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("holds a cracked monocle up to his squinty eye. 'I say!! A talking bear!! Squire Fuzzmin, come and take a gander at this rare find. The wonders never cease in the land of Kunark!!'");
		eq.set_global("hobble",e.self:GetID(),3,"F");   -- Set global hobble with Sir_Hobble's NPC ID so Squire_Fuzzmin can follow
		eq.unique_spawn(84312,0,0,1985,-2243,-75);      -- Spawn Squire_Fuzzmin for Wurmslayer quest
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- For Wurmslayer quest
-- Quest depends on Squire_Fuzzmin in Firiona for complete functionality
-- Qadar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
