--Feed the Hopper Quest
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail mate. Did you need something from me or are you looking to do me a [favor]?");
	elseif(e.message:findi("favor")) then
		e.self:Say("I've been playing with this little hopper for a while with the hopes of maybe domesticating him. He's fond of grimling parts, so that's what I bring him when I come over here to sit around and work on my leatherwork. I'll make you a deal... If you bring me four grimling toes or finger bones, I'll trade them for one of my leather pieces. Don't mix them up though.... I'm trying to see which he likes best... fingers bones or toes.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3918, item2 = 3918, item3 = 3918, item4 = 3918})) then --Finger bones x 4
		e.self:Say("Thanks, here is your reward!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(7079,7074,7071,7078,7075,7072,7081,7073,7080,7076,7082,7077),1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3812, item2 = 3812, item3 = 3812, item4 = 3812})) then --Grimling toes x 4
		e.self:Say("Thanks, here is your reward!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(7079,7074,7071,7078,7075,7072,7081,7073,7080,7076,7082,7077),1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 3670})) then -- Seal of Animist Poren - Khati Sha Apprentice (Beastlord #3)
		e.self:Say("I can tell by the manner in which you approached me that Poren did not explain what I would require of you, little friend. Your development as a Khati Sha will be demanding. Our expectations of you should only be exceeded by your own. Our namesake, Khati Sha, was an unrivalled hero to our people. The story of his life is an example that you will be expected to learn. You will be expected to research and explore the path that he took and strive to understand what that path means for the future of our people. Take this map to Kery Miann. She will start you on the path");
		e.other:QuestReward(e.self,0,0,0,0,5571); -- Worn Map of the Area
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
