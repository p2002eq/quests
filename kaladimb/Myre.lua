function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I am not here to chitchat dear. If you need some gear, I can help. If you want to talk, go find a tavern.");
	elseif(e.message:findi("Eldritch")) then
		e.self:Say("So you came to get the bozinite pestles, eh? Well, dearie, we have no bozinite pestles. We don't have enough bozinite to spare. One of those wondrous clockwork creatures from Ak'Anon has gone and found a home amongst us dwarves. He is sucking up what little bozinite we have mined. You go and find that little bugger and bring me some of the bozinite he slurped up and I will make you one bozinite pestle. Good luck. He is one quick hunk of metal.");
	end
end