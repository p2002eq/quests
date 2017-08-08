function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my shop. " .. e.other:GetName() .. ".  Feel free to purchase whatever you need.  I am sure that I can fill those needs. as [" .. eq.say_link("the Seekers of the Dark Truth") .. "] generally keep me stocked and on my toes.");
	elseif(e.message:findi("the seekers of the dark truth")) then
		e.self:Say("Ah. so you wish to know about the Seekers? They are the guild of necromancers here in Paineel.  They are by far the most knowledgeable in the dark arts of all the known world.  They purchase a good many [" .. eq.say_link("herbs") .. "] from me.");
	elseif(e.message:findi("herbs")) then
		e.self:Say("The herbs the necromancers use typically have properties useful for the preservation of dead flesh.  Who knows what they use them for?");
	end
end