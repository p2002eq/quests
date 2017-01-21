function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail and well met my friend. if yer a magician I have some spells for ye.");
	end
end
