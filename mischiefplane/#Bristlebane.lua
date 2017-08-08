local inCombat = false;

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
		e.self:Shout("Bah!  Where be the Cazic Thule Puppet!  Ridiculously funny!");
	elseif (e.signal == 2) then
		e.self:Shout("Well, there is nothing to see here!  Go home everyone!");
	elseif (e.signal == 3) then
		eq.set_timer("combat check",1);
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
	end
end