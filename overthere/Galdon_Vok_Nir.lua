function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Please do not harm me.  I am not the one who brought the outsiders to our land.  I am innocent and deserve to return to my people.");
	elseif(e.message:findi("What will you trade for the skull of Di Nozok?") and shmskullquest >= 7) then
		e.self:Say("Ah, doing the bidding of the council are you?  I will only give up the skull for the 2 Ton Warrior Totems held by the goblins of nurga and frogloks of the swamp of no sarrow, the Canopie of Di Nozok held by the goblin Overseer Dlubish, and 400 gold pieces.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Turn in the 2 totems and the canopie of Di Nozok and 400 gold pieces
	if(item_lib.check_turn_in(e.trade, {item1 = 12743, item2 = 12744, item3 = 12742, gold == 400}) and tonumber(qglobals.shmskullquest) > 6) then
		e.self:Say("A deal is a deal I suppose, many have attempt to do what I have asked, but fallen to the Overseer.");
		e.other:QuestReward(e.self,0,0,0,0,12740); --Give the player the Iksar Skull
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
