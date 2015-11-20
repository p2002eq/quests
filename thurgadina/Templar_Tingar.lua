function event_spawn(e)
	eq.set_timer("first_speech", 480000); --make say 1st part every 8 min
	eq.set_timer("second_speech", 840000); --make say 2nd part every 14 min 
end


function event_timer(e)
	if (e.timer == "first_speech") then
		e.self:Say("Oh Brell, what ever did I do to inspire your wrath?");
	elseif (e.timer == "second_speech") then	
		e.self:Say("Ok, let's try this again.");
		e.self:Say("ROYGHT FACE!");
	end

end
