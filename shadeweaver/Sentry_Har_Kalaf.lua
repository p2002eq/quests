function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Tread cautiously here. The road to the [" .. eq.say_link("paludal") .. "] caverns is a dangerous journey these days.");
	elseif(e.message:findi("paludal?")) then
		e.self:Say("The paludal caverns lie to the north, just beyond that copse of blue payala trees. Be careful if you decide to head that way, there are many [" .. eq.say_link("dangers") .. "] on the road to the north.");
	elseif(e.message:findi("dangers")) then
		e.self:Say("The spirits have been restless in the northern region. The shak dratha have also been attacking travelers and merchants alike. I hear there is some good hunting within the Paludal caverns, however. The journey may be worth your while.");
	end
end
