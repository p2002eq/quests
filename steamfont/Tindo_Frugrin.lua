-- Quest:  Telescope Lenses
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings! It is good to see a new face out here. I am Tindo Frugrin, observer for the Eldritch Collective.");
	elseif(e.message:findi("lens")) then
		e.self:Say("I was hoping you were not the one they sent. I have a slight problem. My brother Bidl Frugrin is holding the lens. He went to Kelethin for a little observation. He has been there for quite some time. I fear he has found the local tavern. He will no doubt spend the day in the forest and every night at the tavern.");
	end
end