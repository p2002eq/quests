--Changes by Kagehi
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ", sorry but I have no time to chitchat. I'm looking for the help of a citizen.");
	elseif(e.message:findi("citizen")) then
		e.self:Emote("looks at you excitedly, 'Show me your acrylia slate and I'll explain my situation.'");
	elseif(e.message:findi("additional instructions"))	then
		e.self:Say("Mastered those runes already, " .. e.other:GetName() .. "? You're learning very fast indeed. Your next lesson will be in the molding of a new type of item. You'll need to gather some gray clay from below the city and mix it with some Rockhopper blood to make a block of reddish clay. Take this block of reddish clay and combine it with a Vah Shir model sketch to create an unfired Vah Shir figurines. Fire the model in a kiln with a firing sheet to create a Finished Vah Shir figurine. Finally, use the Runequill Set to etch grimling blood into runes on the figurine.' ");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2877})) then -- Acrylia Slate of Shar Vahl
		e.self:Say("Some of my wares are spoiling and I must place them in a container to preserve them. I cannot afford to take the loss that would result if they were to rot. Please " .. e.other:GetName() .. ". take this bowl and combine two lumps of gray mud with a flask of water and xakra bile. Take the resulting clay and this sketch with another water flask to fashion an unfired gray jar. Fire it in a kiln with a firing sheet and return to me with the product as soon as you can.");
		e.other:SummonItem(2877); -- Acrylia Slate of Shar Vahl
		e.other:SummonItem(3497); -- Reusable Gray Jar Sketch
		e.other:QuestReward(e.self,0,0,0,0,17233); -- Ayyads Clay Bowl
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3498})) then -- Gray Jar
		e.self:Say("Excellent! Please accept this knapsack as payment for your trouble. Here is my seal as well. I can always use more jars and if you give me four of my seals I will share with you a family secret.");
		e.other:SummonItem(17234); -- Ayyads Knapsack
		e.other:QuestReward(e.self,0,0,0,0,3499,100); -- Ayyads seal
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3499, item2 = 3499, item3 = 3499, item4 = 3499})) then -- 4x Ayyads seal
		e.self:Say("Excellent, " .. e.other:GetName() .. " few of our kind show a true interest in the more refined arts of pottery these days. It is very good to see the young people taking interest in the old arts. Here is a Basic Runequill Set. Take the instruments in the set and practice marking runes on the gray jars that you previously brought to me. To etch the runes, simply cover a gray jar with some Xakra bile and use the Runequill Set to etch the runes on to the jar. You'll want to fire them in a kiln when you're finished. When those jars become trivial come back and give me those basic tools and we'll see about upgrading them.");
		e.other:QuestReward(e.self,0,0,0,0,3631,200); -- Basic Runequill Set
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3631})) then -- Basic Runequill Set
		e.self:Say("You're progressing nicely, " .. e.other:GetName() .. " Take this sculpting tool and add it to the set you already have. This new quill set will be able to make some very nice urns that should help ease the burden of moving all that heavy clay around. Take a gray jar and use the new set of tools I've given you to etch Xakra blood into runes on the side of the jars. These should prove to be very useful in your labors in the future. Once you have mastered those runes, bring back your runequill set to me for another addition.");
		e.other:QuestReward(e.self,0,0,0,0,3632,200); -- Novices Runequill Set
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3632})) then -- Novices Runequill Set
		e.self:Say("You continue to amaze me with your progress, " .. e.other:GetName() .. ". Here is the final pen to add to your set of runequills. I have just received word that the king has need of your particular talents. Take this note to Guard Fareed and he will instruct you further. Also, this runequill set is able to mark a set of runes on the Grey Jars with Sonic Wolf Blood. This will enchant the jar and make a great container. I trust your artistic instincts to guide you. You should also tell me when you're ready for some [additional instructions].");
		e.other:SummonItem(3647); -- Ayyads Note to Fareed
		e.other:QuestReward(e.self,0,0,0,0,3641,200); -- Finely Crafted Runequill Set
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3643})) then -- Fareeds Note to Ayyad
		e.self:Say("Welcome back " .. e.other:GetName() .. ", I trust you behaved well in the presence of the king's servants. It seems Fareed was very impressed with your work, as he has instructed me to give you a very nice reward. Here, take this Urn, it will surely prove very useful to you as you continue your study of the molding of the earth. Oh, I almost forgot to tell you, Grilo the mason was here earlier looking for you, he has heard of your talents and believes that you might do well in the school of masonry as well. Seek him out.");
		e.other:QuestReward(e.self,0,0,0,0,17107,5000); -- Ayyads Runed Urn
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
