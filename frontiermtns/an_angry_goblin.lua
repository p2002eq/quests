-- an angry goblin, Frontier Mountains
-- Second part of the chardok quest, initiated by Herald Telcha
-- Regal Band of Bathezid
-- global RegalBandBathezid, needed to be sure players won't jump to the last part of the quest
--   at 1 : you gave the Signet of Service to the goblin traitor

function event_say(e)
	if(qglobals["RegalBandBathezid"] == "1") then -- we handed the Signet of Service yet
		-- the goblin won't talk to the player unless we did the beginning of the quest
		if(e.message:findi("hail")) then
			e.self:Say("'Go away, my life is miserable enough!' The angry goblin looks at you more closely, his rage fading for a moment. 'Are you here with the evidence I was promised? Give it to me if you have it.'");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(qglobals["RegalBandBathezid"] == "1") then -- we handed the Signet of Service yet
		if(item_lib.check_turn_in(e.trade, {item1 = 6474})) then -- receive Report to Skargus from Shady Goblin
			e.self:Emote("howls in triumph! 'This is just what I needed! Skargus is mine now, wait until he finds out, just wait! His death is close at hand. Follow me and I'll take you to Skargus's chamber, you can wait there while I take this report to the chief!'");
			e.self:Shout("I have you now Skargus, you traitor! Even now I'm taking this report of slave-trading to the chief! Your days here are at an end!");
			eq.depop_with_timer();
			eq.unique_spawn(92185,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ());
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
