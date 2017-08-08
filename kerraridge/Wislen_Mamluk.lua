function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why you bother Wislen?  Wislen trying to get fishies.  Leave Wislen alone to get [" .. eq.say_link("fish") .. "]. please.");
	elseif(e.message:findi("fish")) then
		e.self:Say("Fish.  Wislen fish.  Wislen is mamluk. not just fisher.  Mamluk is warrior but they also helps provide for all Kerran.  This is hadi place in life.  We happy doing this.  Please. let Wislen fish now.");
	end
end