--Councilor_Icepike (129072)
--thurgadinb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("King Tormax must be stopped, no matter what the cost.");
	end
end

function event_signal(e)
	if (e.signal == 1) then --Night
		e.self:SetCurrentWP(0);
		eq.start(42);
		--eq.move_to(117,701,39,128,true);
	elseif (e.signal == 2) then --day
		e.self:SetCurrentWP(0);
		eq.start(41);
		--eq.move_to(30,533,68,0,true);
	end
end
