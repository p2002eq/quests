function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. My brother Joogl is a great bixie hunter.  No one can smash bixies like my brother.  He is the best.  He works for [" .. eq.say_link("Kizzie Mintopp") .. "].");
	elseif(e.message:findi("kizzie mintopp")) then
		e.self:Say("Kizzie owns the Herb Shop in Rivervale. She is the keeper of the [" .. eq.say_link("honey jum recipe") .. "].");
	elseif(e.message:findi("honey jum recipe")) then
		e.self:Say("I do not know, but it tastes good on bixie crunchies.  Kizzie makes it with the honeycombs my brother collects from the bixies.");
	end
end