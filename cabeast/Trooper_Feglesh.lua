function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("If sweets are your fancy. seek out the chefs of Cabilis.  They have much to offer.");
	end
end