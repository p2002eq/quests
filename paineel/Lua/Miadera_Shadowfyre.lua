--BeginFile paineel\Miadera_Shadowfyre.pl
--Quest for Paineel - Miadera Shadowfyre: Terror Forged Mask
--
--Status: Incomplete
--Issue1: Create Item - 'Mundane Mask'
--Issue2: Get correct text
--

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the [summoning of Terror].");
	end
	if(e.message:findi("summoning of terror")) then
		e.self:Say("It will be a frightfully fulfilling summons. To do this, I need an eye of urd, some basalt drake scales, the lens of Lord Soptyvr, and a lock of widowmistress hair.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10523, item2 = 19032, item3 = 14110, item4 = 14109})) then --Eye of Urd, Basalt Drake Scales, Lens of Lord Soptyvr, Widowmistress Hair
		e.self:Say("Yes, this is what I require to summon Terror!"); --Text made up
		e.self:Emote("begins speaking an incantation. 'Take this mask as your reward for helping me.'");
		--    e.other:SummonItem(00000); --Mundane Mask
		--    eq.spawn2(?????,0); --Avatar of Terror
	
	else
		e.self:Say("I have no need for this, " .. e.other:GetName() .. ".");
		plugin::returnitems(\%itemcount);
	end
end
--END of FILE Zone:paineel  ID:75070 -- Miadera_Shadowfyre

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
