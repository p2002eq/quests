function event_combat(e)
	local random_result = math.random(100);
	if((e.joined) and(random_result < 21)) then
		e.self:Say("Your kind is not welcome here! Prepare to die!");
	end
	if((e.joined) and(random_result < 41)) then
		e.self:Say("Your dead corpse will soon line my pockets with gold!");
	end
	if((e.joined) and(random_result < 61)) then
		e.self:Say("How dare you enter our realm!");
	end
	if((e.joined) and(random_result < 81)) then
		e.self:Say("I shall bathe in the blood of you and your fellows!");
	end
	if(e.joined) then
		e.self:Say("Halt! who enters here?");
	end
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
