function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. researcher!  There are many things to be found here.  Our selection grows daily.  Would you [care for any books]?");
	end
	if(e.message:findi("i care for any books")) then
		e.self:Say("Excellent!  I love to see the young so interested in knowledge.  What subject would you like to research? My most interesting topics today would have to be the Hole. old Paineel. the Underfoot. and the history of Paineel.");
	end
	if(e.message:findi("tell me about the history of paineel")) then
		e.self:Say("Tis an excellent topic. " .. e.other:GetName() .. ".  Much can be learned of a civilization if one first understands its history.  I hope you enjoy the book.");
	end
	if(e.message:findi("tell me about the hole")) then
		e.self:Say("Here you are. " .. e.other:GetName() .. ".  The book has old bindings and is worthless to most. but the value of knowledge is priceless.");
	end
	if(e.message:findi("tell me about the underfoot")) then
		e.self:Say("Excellent choice. " .. e.other:GetName() .. ".  The Underfoot is a mysterious place.  I hope you get as much from the book as I did.");
	end
	if(e.message:findi("tell me about the old paineel")) then
		e.self:Say("Take this book. " .. e.other:GetName() .. ".  It contains the history of the ancient city from which we came."); end
	end
end
--END of FILE Zone:paineel  ID:75076 -- Librarian_Kesler


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
