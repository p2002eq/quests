--Zalil_Nyvin (202038)
--Zone: Plane of Knowledge
--Advanced Magic Manual

function event_say(e)
	if(e.message:findi("Hail") and e.other:HasItem(28796)) then	--Requires Intermediate Magic Manual
		e.self:Say("How do you do, " .. e.other:GetName() .. "?  So you think you're skilled in the art of magic, do you? Pay close attention for this course I have for you will test your magical prowess like none before. In order to continue my work I will need for you to bring back a few things for me. When you can locate a Tornado Gem, a Battle Worn Trinket, and a Blue Diamond, return and hand them to me along with your Intermediate Magic Manual. If you can do this, then perhaps maybe there is a shred of hope left for you after all! Be off now and good luck!");
	elseif (e.message:findi("Hail")) then
		e.self:Say("How do you do, " .. e.other:GetName() .. "?  I wish I could say I had time to chat but despite appearances I am actually quite busy.  As a teacher of magic I need to constantly update my lesson plans.  Would you be interested in learning from me?  I would be happy to teach you but my course is quite advanced, and I can sense you may not quite be ready yet.  Please return when you have become so.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22503, item2 = 26710, item3 = 9424, item4 = 28796})) then--Blue Diamond, Battle Worn Trinket, Tornado Gem, Intermediate Magic Manual
		e.self:Say("When I saw you walk in the room with these, I nearly fainted. Bravo to you on a job well done. Take this book, may it light your path to day's end. Say, want to know something else? I hear Tenada Jeried is looking for some more students of your caliber. You may wish to seek him out and see what he has to offer. Just tell him you are interested in learning from him. Bye, " .. e.other:GetName() .. "!");
		e.other:QuestReward(e.self,0,math.random(9),0,0,28797,500000); --Advanced Magic Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
