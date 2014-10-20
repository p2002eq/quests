-- Test of Charm - enchanter epic - Enchanted Diamond
local x;
local y;
local z;
local mob;
local mobid;
local mobattack;
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10631})) then
		e.self:Say("You have no idea what it is like to be trapped in this place. Take your precious little stone and leave this place.");
		e.other:SummonItem(10618);
		eq.depop_with_timer();
		mob = eq.spawn2(88087,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		mobid = eq.get_entity_list():GetMobID(mob);
		mobattack = mobid:CastToNPC();
		mobattack:AddToHateList(e.other, 1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
