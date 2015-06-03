-- spawn 3 A Freed Soul on death
-- enchanter epic - Test of Charm

function event_death_complete(e)
	eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
	eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
