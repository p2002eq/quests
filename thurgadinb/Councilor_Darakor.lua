function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmmph, if you've come here to actually get something accomplished yer wastin yer time. This lot'll babble on endlessly about politics and luxuries. Only the Dain and a few others like myself want to deal with the actual problems of the Coldain, that being the bloody Kromrif of course.");
	end
end

function event_signal(e)
	if(e.signal == 1) then --Night
		eq.move_to(-79,656,39,0,1);
	elseif(e.signal == 2) then --Day
		eq.move_to(-15,544,66,0,1);
	end
end
