--Councilor_Darkfrost (129078)
--thurgadinb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It's that bastard Tormax whats the cause of all our trouble. What we need to do is send some specially trained assasins to take him out. Sure it's not the most honorable thing to do, but without him the giants wouldn't know what to do.");
	end
end

function event_signal(e)
	if(e.signal == 1) then --night
		e.self:SetCurrentWP(0);
		eq.start(30);
	elseif(e.signal == 2) then --Day
		e.self:SetCurrentWP(0);
		eq.start(29);
	end
end
