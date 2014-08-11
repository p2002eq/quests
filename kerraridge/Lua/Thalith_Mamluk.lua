function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Wha?  Rarrrr!  Thalith try to fish but with [rrrats] and you botherring him. he cannot concentrate on water!  Go away. let Thalith fish!");
	end
	if(e.message:findi("rats")) then
		e.self:Say(";Rats. Yes. Small, furry, brown, with teeth. They come, bite my paws, steal my bait, chew on lines and rods. They nasty little beasts and easy to kill but me not able to leave this position or fish get away. Errr. Maybe you keep the rats away? You kill baddest rat, Sharptooth. You bring me his tooth. I be very happy.")
		Rats. Yes. Small, furry, brown, with teeth. They come, bite my paws, steal my bait, chew on lines and rods. They nasty little beasts and easy to kill but me not able to leave this position or fish get away. Errr. Maybe you keep the rats away? You kill baddest rat, Sharptooth. You bring me his tooth. I be very happy.")
	end
	function event_trade(e)
		local item_lib = require("items");
		if(item_lib.check_turn_in(e.trade, {item1 = 6347})) then
			e.self:Say("You.. You kill the rats? Errr. Thalith thanks you. Here. Take this. It's good luck charm I've had for years.");
			e.other:SummonItem(1061);
			e.other:Faction( 175, 10);
		end
	end
end
--END of FILE Zone:kerraridge  ID:74089 -- Thalith_Mamluk


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
