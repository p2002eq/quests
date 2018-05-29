--Councilor_Wintershade (129079)
--thurgadinb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Councilor Darakor here would have you believe we should march every man, woman, and child in the city to Kael tommorow. He is a fool and so are those who support him. I for one would like to see greater steps in ending this senseless conflict. Oh sure the giants are unreasonable right now, but reason can be bought in time.");
	end
end

function event_signal(e)
	if(e.signal == 1) then --Night
		e.self:SetCurrentWP(0);
		eq.start(32);
		--eq.move_to(6,895,-2,128,true);
	elseif(e.signal == 2) then --Day
		e.self:SetCurrentWP(0);
		eq.start(31);
		--eq.move_to(-10,534,67,0,true);
	end
end
