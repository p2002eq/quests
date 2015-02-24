function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Thank you for coming to my aid, though I'm sure I could have made it alive. I'm smarter than most would admit. I even committed a crime against my master by questioning one of his motives and the punishment for that is death. Yet, here I stand! Those wyverns have kept me asleep and were trying to turn me to ash. Since you are here, I will finish what I started. I have a secret so magnificent and so powerful that the Ring of Scale will be extremely angry with me. I will exact my revenge! Now, would you [like to know] how to overcome the wards on the passage to Veeshan's Peak?");
	elseif(e.message:findi("like to know")) then
		e.self:Say("You adventurers are all alike. The dragons erected a new ward on the door to only allow the Ring of Scale and its followers entry. They changed it because of greedy adventurers like you! As a servant to the Ring of Scale, I learned how to create a cipher to enter the peak -- one that overcomes the new ward that was erected. This cipher requires the original key or the essence of the original key. The original key was very magical and powerful, for it encompassed the strength of this continent. If you have the original key, you will need to modify it by combining it with this powerless cipher and the blood of a brood dragon. If you do not have the original key, however, you will need to capture the strength of this continent, the essence of the original key. [continue]");
	elseif(e.message:findi("continue")) then
		e.self:Say("Combine the three major essences with that same dragon blood inside the powerless cipher to create the Cipher of Veeshan, your means of entering the peak.");
		e.other:SummonItem("69310");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
