function event_spawn(e)
	eq.set_timer("despawn", 45*60*1000); --45 min to kill him
	eq.set_timer(1,1);
end

function event_death_complete(e)
	eq.stop_timer("despawn");
	eq.stop_timer(1);
	eq.signal(214123, 214108); --Tell trigger that Tallon is dead
end


function event_signal(e)
	eq.stop_timer("despawn");
	eq.stop_timer(1);
	eq.depop();
end

function event_timer(e)
	if e.timer == "despawn" then
		eq.stop_timer(e.timer);
		eq.stop_timer(1);
		eq.depop();
	elseif (e.timer == 1 and e.self:GetX() < 340 and e.self:GetY() > -68) then
		eq.pause(2700);
	end
end

--End of File  Zone: PoTactics  ID: 214108 -- #Tallon_Zek
--Used in Rallos Zek Event