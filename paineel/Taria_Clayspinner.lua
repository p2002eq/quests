function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ".  I make the finest statuettes in all the land.  Each one depicts a power on Norrath.  I have some of the most realistic and lifelike statues.  I only take [" .. eq.say_link("special orders") .. "] as they are rather time-consuming to make.");
	elseif(e.message:findi("special orders")) then
		e.self:Say("Well. if you must know. many priests and devout worshipers of Cazic-Thule purchase my statues and pray over them.  I have made many other statuettes of the gods just to practice. on the off chance that a worshiper of another faith might care to order one from me.");
	end
end