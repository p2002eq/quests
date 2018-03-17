function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Come to see the excitement of the court have you friend? I'm just now working on my latest draft for a new waste disposal ordinance to present to the Dain, it's absolutely fascinating!");
	end
end

function event_signal(e)
	if(e.signal == 1) then --Night
		eq.move_to(-53,703,39,129,1);
	elseif(e.signal == 2) then --Day
		eq.move_to(-20,535,68,0,1);
	end
end
