function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met. friend.  May I be of assistance?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 2877})) then
		e.self:Say("I was told to expect you, " .. e.other:GetName() .. ". It is my duty to supervise this stage of your training, which will help strengthen you in preparation for your life of service to our people. There is much to do in very little time so let us begin. There are creatures that roam freely at the base of the rock on which we live. You are tasked with demonstrating a basic understanding of combat by defeating skeletons of grimlings and delivering to me four of their femurs.");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3443, item2 = 3443, item3 = 3443, item4 = 3443})) then
		e.self:Emote("looks at you with an expression of approval");
		e.self:Say("Your completion of the assigned task has been noted. Accept this weapon as a token of the Khala Dun's gratitude. You will find the Khala Dun to be very generous to it's humble students, quick to reward obedience. I have been notified that one of our citizens needs some assistance, bring me proof that you have aided Dronqam Runghi.");
		e.other:Faction(132,10 );
		e.other:QuestReward(e.self,0,0,0,0,3445,1000);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3449})) then
		e.self:Emote("takes the acrylia dust and places it in a vial already half full of the metal");
		e.self:Say("You are nearly finished with the task at hand, " .. e.other:GetName() .. ". I now need you to begin your training in the art of blacksmithing, an essential aspect of the life of the Khala Dun. Combine this mold with three metal bits and a flask of water to fashion a buckler frame. When this is done bring it to me with the Crude Bone Short Sword and your initiate's cloak.");
		e.other:QuestReward(e.self,0,0,0,0,3450);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3451, item2 = 3445, item3 = 2878})) then
		e.self:Say("Your progress pleases our order young one, and I am proud to promote you to the rank of recruit within the Khala Dun. Wear this cloak with pride, " .. e.other:GetName() .. ". I have completed your buckler as well as enhanced your sword. The blade will now be more effective when used against the skeletons from which it was constructed. Show the buckler to Armsman Khaigesh and he will instruct you further.");
		e.self:Shout("Fellow citizens of Shar Vahl, help me welcome " .. e.other:GetName() .. " to the rank of recruit in the honorable Khala Dun. May his actions henceforth reflect the strict sense of loyalty to our king that defines our order. May he exhaust his every resource in glorious defense of our proud people!");
		e.other:Faction( 132,10 );
		e.other:SummonItem(3453);
		e.other:SummonItem(3452);
		e.other:QuestReward(e.self,0,0,0,0,3454,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
