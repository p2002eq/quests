function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do you wish to view my wares or have you simply come to gawk in awe?");
	end
end