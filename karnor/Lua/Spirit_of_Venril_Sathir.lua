-- pulsing green stone - ranger/druid epic
local entid1;
local mob1;
local mob1attack;
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So mortals, you seek to end the tainting of Tunare's children? So be it, I have no cares. My death has been caused by this foolishness and I want no more to do with it. Bring me a scroll with the knowledge of resurrection so that I may once again live. I will hand you that which you seek.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 15392})) then
		e.self:Say("I am alive! My thanks to you, " .. e.other:GetName() .. ". And now I will aid you in your quest for preserving the forests of norrath. Your carcass will help nurture the soils of the wilderness.");
		h = e.self:GetHeading();
		entid1 = eq.spawn2(102126,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		mob1 = eq.get_entity_list():GetMobID(entid1);
		mob1attack = mob1:CastToNPC();
		mob1attack:AddToHateList(e.other, 1);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
