function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. I am pleased to report that I am fully stocked. Please have a look at the goods I have for sale.");
	end
end