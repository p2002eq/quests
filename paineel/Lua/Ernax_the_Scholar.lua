function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. Please leave me be. I am studying several interesting essays on mana storage devices.");
	end
	if(e.message:findi("i wish to speak to you on a matter of the soul")) then
		e.self:Say("I haven't heard anyone say that in a while. I am surprised that you want to follow the legacy of Azraxs. Take this book and write down the instructions on how to complete your soul trap and then give the book back to me.");
		e.other:SummonItem(18956); --Tattered Book
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18956})) then --Tattered Book
		e.self:Say("Here is the first part. Now, go and gather the components from the list. Once your trap is ready, you will know what to do.");
		e.other:SummonItem(17803); --Soul Trap
	
	else
		e.self:Say("I don't need this.");
		plugin::check_handin(\%itemcount);
	end
end
--END of FILE Zone:paineel  ID:75029 -- Ernax_the_Scholar

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
