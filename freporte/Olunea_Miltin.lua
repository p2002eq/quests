function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. It is good to meet you. Try not to scare the fish away. This is A good spot I supply fish to the Grub N' Grog. The patrons there love me!");
	elseif (e.message:findi("boat")) then
		e.self:Say("Your boat id is: " .. e.other:GetBoatID() .. "");
	elseif (e.message:findi("disable")) then
		eq.spawn_condition("freporte",0,3,0);
		eq.spawn_condition("freporte",0,4,0);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13922})) then -- Snapped Pole
		e.self:Say("Great! Thank you stranger. The rogues must have broken it. At least I could repair it. It would be seasons before I could afford another pole.");
		e.other:Ding();
		e.other:Faction(105,1,0); -- Freeport Militia
		e.other:Faction(48,1,0); -- Coalition of Tradefolk Underground
		e.other:Faction(184,-1,0); -- Knights of Truth
		e.other:Faction(258,-1,0); -- Priests of Marr
		e.other:AddEXP(100);
		e.other:GiveCash(50,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_spawn(e)
	eq.spawn_condition("freporte",0,3,0);
	eq.spawn_condition("freporte",0,4,0);
end

function event_signal(e)
	-- Player is zoning and on a boat. Make sure we have one waiting.
	local count = eq.get_entity_list():CountClient();
	if(count == 1) then
		if(e.signal == 1) then
			local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
			local hour = zone_time["zone_hour"] + 1;
			if(hour ~= 6 and hour ~= 18 and hour ~= 12 and hour ~= 24) then
				eq.spawn_condition("freporte",0,3,0);
				eq.spawn_condition("freporte",0,4,0);
			end
		else
			eq.spawn_condition("freporte",0,3,0);
			eq.spawn_condition("freporte",0,4,0);
		end
	end
end

-- END of FILE Zone:freporte -- Olunea_Miltin



