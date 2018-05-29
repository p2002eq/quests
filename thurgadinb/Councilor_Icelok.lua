--Councilor_Icelok (129038)
--thurgadinb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Isn't Icewell the most beautiful Keep ye have ever seen stranger? I do hope you've taken the time to visit some of our other attractions in Thurgadin. I often go to remembrance park just to stare at the sculptures. Our people may be cold and simple, but keep in mind there is an artistic side to us as well.");
	end
end

function event_signal(e)
	if (e.signal == 1) then --Night
		e.self:SetCurrentWP(0);
		eq.start(46);
		--eq.move_to(67,703,39,135,true);
	elseif (e.signal == 2) then --Day
		e.self:SetCurrentWP(0);
		eq.start(45);
		--eq.move_to(10,535,68,0,true);
	end
end
