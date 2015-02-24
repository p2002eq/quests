function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Very good to meet you. " .. e.other:GetName() .. ".  I am the keeper of the [Greaves of Ro].  Please feel free to rest and recuperate here.  We shall see that you are safe from the evils of the Rathe Mountains.");
	elseif(e.message:findi("greaves of ro")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("Go to the countryside of Freeport.  There, you shall seek out any nightfall giants .  They have terrorized the countryside for too long.  They have protection from common weapons.  Rely on magic.  I failed in tracking them down.  You shall succeed and when return any single head to me. you shall be awarded the mold for the greaves.");
		else
			e.self:Say("Leave my presence at once. Your ways of life are not acceptable to one who follows the Truthbringer.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) < 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 12313})) then
			e.self:Say("You have done well.  These giants shall soon be purged from the Commonlands and the inns will be filled once again.  Here is the mold for the Ro Greaves.  For the final component, go and ask Thomas of [Lord Searfire].");
			e.other:QuestReward(e.self,0,0,0,0,12303); --Mold of Ro Greaves
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50109 -- Elisabeth
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------