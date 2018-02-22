--Acomar_Lothwol (202040)
--zone:  Plane of Knowledge
--Beginner Magic Manual

--As a note, according to posts at Alla's (not the most reliable source I know,
--but all I've got right now) the Beginner's quests eat the Planar Traveler's Manual,
--so that quest must be completed 3 times in order to do all the Beginner's Manual
--Quests.  This is intended behavior.


function event_say(e)
	if (e.other:GetLevel() >= 20 and e.other:HasItem(28745)) then	--Requires min level 20 and Planar Traveler's Manual
		if(e.message:findi("Hail")) then	
			e.self:Say("It is good to see you, " .. e.other:GetName() .. ". As a teacher, my job is to share the knowledge of all things mystical with eager students. I sense you have obtained the basics of planar knowledge, you are now ready to begin your first lesson in the ways of magical ability. Are you [" .. eq.say_link("willing to learn") .. "] what life has to offer?");
		elseif(e.message:findi("willing to learn")) then
			e.self:Say("The use of magic can be a taxing ordeal on the body, and quite often may leave you in a weakened state. Fortunately, I happen to know of a rather rejuvenating meal that will grant new power to your condition. If you are not familiar with the recipe for [" .. eq.say_link("Hobgoblin Surprise") .. "], I can tell you. What you must do is bring me some as well as your Planar Traveler's Manual. I hope you won't be long, for I am beginning to get quite hungry.");
		elseif(e.message:findi("hobgoblin surprise")) then
			e.self:Say("Don't be put off by the name, it's actually quite tasty. To make Hobgoblin Surprise, get a pie tin, some bread, add some hobgoblin meat and brown gravy. Cook it in the oven and enjoy the results. Mmm mmm, it waters my mouth just thinking about it.");
		end
	elseif(e.message:findi("Hail")) then
			e.self:Say("It is good to see you, " .. e.other:GetName() .. ".  I trust the people of New Tanaan have treated you well thus far.  It is refreshing to see so many people of different cultures coming together in harmony, don't you think?  So many shared experiences from all corners of the universe provide us with a great benefit of wisdom.  As a teacher, my job is to share the knowledge of all things mystical with eager students.  If you are truly interested in knowledge, you should prepare yourself with the basics first.  A solid foundation leads to new heights of achievement.");	
	elseif (e.message:findi("willing to learn") or e.message:findi("hobgoblin surprise")) then
		e.self:Say("I am glad to see you are willing to learn, however I'm afraid you are not ready for my teachings.  Come back when you have acquired the proper tools of learning.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((e.other:GetLevel() >= 20) and item_lib.check_turn_in(e.self, e.trade, {item1 = 29751, item2 = 28745})) then--Hobgoblin Surprise, Planar Traveler's Manual
		e.self:Say("How delicious! You have done well here, I can't remember how long it's been since I've tasted a meal so fine. Take this book, it will certainly help you in your use of the magical arts. When you are ready, Cadelid Etord will give you your next lesson, so be sure to speak to him. Do not lose your book or else he may not appreciate you coming to class unprepared.");
		e.other:QuestReward(e.self,0,0,0,0,28795,10000); --Beginner Magic Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end