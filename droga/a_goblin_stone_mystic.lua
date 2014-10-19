function event_combat(e)
	local random_result = math.random(100);
	if((e.joined) and(random_result < 21)) then
		e.self:Say("The time has come for you to taste the might of my magic");
	end
	if((e.joined) and(random_result < 41)) then
		e.self:Say("The spirits are on my side! It is unwise of you to be here!");
	end
	if((e.joined) and(random_result < 61)) then
		e.self:Say("How dare you enter our realm!");
	end
	if((e.joined) and(random_result < 81)) then
		e.self:Say("The spirits are on my side! It is unwise of you to be here!");
	end
	if(e.joined) then
		e.self:Say("I shall bathe in the blood of you and your fellows!");
	end
end

function event_death_complete(e)
	e.self:Emote("'s corpse tries to mumble one last spell before falling over dead.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Angelox
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
