-- NPCID 155340
function event_spawn(e)
	e.self:Say("Well thank heavens you're finally home, perhaps I should think twice before sending you out alone next time, little one.  Thank you so much for bringing her back, my friend.  Looks like she managed to talk you into carrying the buttons for her as well.");
	eq.set_timer("depop",300000);
end

function event_signal(e)
	if(e.signal==1) then
		e.self:Emote("sighs and says, 'My hands are full right now hon.'  Delival looks your way curiously and asks, 'I don't suppose you would want to [tuck] her in for me if I give you a blanket?'");
	end
	if(e.signal==2) then
		e.self:Say("Yes, yes, goodnight now sweetheart.");
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("tuck")) then
		e.self:Say("Thank you again, have been a great help.  Here is her favorite blanket, just give it to her and she should be fine.  G'night Shainai.");
		e.other:QuestReward(e.self,0,0,0,0,4478); -- Shainais Blanket
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4460})) then -- Shainais Bag
		e.self:Say("Well I wish there was more I could do to repay you. Take this old compass and what change I can spare with my most sincere thanks. Now off to bed Shainai, you have had a busy day.");
		e.other:Faction(132,4); -- Guardian of Shar Vahl
		eq.signal(155339,1,10); -- Shainai
		e.other:QuestReward(e.self,12,9,0,0,12000,100); -- Compass
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
