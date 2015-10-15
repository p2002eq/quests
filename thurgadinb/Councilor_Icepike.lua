function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("King Tormax must be stopped, no matter what the cost.");
	end
end

function event_signal(e)
	if (e.signal == 1) then --Night
		eq.move_to(117,701,39,128,1);
	elseif (e.signal == 2) then --day
		eq.move_to(30,533,68,0,1);
	end
end
