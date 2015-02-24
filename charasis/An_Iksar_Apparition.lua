--Shaman Skull Quest 8
function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(tonumber(qglobals.shmskullquest) > 12 and item_lib.check_turn_in(e.trade, {item1 = 30994})) then --Iksar Relics
		eq.unique_spawn(105182,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ()); --Venril Sathir
		eq.unique_spawn(105186,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ()); --an Arisen Disciple
		eq.unique_spawn(105183,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ()); --an Arisen Priest
		eq.unique_spawn(105184,0,0,e.self:GetX()-5,e.self:GetY()+5,e.self:GetZ()); --an Arisen Necromancer
		eq.unique_spawn(105185,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ()); --an Arisen Acolyte
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
