function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Love and passion to you. my friend.  Seek you the [Gauntlets of Ro]?  If not. then I offer you the safety of this camp.");
	elseif(e.message:findi("gauntlets of ro")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("I will give you the mold. but first you will complete a task in the name of Erollisi Marr.  My fellow Sentry. Alechin. was bitten by a wolf while he journeyed to Qeynos.  He now turns into a werewolf at night. forced to kill innocent travelers.  Go toward Qeynos.  Release him from life and his curse and return his locket to me.");
		else
			e.self:Say("Erollisi would not approve of our alliance. not yet at least.  Go to Freeport and serve the Temple of Marr.  When you can ask Gygus Remnara if you are an [honored member] and have him answer yes. then we can join forces.");
		end
	end
end
	
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12312}) and e.other:GetFaction(e.self) < 5) then
		e.self:Say("Thank you my friend.  It is good to see him free at last.  I shall miss him.  Here now is the mold of gauntlets as promised. Go and speak with Thomas for information about [Lord Searfire].");
		e.other:Faction(184,1); --Knights of Truth
		e.other:Faction(105,-1); --Freeport Militia
		e.other:Faction(258,1); --Priests of Marr
		e.other:QuestReward(e.self,0,0,0,0,12302,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50111 -- Sentry_Joanna
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------