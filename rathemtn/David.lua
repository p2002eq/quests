function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I, the keeper of the [Bracers of Ro],  welcome you.  Come and rest within our camp.  You have nothing to fear while such righteous might is gathered.");
	elseif(e.message:findi("bracers of ro")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("When you can swim the waters of Rathe and return two goblin nets from the elusive goblin net masters. then you will be rewarded the bracer mold.");
		else
			e.self:Say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
		end
	end
end
	
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12311, item2 = 12311}) and e.other:GetFaction(e.self) < 5) then
		e.self:Say("You have done well. Take the mold for the bracer.  Go forth to speak with Thomas of [Lord Searfire].  Then all components shall be known.");
		e.other:SummonItem(12301);
		e.other:Faction(45,1);
		e.other:Faction(79,1);
		e.other:Faction(143,-1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
		
--END of FILE Zone:rathemtn  ID:50108 -- David
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------