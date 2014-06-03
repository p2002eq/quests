function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Church of Underfoot. Please open your soul to the greatness of Brell Serilis. May he guide you in all your future eavors. And may your soles long for the [Soil of Underfoot].");
	elseif(e.message:findi("soil")) then
		if(e.other:GetFaction(e.self) > 4 ) then -- amiable or better to get quest.
			e.self:Say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
		else
			e.self:Say("I can trust you with the soil of Underfoot, but first you must obtain four portions of fairy dust. Return them to me and I shall mix it and pray over it. Then I shall give you a pouch of soil of Underfoot.");
		end
	elseif(e.message:findi("candle")) then
		e.self:Say("The Candle of Bravery is used for temple ceremonies here in Kaladim. When the candle burns out, I must venture to the frigid village of Halas far to the north of the continent of Antonica. There I will take the candlestick and the [soil of Underfoot] to Dok. He must create the candle in the very ornate candlestick.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18765})) then
		e.self:Say("Welcome to the Underfoot Cathedral. I am High Priestess Ghalea. Here is your guild tunic. Now. let's get you started helping us spread the will of Brell.");
		e.other:SummonItem(13514);
		e.other:Faction(44,100); -- Clerics of Underfoot
		e.other:Faction(169,100); -- Kazon Stormhammer
		e.other:Faction(219,75); -- Miners Guild 249
		e.other:AddEXP(100);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12106, item2 = 12106, item3 = 12106, item4 = 12106}) and (e.other:GetFaction(e.self) < 5)) then  -- Fairy Dust -- NOT Fairy Princess Dust
		e.self:Say("May the mighty power of Brell saturate this soil with his divinity.  Here you are, my noble friend.  You may have a pouch of the soil of Underfoot.");
		e.other:SummonItem(12282);  -- Soil of Underfoot
		e.other:Faction(44,2); -- Clerics of Underfoot
		e.other:Faction(169,2); --Kazon Stormhammer
		e.other:Faction(219,2); --Miner's guild 249
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
