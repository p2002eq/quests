--Councilor_Thubins (129080)
--thurgadinb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Come to see the excitement of the court have you friend? I'm just now working on my latest draft for a new waste disposal ordinance to present to the Dain, it's absolutely fascinating!");
	end
end

function event_signal(e)
	if(e.signal == 1) then --Night
		e.self:SetCurrentWP(0);
		eq.start(38);
		--eq.move_to(-53,703,39,129,true);
	elseif(e.signal == 2) then --Day
		e.self:SetCurrentWP(0);
		eq.start(37);
		--eq.move_to(-20,535,68,0,true);
	end
end
