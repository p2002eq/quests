function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It's that bastard Tormax whats the cause of all our trouble. What we need to do is send some specially trained assasins to take him out. Sure it's not the most honorable thing to do, but without him the giants wouldn't know what to do.");
	end
end

function event_signal(e)
	if(e.signal == 1) then --night
		eq.move_to(-4,887,-1,40.5,1);
	elseif(e.signal == 2) then --Day
		eq.move_to(-5,543,66,0,1);
	end
end
