local inCombat = false;

function event_spawn(e)
	inCombat = false;
	e.self:Shout("Bah!  Where be the Cazic Thule Puppet!  Ridiculously funny!");
	eq.set_timer("hourcheck",3*1000);  -- check every server tick for hour change
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

function event_signal(e)
	if (e.signal == 1) then
		eq.set_timer("depop",1);	--signal from Theatre_control to reset event
	end
end

function event_timer(e)
    if (e.timer == "combat_check") then
       if (inCombat == false) then
			eq.stop_timer("combat_check");
			eq.set_timer("depop",1*1000);
       end
    elseif(e.timer == "depop") then	
		if (inCombat == false) then
			eq.stop_timer("combat_check");
			eq.depop();
		end
	elseif (e.timer == "hourcheck") then
		local ztime = eq.get_zone_time();
		if (ztime.zone_hour == 10 and ztime.zone_minute == 58) then	
			if (inCombat == false) then
				e.self:Shout("Well, there is nothing to see here!  Go home everyone!");
				eq.set_timer("depop",3*1000);
			end
		end
	end
end