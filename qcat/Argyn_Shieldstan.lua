function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You have set foot upon the sacred grounds of the Shrine of Bertoxxulous. You had best have business here or this dirt shall become your grave.");
	end
end