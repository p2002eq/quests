--Quest for North Kaladim - Trantor Everhot: Tumpy Tonics

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes, yes!! I am a very busy man. I've got blueprints to work on, [dwarven wire] to perfect and formulae to calculate. In between those tasks, I have to find time to head down to Irontoe's and down a few Tumpy Tonics.");
	elseif(e.message:findi("dwarven wire")) then
		e.self:Say("Oh!! Interested in my dwarven wire, are you? Many are. I have no problem letting you use a spool, but I have to warn you that I have not perfected the strength of it yet. I will make you a trade. A couple of [Tumpy Tonics] for a spool.");
	elseif(e.message:findi("tumpy tonics")) then
		e.self:Say("Aaah!! I love Tumpy Tonics. They were created by Tumpy Irontoe. He was once a member of the famed Irontoe Brigade. Since they disbanded and left for parts unknown he decided to stay in Kaladim and open Irontoe's, the finest well in Faydwer.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12114, item2 = 12114})) then --Tumpy Tonic (Only 2)
		e.self:Say("Thank you, that hit the spot!! Here is the spool, as promised."); --Real text still needed
		e.other:SummonItem(12111); --Dwarven Wire
		e.other:Faction(314,5); --Storm Guard
		e.other:Faction(169,5); --Kazon Stormhammer
		e.other:Faction(219,5); --Miners Guild 249
		e.other:Faction(215,5); --Merchants of Kaladim
		e.other:Faction(57,-5); --Craknek Warriors
		e.other:AddEXP(1000);
		e.other:Ding();
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 12114})) then
	    e.self:Say('Hey!! Only one?!!');
	    e.other:SummonItem(12114);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
