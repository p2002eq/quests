--Beginner Magic Manual
--As a note, according to posts at Alla's (not the most reliable source I know,
--but all I've got right now) the Beginner's quests eat the Planar Traveler's Manual,
--so that quest must be completed 3 times in order to do all the Beginner's Manual
--Quests.  This is intended behaviour.
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("It is good to see you. " .. e.other:GetName() .. ".  I trust the people of New Tanaan have treated you well thus far.  It is refreshing to see so many people of different cultures coming together in harmony. don't you think?  So many shared experiences from all corners of the universe provide us with a great benefit of wisdom.  As a teacher, my job is to share the knowledge of all things mystical with eager students.  With my help I can teach you the basics of planar magic if you are [willing to learn].");
	elseif(e.message:findi("willing to learn")) then
		e.self:Say("The use of magic can be a taxing ordeal on the body, and quite often may leave you in a weakened state. Fortunately, I happen to know of a rather rejuvenating meal that will grant new power to your condition. If you are not familiar with the recipe for [Hobgoblin Surprise], I can tell you. What you must do is bring me some as well as your Planar Traveler's Manual. I hope you won't be long, for I am beginning to get quite hungry.");
	elseif(e.message:findi("hobgoblin surprise")) then
		e.self:Say("Don't be put off by the name, it's actually quite tasty. To make Hobgoblin Surprise, get a pie tin, some bread, add some hobgoblin meat and brown gravy. Cook it in the oven and enjoy the results. Mmm mmm, it waters my mouth just thinking about it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 29751, item2 = 28745})) then--Hobgoblin Surprise, Planar Traveler's Manual
		e.self:Say("How delicious! You have done well here, I can't remember how long it's been since I've tasted a meal so fine. Take this book, it will certainly help you in your use of the magical arts. When you are ready, Cadelid Etord will give you your next lesson, so be sure to speak to him. Do not lose your book or else he may not appreciate you coming to class unprepared.");
		e.other:QuestReward(e.self,0,0,0,0,28795); --Beginner Magic Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
