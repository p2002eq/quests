function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Aye, the Sergeant's had us in the moor all week. It's been a long week too. The critters out there are behaving all peculiar.");
	end
	if(e.signal == 2) then
		e.self:Say("Well, I'll tell you a quick story if you fill my mug again. Sound like a deal? Otherwise, I'll just head over to Rawlf's place and let him hear it.");
	end
	if(e.signal == 3) then
		e.self:Say("Okay... here it goes... We were all sneaking along on patrol one night. We had just broke camp and were moving along the ledge near the big Hollowshade wolf cave. When we got near the cave, we notice a large pack of those nasty buggers... like eight or nine massive wolves... and they were coming right at us!");
	end
	if(e.signal == 4) then
		e.self:Say("No no... this is where it gets weird. The creatures just walked right through our patrol. They acted like they didn't even see us. We were all tensed up and ready for a fight and those beasts just ignored us. We stood still for a few moments and let them pass. Then it got a bit weirder.");
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
