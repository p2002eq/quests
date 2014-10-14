function event_say(e)
	if(e.message:findi("want to know about hoober")) then
		e.self:Say("I will try not to repeat what Ragnar has already told you.' After taking a deep breath, clearly taxed by the memories, he continues, 'My research had brought me to Katta Castellum. After a long day's work I took a seat at the end of the bar in a local pub. Trying to get my mind off of potions for a while, I overheard a story about a crazy man roaming Tenebrous Mountains. Everyone seemed to know him as Hoober the Delirious. Seems he had become something of a local legend for his very odd habit of asking people to gather some rather obscure ingredients in exchange for a very rare reward.");
	elseif(e.message:findi("what ingredients")) then
		e.self:Say("The promise of true love and everlasting happiness can make even the most scarce ingredients seem trivial. People laughed him off as a lunatic and after finally meeting Hoober I could easily tell why, but his story piqued my interest given my current... project. I asked the fellows to repeat the ingredients this man requested, but they were drinking rather heavily and had paid little attention in the first place. They were very vague, but what they could remember sounded very similar to a partial recipe I had found a record of earlier that very day. Against my better judgement I sought out this wanderer and we had a most interesting conversation.");
	elseif(e.message:findi("conversation")) then
		e.self:Emote("gently closes his eyes and paints a picture in his mind");
		e.self:Say("There was no denying the man's state of mind, he was utterly delirious. That was why I was so convinced...' he drifts off, 'so convinced...");
	elseif(e.message:findi("convinced of what")) then
		e.self:Say("At this notion, he takes a deep breath and opens his eyes to look at you once more, 'you see when he finally did tell me of the things he was looking for, he was eloquent, impassioned, unmistakably controlled. He knew what he was talking about, it seemed like this had to be it, the answer to what I was seeking. So I gathered up the components and combined them myself, and then it all went so horribly wrong...' It takes him a moment to regain his train of thought, 'You wouldn't even be able to have an intelligible conversation with this man due to the cripling nature of the addiction unless someone made you up a batch.");
	elseif(e.message:findi("make a batch")) then
		e.self:Say("glances nervously about, 'I am not sure that I should, the temptation would... perhaps Ragnar could... no he hasn't experience with this mixture.' Kanaad seems to wrack his brain for alternatives, silent for a long moment. His inner conflict evident, he steadies himself for what he is about to do, 'I suppose that I am the only one who can mix this potion for you properly. I can... yes, I have no doubt that I will be fine.' His inner demons put somewhat out of his mind, Kanaad looks you straight in the eyes and says, 'I will need a Luclin clover, a drop of moonlight and some essence of sonnet.");
	elseif(e.message:findi("luclin clover")) then
		e.self:Say("The Luclin clover is in many ways just like any other ordinary clover, but the ones that grow out in the Thicket seem to posses an extra sensitivity to magic and enchantment.");
	elseif(e.message:findi("drop of moonlight")) then
		e.self:Say("A drop of moonlight is exactly that- not solid, not liquid but a captured drop of light itself. Any astrologer worth their salt will be able to harness one for you. Dont know much about astrology myself, but I'd guess that the platforms above the palace would be an ideal place from which to see the stars.");
	elseif(e.message:findi("essence of sonnet")) then
		e.self:Say("This will be the biggest hurdle between you and the potion. The essence of sonnet is a rare and wonderful thing, only the most gifted bards will ever produce one in their lifetime. No amount of effort or studying will help them either- it is an unexpected thing. You see, bards dedicate their life to the telling and retelling of stories, it is their job to inspire others with tales of triumph and tragedy. When a bard of the highest order sees or hears something that so genuinely and so overwhelmingly inspires them, something magical happens");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5990})) then
		e.self:Say("Ah my tools, I guess Ragnar sent these over with you.  So are you looking for Hoober?"); --not live text
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 5991, item2 = 5992, item3 = 5993})) then
		e.self:Say("Thanks for gathering the supplies.  Here is your potion!");
		e.other:QuestReward(e.self,0,0,0,0,5994);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
