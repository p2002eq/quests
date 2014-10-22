-- forager/hunter named cycle random spawner
function event_spawn(e)
	local getnewloc = eq.ChooseRandom(1,2,3,4,5,6);
	if(getnewloc == 1) then
		newx = 1271.88;
		newy = -1461.88;
		newz = -284.75;
	elseif(getnewloc == 2) then
		newx = 4264.87;
		newy = 2517;
		newz = -334.4;
	elseif(getnewloc == 3) then
		newx = 1402;
		newy = 2378;
		newz = -235.4;
	elseif(getnewloc == 4) then
		newx = 3341;
		newy = 2364;
		newz = -331.63;
	elseif(getnewloc == 5) then
		newx = 1198;
		newy = -1997;
		newz = -311.5;
	elseif(getnewloc == 6) then
		newx = 1543;
		newy = -2037;
		newz = -319.5;
	end
end

function event_death_complete(e)
	local getnewmobid = eq.ChooseRandom(95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95004,95129,95130,95149,95151,95153,95154,95157,95159,95160,95161,95162,95167,95169,95171,95172,95176);
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
