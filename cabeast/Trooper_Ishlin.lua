function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I wish to earn heavy coin so I can meet with the Kloks in the Haggle Baron's house.  They are said to have the finest merchandise available in Cabilis.");
	end
end