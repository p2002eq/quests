function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, hairrrrless one.  Welcome to the ourrrrr island. As you browse my wares please tell me if you would like to see my [shiny tings] that I have gathered from all over the world.");
	elseif(e.message:findi("shiny tings")) then
		e.self:Say("I thought you looked like one who is would be interested in them.  I have a [dull ring], a [kinda shiny ring] and a [really shiny ring].  These are just a few of the items that I have collected in my jourrrrneies, but I would be willing to parrrrt with them for a prrrrice");
	elseif(e.message:findi("dull ring")) then
		e.self:Say("Rrrrrow, I see that you are looking at my dull ring.  I will give it to you if you can bring me a bracket mildew");
	elseif(e.message:findi("kinda shiny ring")) then
		e.self:Say("So it is the kinda shiny ring that you want.  So be it, but you must brrrring me faerix spores before I will give it to you");
	elseif(e.message:findi("really shiny ring")) then
		e.self:Say("Ah, my favorite one, if I am to part with this one you must get me some degenerated guk weed");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 14042})) then
		e.self:Say("Thank you for this item, here is the dull ring");
		e.other:QuestReward(e.self,0,0,0,0,13733);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 14043})) then
		e.self:Say("You have gotten the spores that I asked for, very well, here is the ring as agreed");
		e.other:QuestReward(e.self,0,0,0,0,13731);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 14044})) then
		e.self:Say("Excellent, I will gladly give you the ring for this weed that you have brought me");
		e.other:QuestReward(e.self,0,0,0,0,13732);
	end
end

--EOF - The text is not accurate, if anyone has the correct text please feel free to update the file accordingly
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------