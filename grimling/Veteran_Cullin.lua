--Veteran Cullin (167196)
--part of Veteran Vadrel's raid 

local veteran = 167194;	--Veteran Vadrel

function event_spawn(e)
	e.self:SetRunning(false);
end


function event_signal(e)
	if e.signal == 10  then --signal from Veteran to move to grimling camp
		e.self:SetRunning(true);
		e.self:Say("For the honor of the Vah Shir, Attack!");
		eq.move_to(-720, 356, -11, 30, true);
	elseif e.signal == 11 then	--signal from Captain to move to back to vah shir camp after successful raid
		--eq.move_to(-1226,-638,8,252, true);	--back to spawn
		eq.get_entity_list():GetSpawnByID(334767):Repop(5);	--repop Veteran Cullin
		eq.depop();
	end
end

function event_trade(e)
    local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end