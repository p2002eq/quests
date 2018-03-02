function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("holds a cracked monocle up to his squinty eye. 'I say!! A talking bear!! Squire Fuzzmin, come and take a gander at this rare find. The wonders never cease in the land of Kunark!!'");
		--eq.set_global("hobble",e.self:GetID(),3,"F");   -- Set global hobble with Sir_Hobble's NPC ID so Squire_Fuzzmin can follow
		eq.unique_spawn(84391,0.0,0,1985,-2243,-75,0);      -- Spawn Squire_Fuzzmin for Wurmslayer quest
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
