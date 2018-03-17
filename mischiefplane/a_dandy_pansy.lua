--despawn script for forest pansies
--zone: mischiefplane

local inCombat = false;

function event_spawn(e)
	inCombat = false;
	eq.set_timer("combat_check",1*1000);   -- 1 second
end

function event_combat(e)
    if (e.joined == false) then
        inCombat = false;
    else
        inCombat = true;
		eq.stop_timer("depop");
		eq.set_timer("combat_check",1*1000);
    end
end

function event_timer(e)
    if (e.timer == "combat_check") then
       if (inCombat == false) then
			eq.stop_timer("combat_check");
			eq.set_timer("depop",10*1000);
        end
    elseif(e.timer == "depop") then	
		if (inCombat == false) then
			eq.stop_timer("combat_check");
			eq.depop();
		end
	end
end