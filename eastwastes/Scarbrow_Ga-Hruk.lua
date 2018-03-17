-- Part of Coldain Ring 5 Quest

function event_spawn(e)
	eq.set_timer("depop", 600000);
	e.self:Shout("For the glory of the Ry`Gorr, charge!!");
	e.self:SetRunning(true);
	eq.move_to(-372, -2655, 178, 45, true);
end

function event_aggro(e)
	e.self:Say("Crush, maim, kill, and defy! For dinner tonight, your brains we shall fry!");
end


function event_timer(e)
	if e.timer == "depop" then
		eq.signal(116177, 99);
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(116177, 99);
end
