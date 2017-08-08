function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail. good citizen! You are safe when you are near a sentinel of the High Guard. Feel free to rest and recuperate.");
	end
end