function event_waypoint_arrive(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	
	if(e.wp == 2 or e.wp == 9) then
		e.self:Emote("gathers up a bale of straw");
		eq.create_ground_object(13990,xloc,yloc,zloc,0,600000);
	elseif(e.wp == 3 or e.wp == 10) then
		e.self:SetRunning(true);
	elseif(e.wp == 5 or e.wp == 12) then
		e.self:SetRunning(false);
	end
end
