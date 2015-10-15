function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I'm sure if you've listened to my fellow councilors babble on for awhile you must surely think our nation is in chaos. Thats far from the truth however as we do not make the decisions for our people. It is the Dain's will alone that decides what course our people take, we simply offer our advice and opinions. Dain Frostreaver IV is a good and wise man, trust in him will take our people far I promise you.");
	end
end

function event_signal(e)
	if(e.signal == 1) then --night
		eq.move_to(-103,703,39,132,1);
	elseif(e.signal == 2) then --day
		eq.move_to(0,535,68,0,1);
	end
end
