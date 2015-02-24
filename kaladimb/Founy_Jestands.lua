-- Rogue Epic NPC/Guildmaster -- Founy_Jestands

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. I am the guildmaster.");
	elseif(e.message:findi("note")) then
		e.self:Emote("fingers his belt pouch.");
		e.self:Say("I don't know what you're talking about, if you know what I mean. You should leave now, if you know what's good for you. Don't make me sic the crew on you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end


--Quest by: Solid11
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
