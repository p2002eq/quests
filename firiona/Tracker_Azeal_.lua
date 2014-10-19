--Tracker Azeal is actually Hero Goxnok in disguise. This version of him has been triggered to spawn at 9 PM game time, and will then path out of the outpost.
--After a time, he will pause on his normal pathing and kneel and we can give him an item to spawn Hero Goxnok. All of this is for the fifth Greenmist quest.
function event_spawn(e)
	e.self:Say("I'm going to start my patrol. I'll report back by morning.");
	eq.set_timer("Patrol",10000);
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12691})) then --Test of Betrayal (Greenmist Quest 5/8)
		e.self:Emote("begins to pull his face off.. it is a disguise!! 'Aha!! You have made it!! I cannot see well in this disguise, but I thought I smelled you. I have [news of the Charasis tome].'");
		e.other:Ding();
		eq.spawn2(84319,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(84311,0,0,-1822,617,142.5,103);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "Patrol") then
		eq.start(11);
		eq.stop_timer("Patrol");
		eq.set_timer("ZoneTime",60000);
	end
	if((e.timer == "ZoneTime") and (zonehour == 6)) then
		eq.spawn2(84277,0,0,2268,-2828,-74.8,237.5);
		eq.stop_timer("ZoneTime");
		eq.depop();
	end
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
