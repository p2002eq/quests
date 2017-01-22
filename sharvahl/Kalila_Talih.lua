function event_say(e)
	fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Emote("looks up from her teary handkerchief, the deepest sadness visible in her eyes");
		e.self:Say("I am very sorry, but I am not very good company at the moment. I fear my [love] will never return.");
	elseif(e.message:findi("love")) then
		e.self:Say("Kalila Talih ,");
		e.self:Emote("recalling joyful memories that bring sadness to her eyes, chokes on her words,");
		e.self:Say("It is not easy for me to talk about, perhaps someday... I began writing of us, thinking that it would help lift my sinking heart, but I could not finish even that.' As she speaks, she lazily flips through her diary where a [story] of true love has been recorded. ");
	elseif(e.message:findi("story")) then
		if(fac <= 4) then
			e.self:Say("I never mentioned this to Kalila, I thought it would hurt her more than it would help, but when I bumped into Behari just before he disappeared, he was going on and on about a [love potion] of some sort. He was very excited, said he thought it would be the perfect gift for Kalila on their wedding night, so you see why I never mentioned it. Anyway, he said that he had just gathered all of the ingredients and was heading back out of Katta. ");
			e.other:SummonItem(18324);
		else
			e.say:Say("'I am not sure that I should discuss this matter any further, I hope that you understand.");
		end
	elseif (e.message:findi("love potion")) and (fac <= 4) then
		e.self:Say("'I have no idea what he meant by a 'love potion.' I have never even heard of such a thing, it just isn't my field, I am afraid. Maybe one of the spiritists knows something about it. I doubt that it will do anything to help you track down Behari, but I wish you luck my friend.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5996})) then -- Aisha'a Locket
		e.self:Emote("gasps at the sight of what you have handed her,");
		e.self:Say("mother's locket! Have you found...' She looks into your eyes and sees the answer to her unspoken question. 'I... I thank you,' is all that she can manage.");
		eq.signal(155083,1,1);
		e.other:QuestReward(e.self,0,0,0,0,5995); -- Belt of the Khala Dun
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
