function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("And hello to you traveler. Beyond this gate lies the Shadeweavers Thicket. You had best go armed. for the [Claw Beasts] have been attacking merchants regularly.");
	elseif(e.message:findi("what claw beasts?")) then
		e.self:Say("A true horror. they are mindless predators and quite large to boot. These beasts have massive razor sharp teeth that can rip your arm off cleanly.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- takes repair order from master Barkhem
	if(item_lib.check_turn_in(e.trade, {item1 = 29803})) then
		e.self:Say("Oh this old shield does fine, but I guess if Barkhem needs to break in a new apprentice, it does have some dings in it. Thank you, my friend.");
		e.other:QuestReward(e.self,0,0,0,0,29804);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29805})) then -- koby immaculate shield
		e.self:Say("Tip-top work! Barkhem has done well by himself choosing you for an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,29806);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
