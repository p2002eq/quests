function event_say(e)
	fac = e.other:GetFaction(e.self);
	if(e.message:findi("hail")) then
		e.self:Emote("looks up from her teary handkerchief, the deepest sadness visible in her eyes");
		e.self:Say("I am very sorry, but I am not very good company at the moment. I fear my [love] will never return.");
	elseif(e.message:findi("love")) then
		e.self:Emote("recalling joyful memories that bring sadness to her eyes, chokes on her words,");
		e.self:Say("It is not easy for me to talk about, perhaps someday... I began writing of us, thinking that it would help lift my sinking heart, but I could not finish even that.' As she speaks, she lazily flips through her diary where a [story] of true love has been recorded. ");
	elseif(e.message:findi("story")) then
		if(fac <= 4) then
			e.self:Emote("considers you for a moment, 'I do not suppose I could ever bear to finish it. It is a story I wish had a happy ending, but I do not have it in my heart to create such a thing. If you would like to read it, I suppose you may. It is probably best that I try to distance myself from this experience,' she says half-heartedly. ");
			e.other:SummonItem(18324);
		elseif (fac > 4) then
			e.say:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
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

function event_signal(e)
	if(e.signal == 1) then
		e.self:Emote("Kalila Talih chuckles in spite of herself between sobs,");
		e.self:Say("You do love to tell that story, father, don't you?' she says with a smile. Jalil, though relieved that his daughter can still find something to smile about, has the look of a man that might prefer that she found something else to smile about. He says nothing, but grins sheepishly. ");
		eq.signal(155083,1,1); -- Jalil_Talih
	end
end