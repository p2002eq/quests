--Councilor_Amberfeld (129073)
--thurgadinb

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail there, "..e.other:GetName()..". Amberfeld's the name and minin' is my trade. As the council representative of the Snowchippers, it be my duty ta make sure all these politicians and warmongers don't forget one thing. And that's that it's us miners that bring in the ore for weapons and the stones for their fancy houses.");
	end
end

function event_signal(e)
	if(e.signal == 1) then --Night
		e.self:SetCurrentWP(0);
		eq.start(52);
		--eq.move_to(108,665,38,63,true);
	elseif(e.signal == 2) then --Day
		e.self:SetCurrentWP(0);
		eq.start(51);
		--eq.move_to(25,542,65,0,true);
	end
end
