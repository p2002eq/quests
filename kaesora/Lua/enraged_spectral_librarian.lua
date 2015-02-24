-- spawn 3 A Freed Soul on death
-- enchanter epic - Test of Charm
local mob1;
local mob2;
local mob3;
local mobid1;
local mobid2;
local mobid3;
local mobattack1;
local mobattack2;
local mobattack3;
function event_death_complete(e)
	mob1 = eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	mob2 = eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading());
	mob3 = eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading());
	mobid1 = eq.get_entity_list():GetMobID(mob1);
	mobid2 = eq.get_entity_list():GetMobID(mob2);
	mobid3 = eq.get_entity_list():GetMobID(mob3);
	mobattack1 = mobid1:CastToNPC();
	mobattack2 = mobid2:CastToNPC();
	mobattack3 = mobid3:CastToNPC();
	mobattack1:AddToHateList(e.self:GetHateTop(),1);
	mobattack2:AddToHateList(e.self:GetHateTop(),1);
	mobattack3:AddToHateList(e.self:GetHateTop(),1);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
