function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Have you heard the latest babble?  Giant stingers which spew forth flames and fight with the tactics of a lizard are said to inhabit the Overthere.");
	end
end