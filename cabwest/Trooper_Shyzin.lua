function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I am glad the crusaders assist with the patrols of Cabilis.  Their powers of healing are always welcomed by the troopers.");
	end
end