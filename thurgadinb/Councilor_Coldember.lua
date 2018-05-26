--Councilor_Coldember (129075)
--thurgadinb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Watch yer step around the Icewell there, "..e.other:GetName()..". I've heard that a giant beast lives down in the pit waiting to devour those who earn the punishment of being dropped down there. Might be just I rumor but I swear I've heard some sounds comin up from the well that don't resemble any of the creatures we put in there.");
	end
end

function event_signal(e)
	if(e.signal == 1) then --Night
		e.self:SetCurrentWP(0);
		eq.start(50);
		--eq.move_to(93,655,39,244,true);
	elseif(e.signal == 2) then --Day
		e.self:SetCurrentWP(0);
		eq.start(49);
		--eq.move_to(15,543,66,0,true);
	end
end
