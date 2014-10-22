-- forager/hunter named cycle random spawner
function event_spawn(e)
	local getnewloc = eq.ChooseRandom(1,2,3,4);
	if(getnewloc == 1) then
		newx = 2559;
		newy = 3459;
		newz = -242.5;
	elseif(getnewloc == 2) then
		newx = 3361;
		newy = 576;
		newz = -339;
	elseif(getnewloc == 3) then
		newx = 2378;
		newy = 2728;
		newz = -349;
	elseif(getnewloc == 4) then
		newx = -143.8;
		newy = -2026.8;
		newz = -324;
	end
end

function event_death_complete(e)
	local getnewmobid = eq.ChooseRandom(95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95000,95107,95150,95155,95156,95158,95164,95165,95166,95170,95175,95177,95178,95179,95182);
	eq.spawn2(getnewmobid,0,0,newx,newy,newz,0);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
