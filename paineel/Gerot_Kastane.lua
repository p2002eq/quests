-- Part of SK Epic 1.0

function event_say(e)
	
    if(e.other:GetFaction(e.self) < 4) then
	   if(e.message:findi("hail") then
		    e.self:Say("" .. e.other:GetName() .. "! My hero! I am at your service. I have been told to tell you all I know of the Head of the Valiant. Its construction is a mockery to the gods of Light, an abomination above all others. The method of creation of the Head of the Valiant was passed down through my family for centuries. All I require of you is the physical head of a valiant warrior. I have the rest of the materials right here to fashion this item for you.");
	   end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local charfaction = e.other:GetCharacterFactionLevel(342);
	
	if(e.other:GetFaction(e.self) < 4) then
	    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14375}) then
		    e.self:Say("At last! I have been waiting for my brother for weeks! We are doomed! Innoruuk will taint our seed into some perverse, twisted, maddened breed. The prophecy has begun to unfold and there are none capable of stopping it. Quickly, return this note to Marl, we must hide! We have failed the master! We must escape the hateful one's wrath!");
		    e.other:Faction(342, 100);
		    e.other:SummonItem(14376);
	    end
	elseif(e.other:GetFaction(e.self) < 3)
	    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14378}) then
		    e.self:Say("Good travels, dark one! May Innoruuk curse your enemies!");
		    e.other:Faction(342, 70);
		    e.other:SummonItem(14369);
	    end
	end
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------