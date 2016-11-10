function event_spawn(e)
	-- runs as soon as he spawns, in middle of combat
	e.self:SetRunning(true);
	eq.start(142);
end

function event_waypoint_arrive(e)
	-- if reached the end of his path, send signal to shardwurm to depop with timer and Relik to depop.
	if(e.wp == 2) then
		eq.signal(118091,2); -- Gralk_Dwarfkiller
		eq.signal(118040,2); -- shardwurm_broodmother
	end
end

function event_death_complete(e)
	-- upon death, send signal to shardwurm to depop with timer and Relik to depop.
	eq.signal(118065,2);
	eq.signal(118040,2);
end
