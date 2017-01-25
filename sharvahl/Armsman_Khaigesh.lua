function event_say(e)
	if(e.message:findi("lesson")) then
		e.self:Say("A warrior must learn to be patient and pay attention to detail. Take the bag that I've just given you and fill it with Acrylia flecked nuggets. When hunting the moor, we often found rocks and ore wedged in the shells of the beetles that roam there. Kill the beetles that walk near the city's gates and pry their shells apart. You should be able to gather a decent amount of ore that way. Once you've filled the bag that I've given you, return here with the bag and your Skeletonbane short sword and I'll teach you something new.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3452})) then -- Buckler of the Recruit
		e.self:Say("I can see by your armaments, that Hebijeb has started you along the path of bravery. That's a very good foundation for a young Khala Dun recruit to build upon. Bravery is an important trait, but you will need to learn discipline and patience. The blacksmithing that we do as Khala Dun helps to reinforce and reflect upon those traits. Take this bag and I will help you with your next [lesson].");
		e.other:SummonItem(17604); -- Dusty Pouch
		e.other:QuestReward(e.self,0,0,0,0,3452); -- Buckler of the Recruit
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5553, item2 = 3454})) then -- Pouch of Nuggets & Skeletonbane Short Sword
		e.self:Say("You're scruffy and you smell, but you're a fast enough learner.' He says as he pulls a leather strap out of his waistband and carefully wraps it around the hilt of your sword. He hands the sword back to you hilt first and says, 'Wrapping the hilt in that manners allows you to grip the sword better and hit harder. Take the sword and show it to Noril Galoon. He will instruct you further.");
		e.other:QuestReward(e.self,0,0,0,0,5545,2000); -- Leather Gripped Short Sword
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5550, item2 = 5545, item3 = 3453})) then -- Horn Covered Buckler, Leather Gripped Short Sword & Cloak of the Khala Dun Recruit
		e.self:Say("Excellent work! You're progressing nicely, young warrior. You are well suited to the path of the Khala Dun. Take this new cloak and wear it proudly. You have earned the right to consider yourself an Apprentice of the Khala Dun. Please speak to Guard Kuash and show him your new buckler.");
		e.self:Shout("Citizens and travelers, please welcome, " .. e.other:GetName() .. " to the rank of Apprentice to the noble Khala Dun! We should all serve our people in such an honorable fashion!");
		e.other:Faction(132,5); -- Guardians of Shar Vahl
		e.other:SummonItem(5557); -- Cloak of the Khala Dun Apprentice
		e.other:SummonItem(5550); -- Horn Covered Buckler
		e.other:QuestReward(e.self,0,0,0,0,5545,3000); -- Leather Gripped Short Sword
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
