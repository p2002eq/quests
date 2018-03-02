--Seargent Cursah (NPCID 167515)
--part of Captain Necins raid of grimling war event

local captain = 167200;

function event_spawn(e)
	e.self:SetRunning(false);
end


function event_signal(e)
	if e.signal == 10  then --signal from Captain to move to grimling camp
		e.self:SetRunning(true);
		e.self:Say("For the honor of the Vah Shir, Attack!");
		eq.move_to(570, -658, -30, 107, true);
	elseif e.signal == 11 then	--signal from Captain to move to back to vah shir camp after successful raid
		--eq.move_to(-1226,-638,8,252, true);	--back to spawn
		eq.spawn2(167515, 0, 0, -1226,-638,8,252);	--repop sergeant
		eq.depop();
	elseif e.signal == 90 then
		e.self:Say("We have reports in of two camps nearby that have been overrun by the grimling menace.  The smaller camp resides to the southeast while the larger camp lies to the northwest.");
		eq.signal(captain, 90, 10 * 1000);	--signal
	end
end

function event_trade(e)
    local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end