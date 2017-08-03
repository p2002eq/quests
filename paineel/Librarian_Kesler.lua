function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. researcher!  There are many things to be found here.  Our selection grows daily.  Would you [" .. eq.say_link("care for any books") .. "]?");
	elseif(e.message:findi("any book")) then
		e.self:Say("Excellent!  I love to see the young so interested in knowledge.  What subject would you like to research? My most interesting topics today would have to be the [" .. eq.say_link("Hole") .. "], [" .. eq.say_link("old Paineel") .. "], the [" .. eq.say_link("Underfoot") .. "], and the [" .. eq.say_link("history of Paineel") .. "].");
	elseif(e.message:findi("history of paineel")) then
		e.self:Say("Tis an excellent topic. " .. e.other:GetName() .. ".  Much can be learned of a civilization if one first understands its history.  I hope you enjoy the book.");
		e.other:SummonItem(18093); -- History of Paineel
	elseif(e.message:findi("hole")) then
		e.self:Say("Here you are. " .. e.other:GetName() .. ".  The book has old bindings and is worthless to most. but the value of knowledge is priceless.");
		e.other:SummonItem(18091); -- History of the Hole
	elseif(e.message:findi("underfoot")) then
		e.self:Say("Excellent choice. " .. e.other:GetName() .. ".  The Underfoot is a mysterious place.  I hope you get as much from the book as I did.");
		e.other:SummonItem(18094); -- Underfoot Musings
	elseif(e.message:findi("old paineel")) then
		e.self:Say("Take this book. " .. e.other:GetName() .. ".  It contains the history of the ancient city from which we came.");
		e.other:SummonItem(18092); -- Old Paineel
	end
end