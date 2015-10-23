function event_spawn(e)
	eq.set_timer("onset",60000); --
	eq.set_timer("readygo",150000); --
end

function event_timer(e)
	if(e.timer == "onset") then --vs died
        e.self:MoveTo(--4341,-748,-183,-1,1);
        eq.stop_timer("onset");
    end
    if(e.timer == "readygo") then --vs died
        eq.stop_timer("readygo");
        e.self:Say("Onward men, the eyes of Zek are upon us.");
        eq.signal(119167,1,300);
        eq.signal(119166,1,300);
        eq.signal(119169,1,300);
    end
    
end

function event_waypoint_arrive(e)
	if(e.wp == 5) then
		e.self:Say("Destroy them!!");
		eq.signal(119050,300);
	end
end

function event_signal(e)
    if(e.signal == 1) then --vs died
        -- quest::start(23);
    end
    if(e.signal == 2) then --vs died
        e.self:Say("Grraaaggh! AMBUSH!! Die well!");
        eq.spawn2(119174,0,0,-146,1703,-192,187);  --# a_sifaye_defender
        eq.spawn2(119174,0,0,-149,1731,-192,187);  --# a_sifaye_defender
        eq.spawn2(119174,0,0,-162,1738,-192,187);  --# a_sifaye_defender
        eq.spawn2(119174,0,0,-172,1758,-192,182);  --# a_sifaye_defender
    end
end