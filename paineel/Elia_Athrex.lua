function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello.  Do you need something or did you merely wish to grace me with your oh-so-delightfully perfumed breath?");
	end
end