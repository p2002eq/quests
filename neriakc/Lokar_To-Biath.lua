--Lokar_To-Biath.pl
--Red Wine (Part of Tome of Ages)

function event_say(e)
	if(e.message:findi("scribe of dal")) then
		e.self:Say("The Scribes of Dal? All of them are long since [dead].. or at least most would say that.");
	elseif(e.message:findi("dead")) then
		e.self:Say("Perhaps, perhaps not. I cannot remember, but perhaps Innoruuk would help me remember should you tithe him a bottle of red wine from the Blind Fish.");
	elseif(e.message:findi("vow")) then
		e.self:Say("Break the vow? She might. Were you to tithe 70 gold to your god, Innoruuk, he might aid you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13030})) then--Red Wine
		e.self:Say("Ah, yes, let me pray to our god.. Yes, Innoruuk has given me wisdom. A Scribe of Dal still exists, disguised as a barkeep in the Blind Fish. This information will not help you though, for she has sworn a [vow] of silence and will not speak of the Dal.");
		e.other:Faction(87, 10);--Dreadguard Inner
		e.other:Faction(88, 10);--Dreadguard Outer
		e.other:Faction(69, 10);--Dark Bargainers
		e.other:QuestReward(e.self,0,0,0,0,0,2000);
	elseif(item_lib.check_turn_in(e.trade, {platinum = 7})) then
		e.self:Say("Take this note to the Scribe of Dal, and perhaps she will break her vow.");
		e.other:Faction(87, 10);--Dreadguard Inner
		e.other:Faction(88, 10);--Dreadguard Outer
		e.other:Faction(69, 10);--Dark Bargainers
		e.other:QuestReward(e.self,0,0,0,0,18200); --a note (renounce the D'al, Text: TomeOfAges1)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	e.self:Say("The death of a Dark Bargainer never goes unnoticed!");
end

--END of FILE Zone:neriakc  ID:42037 -- Lokar_To`Biath
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
