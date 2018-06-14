--#Eino_trigger (204457)
--trigger for Aid Eino escort quests (only spawnable between 10pm and 6am game time)
--ponightmare

function event_signal(e)	--signal from player.lua
	local GetTime = eq.get_zone_time();
	if (GetTime.zone_hour > 22 or GetTime.zone_hour < 6) then
		eq.unique_spawn(204075,0,0,1685,-515,215,310);
		eq.depop_with_timer();
	end
end
