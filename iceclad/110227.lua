local encount1 = false;          -- have to keep track incase he hits same waypoint again
local encount2 = false;
local encount3 = false;
local encount4 = false;
local encount5 = false;


function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8897})) then
		e.self:Say("The final orders, follow me closely! I pray that the Kromrif have not learned of our plans to allign with the gnomes.");
        e.self:AssignWaypoints(67);
        e.self:SetRunning(true);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
    if (e.wp == 2 and encount1 == false) then     -- encounter1
        encount1 = true;
        eq.signal(110109, 1);   -- Commander Vjorik Shout
        eq.spawn2(110230, 0, 0, 7521, -3461, 163, 116); --Kromrif Tracking Wolves
        eq.spawn2(110230, 0, 0, 7515, -3462, 163, 116);
        eq.spawn2(110230, 0, 0, 7510, -3464, 163, 116);
        eq.spawn2(110230, 0, 0, 7504, -3466, 163, 116);
        eq.signal(110230, 1, 600);  -- send signal to attack
    elseif (e.wp == 3 and encount2 == false) then     -- encounter2
        encount2 = true;
        eq.spawn2(110225, 0, 0, 7244, -2235, 146, 119); --Frost Giant Skirmishers
        eq.spawn2(110225, 0, 0, 7318, -2165, 150, 119);
        eq.spawn2(110225, 0, 0, 7291, -2165, 154, 119);
        eq.spawn2(110225, 0, 0, 7246, -2165, 149, 119);
        eq.signal(110225, 1);  -- send signal to attack
    elseif (e.wp == 4 and encount3 == false) then     -- encounter3, spawn on top of general
        encount3 = true;
        eq.spawn2(110219, 0, 0, 5960, -1100, 161, 227); --Commander Kvarid
        eq.spawn2(110225, 0, 0, 5940, -1100, 161, 227); --Frost Giant Skirmishers
        eq.spawn2(110225, 0, 0, 5950, -1110, 161, 25);
        eq.spawn2(110225, 0, 0, 5950, -1090, 161, 109);
    elseif (e.wp == 5 and encount4 == false) then     -- encounter4
        encount4 = true;
        eq.spawn2(110230, 0, 0, 2193, 1614, 54, 112);   --Kromrif Tracking Wolves
        eq.spawn2(110230, 0, 0, 2189, 1612, 54, 112);
        eq.spawn2(110230, 0, 0, 2185, 1610, 54, 112);
        eq.spawn2(110230, 0, 0, 2197, 1616, 163, 112);
        eq.spawn2(110230, 0, 0, 2201, 1618, 163, 112);
        eq.signal(110230, 2, 600);  -- send signal to attack
    elseif (e.wp == 6 and encount5 == false) then     -- encounter5, spawn on top of general
        encount5 = true;
        eq.spawn2(110109, 0, 0, 2653, 3703, 244, 227);  --Commander Vjorik
        eq.signal(110109, 2, 600);  -- set visible.
        eq.spawn2(110225, 0, 0, 2660, 3700, 244, 25);   --Frost Giant Skirmishers
        eq.spawn2(110225, 0, 0, 2640, 3700, 244, 109);
        eq.spawn2(110225, 0, 0, 2650, 3710, 244, 163);
        eq.spawn2(110225, 0, 0, 2650, 3690, 244, 163);
        eq.spawn2(110225, 0, 0, 2647, 3697, 244, 163);
    end
end
        