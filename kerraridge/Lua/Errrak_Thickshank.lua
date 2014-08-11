function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("What?  What do you want. furless?  My tseq. Graalf. lies sick and you waste time with talk when you [cannot help].");
	end
	if(e.message:findi("why cannot i help")) then
		e.self:Say("The shamans. they have said I need [talismans] to ward the sickness from Graalf.");
	end
	if(e.message:findi("what talismans")) then
		e.self:Say("Errr?  You wish to help?  We will see.  I need a tiger's skin. from a tigerrr not of ourrr village. for its brave spirit. an aviaks charm. and a giant snake fang for the poison that can be made into an antidote.  If you truly intend to help. then good speed and hurry!"); end
	end
	
	function event_trade(e)
		local item_lib = require("items");
		if(item_lib.check_turn_in(e.trade, {item1 = 7005, item2 = 13737, item3 = 13762})) then
			e.self:Say("Purrrrfect furrless one, you have proved your intentions to help.  Here is the item that was promised for your services.");
			e.other:SummonItem(10139);
		end
	end
end

--END of FILE Zone:kerraridge  ID:74080 -- Errrak_Thickshank


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
