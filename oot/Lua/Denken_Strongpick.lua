function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". I am Denken Strongpick. I wish I could get off this rock, silly clan honor. My boss broke our rebreathers and we can not go back to the mainland before wegather some [goblin relics].");
	end
	if(e.message:findi("goblin relics")) then
		e.self:Say("There are supposedly goblin ruins around here somewhere. Fendlemend thinks we will find paydirt underwater. We did find [one thing].");
	end
	if(e.message:findi("one thing")) then
		e.self:Say(" We found a very fine sword blade. Denken pulls open his pack and shows you a razor sharp sword covered with runes. I can't figure out what type of metal it is and I sure can't figure out what technique was used to forge it. Perhaps you would like to take it off my hands and [buy] it?");
	end
	if(e.message:findi("buy")) then
		e.self:Say("Out here, money is fairly useless to me. You see, I can't leave Fendlemend out here alone. I signed on with a very detailed contract. I could sure [use] a few things from the mainland though.");
	end
	if(e.message:findi("use")) then
		e.self:Say("I would be willing to part with this very fine blade for a keg of Vox tail ale, a block of permafrost to keep it cool and two new rebreathers to get this operation back underway.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- 16889 :  Rebreather x2
	-- 20665 :  Block of Permafrost
	-- 20664 :  Keg of Vox Tail Ale
	if(item_lib.check_turn_in(e.trade, {item1 = 16889, item2 = 16889, item3 = 20665, item4 = 20664})) then
		e.other:SummonItem(20667); -- 20667  Ancient Sword Blade
		e.other:AddEXP(50000);
		e.other:Ding();
		e.self:Say("Excellent! Here is your sword. I feel like I'm at home already!");
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

--End of File, Zone:oot  NPC:69061 -- Denken_Strongpick

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
