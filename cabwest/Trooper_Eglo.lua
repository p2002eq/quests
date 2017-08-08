function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("The waters of Cabilis are teeming with life.  A good fisherman could make heavy coin catching fish.");
	end
end