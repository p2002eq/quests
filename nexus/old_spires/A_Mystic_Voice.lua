function event_spawn(e)
	eq.set_timer("nexus2min",120000);
	e.self:Say("In approximately ten minutes the portals will become active and will transport you back to Odus, Antonica, Faydwer, and Kunark.  In five minutes the portal to Velious will become active.");
	eq.signal(152000,20,0);
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.timer == "nexus2min") then
		eq.stop_timer("nexus2min");
		e.self:Say("The portal to Velious will become active in three minutes.  Please begin gathering in the portal area.");
		eq.set_timer("velious2min",120000);
		eq.signal(152000,21,0);
	end
	if(e.timer == "velious2min") then
		eq.stop_timer("velious2min");
		e.self:Say("One minute till teleportation to Velious.  Please be prepared to step onto the teleport pad.");
		eq.set_timer("velious1min",60000);
		eq.signal(152000,22,0);
	end
	if(e.timer == "velious1min") then
		eq.stop_timer("velious1min");
		e.self:Say("The portal to Velious is now active.  Please stand on the pad and you will be teleported shortly.");
		e.self:Say("The portals to Odus, Antonica, Faydwer, and Kunark will become active in five minutes. Please begin gathering in the portal areas.");
		eq.set_global(velious_port,"1",5,"S60"); --when the portal is open, global is set true for 1 min.
		eq.set_timer("ports2min",120000);
		eq.signal(152000,23,0);
	end
	if(e.timer == "ports2min") then
		eq.stop_timer("ports2min");
		e.self:Say("As a reminder, the portals to Odus, Antonica, Faydwer, and Kunark will become active in three minutes.");
		eq.set_timer("nexustimer",120000);
		eq.signal(152000,24,0);
	end
	if(e.timer == "nexustimer") then
		eq.stop_timer("nexustimer");
		e.self:Say("One minute till teleportation to Odus, Antonica, Faydwer, and Kunark. Please be prepared to step onto the teleport pad.");
		eq.set_timer("ports1min",60000);
		eq.signal(152000,25,0);
	end
	if(e.timer == "ports1min") then
		eq.stop_timer("ports1min");
		e.self:Say("The portals to Odus, Antonica, Faydwer, and Kunark are now active. Please stand on the pad and you will be teleported shortly. Come back soon.");
		eq.set_global(odus_port,"1",5,"S60"); --when the portal is open, global is set true for 1 min.
		eq.set_global(kunark_port,"1",5,"S60"); --when the portal is open, global is set true for 1 min.
		eq.set_global(faydwer_port,"1",5,"S60"); --when the portal is open, global is set true for 1 min.
		eq.set_global(antonica_port,"1",5,"S60"); --when the portal is open, global is set true for 1 min.
		eq.set_timer("nexus2min",60000);
		e.self:Say("In approximately ten minutes the portals will become active and will transport you back to Odus, Antonica, Faydwer, and Kunark.  In five minutes the portal to Velious will become active.");
		eq.signal(152000,26,0);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
