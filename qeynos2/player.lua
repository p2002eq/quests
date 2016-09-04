function event_say(e)
	if(e.message:findi("gmeventstart")) then	
		eq.load_encounter("GmEvent");
	end
end