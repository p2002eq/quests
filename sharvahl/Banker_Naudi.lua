function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome! I am pleased to announce that the Royal Coin and Mint of Shar Vahl has made arrangements to make sure you are able to access your money and valued items from any other bank. Our Benevolent King Raja Kerrath ensures that this is a safe and efficient method of transaction.");
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
