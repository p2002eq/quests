--Noxhil_V-Sek.pl
--Fire Beetle Eyes/Mammoth Tusks (Kerran Fire Beetle Eyes)
--There is alot of confusion about the fire beetle eyes/kerran fire beetle eyes.
--It is my thought that people are mixing the two quests up, and imagining a
--third quest, when really there are just two.  It's not possible to turn
--in 5 items to a quest giver at once, the person who said 4 beetle eyes
--and 1 mammoth tusk was making it up.  I don't know why.  The turn ins
--are a combined box of fire beetle eyes (either sort of beetle eye works)
--for the first quest and 2 mammoth tusks (called bull elephant tusks in the
--dialog, but a well known never fixed screw up on VI's part) for the second.
--I did this quest on live numerous times, though it has been years.  It was
--excellent xp for a new character. -Kilelen

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. "!  We of the Dead are proud to have you among us.  Your lineage is well known.  Still, you must learn to claw your way to the upper echelon.  There are many [menial tasks] to be performed before you can truly be inducted as a member.");
	end
	if(e.message:findi("menial tasks")) then
		e.self:Say("You cannot avoid the toil of peons. We have all spent our time in the lower ranks. There are duties such as [collecting beetle eyes].");
	end
	if(e.message:findi("collecting beetle eyes")) then
		e.self:Say("Take this chest.  It has been fitted with a mold designed to hold ten beetle eyes.  We require them for further experiments.  Do not return until you fill the chest.");
		e.other:SummonItem(17930);--Empty Box
	end
	if(e.message:findi("other components")) then
		e.self:Say("The other components that are required are two Bull Elephant tusks.  Mammoth tusks would do as well.");--text made up
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13389})) then--Box of Beetle Eyes
		e.self:Say("Fantastic work, my child! We shall store these for further experiments. Take this as extra payment for a fine job. You have done so well I believe you can assist in obtaining two [other components].");
		e.other:Faction(322, 5); --The Dead
		e.other:Faction(268, 5); --Queen Cristanos Thex
		e.other:Faction(177,-10); --King Naythox Thex
		e.other:Faction(170,-10); --Keepers of Art
		e.other:Faction(91,-10); --Eldritch Collective
		e.other:Faction(260,-10); --Primordial Malice
		e.other:AddEXP(17150);--5% level 8 experience, comments on alla's suggest the reward is this much.
		e.other:GiveCash(0,16,0,0);--16 silver
		e.other:SummonItem(eq.ChooseRandom(13021, 13022));--Neriak Necter or Rotgrub Rye
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 10124, item2 = 10124})) then--Mammoth Tusks
		e.self:Say("These will do.  Thank you, child.");--text made up
		e.other:Faction(322, 5); --The Dead
		e.other:Faction(268, 5); --Queen Cristanos Thex
		e.other:Faction(177,-10); --King Naythox Thex
		e.other:Faction(170,-10); --Keepers of Art
		e.other:Faction(91,-10); --Eldritch Collective
		e.other:Faction(260,-10); --Primordial Malice
		e.other:AddEXP(17150);--5% level 8 experience, comments on alla's suggest the reward is this much.
		--Lesser summon corpse was not in the game when I played, and not one of the rewards.
		--However, it is a level 12 necro spell now, and I have no clue if it was added to the
		--list of rewards on live, so I'm adding it for completeness. -Kilelen
		e.other:SummonItem(eq.ChooseRandom(15035, 15362, 15445, 28216));--Random level 12 Necromancer spell (Bind Affinity, Convoke Shadow, Lifedraw, Lesser Summon Corpse
	end
	item_lib.return_items(e.self, e.other, e.trade)
	end--END of FILE Zone:neriakc  ID:42042 -- Noxhil_V`Sek

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
