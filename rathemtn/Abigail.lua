function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings!  I am the holder of the secret of the [Breastplate of Ro].  You may rest here.  You are quite safe within this camp of paladins.");
	
	elseif(e.message:findi("breastplate of ro")) then
		if(e.other:GetFaction(e.self) < 5) then -- requires amiable
			e.self:Say("The Breastplate of Ro mold will be awarded to you.  First, you will perform a test of strength.  Go to Faydwer.  There you shall seek out and destroy the Teir'Dal who carry the dark cauldrons!!  They have been venturing into our lands and capturing many Koada'Dal and Fier'Dal for cooking purposes!  Bring to me two of their dark cauldrons.");
		else
			e.self:Say("You need to prove your loyalty to my temple.  Go to Felwithe and seek out the Clerics of Tunare.  Prove to them your faith.  Then ask the leader of this church if you are a [honored member].");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12309, item2 = 12309}) and e.other:GetFaction(e.self) < 5) then -- A Dark Cauldron
		e.self:Say("You have earned the mold.  You will now need go and speak with Thomas about [Lord Searfire].");
		e.other:Faction(43,1);  -- Clerics of Tunare
		e.other:Faction(178,1); -- King Tearis Thex
		e.other:Faction(8,1); -- Anti-Mage
		e.other:QuestReward(e.self,0,0,0,0,12299); -- Mold of Ro Breastplate
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12309}) and e.other:GetFaction(e.self) < 5) then
		e.self:Say("I instructed you to return with no less than two dark pots.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50113 -- Abigail
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------