function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Rodcet Nife welcomes you into our noble camp.  I am the keeper of the [Vambraces of Ro].");
	elseif(e.message:findi("vambraces of ro")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("The mold will be offered to you when you have performed a task for the Temple of Life.  The oceans near our home are host to a plague..  the plague sharks!!  They have been infected with a deadly malady which has been turning up in the Qeynos Hills.  Kill the sharks and bring me two of their rotten shark portions as proof.");
		else
			e.self:Say("Foolish person!! The word is out amongst the followers of the Prime Healer not to trust you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12310, item2 = 12310}) and e.other:GetFaction(e.self) < 5) then
		e.self:Say("You now own a mold for the Vambracers of Ro.  Go and ask Thomas of [Lord Searfire] for the final component.");
		e.other:Faction(183,1); --Knights of Thunder
		e.other:Faction(21,-1); -- Bloodsabers
		e.other:Faction(257,1); -- Priests of Life
		e.other:Faction(135,1); -- Guards of Qeynos
		e.other:Faction(9,1); -- Antonius Bayle
		e.other:QuestReward(e.self,0,0,0,0,12300,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
	
--END of FILE Zone:rathemtn  ID:50114 -- Marianna
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------