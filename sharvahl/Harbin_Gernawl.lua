function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ". It is my pleasure to meet you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 2877})) then
		e.self:Say("Ahh, " .. e.other:GetName() .. ", I was told you'd be coming. I am Harbin, and I will oversee the next bit of your progress in the Taruun. You have bravely chosen a path that will put your every skill to the test. May your abilities be honed in the service of the noble Vah Shir. To begin, bring me the soft chitin of three of the Rhinobeetles that dwell in the crater surrounding our city.");
		e.other:QuestReward(e.self,0,0,0,0,2877);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3455, item2 = 3455, item3 = 3455})) then
		e.self:Emote("Harbin Gernawl takes the chitin and deftly fashions a buckler as he speaks, 'Your progress will be reported, " .. e.other:GetName() .. ". For your effort thus far I present you with this buckler. It will help to protect you until you become adept enough to wield a weapon in each of your hands. Meanwhile, it is time for you to practice the skill that Shar Vahl relies on to feed it's people. Following this recipe, deliver four boiled rockhopper eggs to Sergeant Tylah in Hollowshade moor. Return to me with the acrylia he will pay you.'");
		e.other:QuestReward(e.self,0,0,0,0,3456);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3459})) then
		e.self:Say("Your progress will be rewarded, " .. e.other:GetName() .. ". Soon all will recognize you as a recruit of the cunning Taruun! Speak with Merchant Rytan. When he is through with you return to me with his seal, your buckler, your initiate's cloak and this seal.");
		e.other:QuestReward(e.self,0,0,0,0,3460);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3460, item2 = 3464, item3 = 2878, item4 = 3456})) then
		e.self:Say("Your hard work is pleasing to the Taruun, " .. e.other:GetName() .. ", which now accepts you as an official recruit. Wear this cloak with pride. Your buckler has been treated with a special epoxy and should protect you more effectively now. Show the buckler to Taruun Joharr and he will continue to guide you on your sacred path. I sense a strong spirit in you, young one. May it guide you to greatness!");
		e.other:SummonItem(3466);
		e.other:QuestReward(e.self,0,0,0,0,3465);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
