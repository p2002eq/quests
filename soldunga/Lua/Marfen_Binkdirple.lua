--Zone: Solusek's Eye
--Short Name: soldunga
--Zone ID: 31
--
--NPC Name: Marfen Binkdirple
--NPC ID: 31080
--Quest Status: finished
--

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20372})) then
		e.self:Say("Ah! 'Bout time ye got yer lazy bones down here! I was beginnin' ta worry bout ya. Thought ye'd never pick the doll up. Me kin worked and toiled over this thing fer days. That Baenar was sure exact in every detail. For a special child, he said. Must be some child. He spent all he had and some he didn't. Still owes us a show! Anyway, I heard she passed away some time ago. Give the lad muh regards.");
		e.other:SummonItem(20370);
	end
end

--END of FILE Zone:soldunga  ID:31080 -- Marfen_Binkdirple


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
