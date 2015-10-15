function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail there, "..e.other:GetName()..". Amberfeld's the name and minin' is my trade. As the council representative of the Snowchippers, it be my duty ta make sure all these politicians and warmongers don't forget one thing. And that's that it's us miners that bring in the ore for weapons and the stones for their fancy houses.");
	end
end

function event_signal(e)
	if(e.signal == 1) then --Night
		eq.move_to(108,665,38,63,1);
	elseif(e.signal == 2) then --Day
		eq.move_to(25,542,65,0,1);
	end
end
