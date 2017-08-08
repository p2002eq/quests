function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("If you are searching for rare items. I would suggest the merchants of the Brood of Kotiz.  They often carry rare trinkets from beyond the walls of Cabilis.");
	end
end