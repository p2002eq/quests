function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hrm?  Yes. yes?  Buy something. or leave me alone!");
	end
end