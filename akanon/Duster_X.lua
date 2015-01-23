-- Converted to .lua by Speedz

function event_waypoint_arrive(e)
	if(e.wp == 5) then
		e.self:Say("Click.. Dust. Dust. Dust.");
		e.self:SetRunning(true);
	elseif(e.wp == 12) then
		e.self:Say("Click.. Dust. Dust. Dust.");
	elseif(e.wp == 24) then
		e.self:Say("Click.. Dust. Dust. Dust.");
		e.self:SetRunning(false);
	end
end
