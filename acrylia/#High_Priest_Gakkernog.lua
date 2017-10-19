--#High Priest Gakkernog

local inCombat = false;
local triggered = false;

function event_spawn(e)
	e.self:Shout("Enough play! Now you die! You will regret disturbing my ritual!");
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
			eq.set_timer("depop",3*60*1000);  -- 3 min depop if not aggroed
        end
    elseif(e.timer == "depop") then	
		if (inCombat == false) and triggered then
			eq.stop_timer("combat_check");
			eq.get_entity_list():GetSpawnByID(324841):Repop(5);		--repop HP trigger if event fails
			eq.signal(154109,1) -- send signal to event trigger that event can be reset
			eq.depop();
		end
	end
end

function event_signal(e) --signal from event trigger to attack designated PC after summon
	if e.signal == 2 then
		e.self:Shout("The tresspassers have ruined our sacred ritual!  We must restart!");
		eq.depop();
	else		
		e.self:AddToHateList(eq.get_entity_list():GetClientByCharID(e.signal));
		triggered = true;
	end
end

function event_death_complete(e)
	eq.signal(154109,1) -- send signal to event trigger that event can be reset
end