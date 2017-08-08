function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Come in! Come in! Enjoy the sights of the Blind Fish Tavern! We serve the finest alcohol in Neriak!");
	end
end