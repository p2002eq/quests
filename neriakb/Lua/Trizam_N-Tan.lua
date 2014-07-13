function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("And who do you think you are? To step into the Cauldron of Hate one should have the black soul of a warrior. For one to speak with Trizam he should have good reason. Perhaps you return with tales of [deathfist] agendas. If so, then you're a year too late.");
	end
	if(e.message:findi("deathfist")) then
		-- Orc Pawn Picks
		e.self:Say("Have you been spending day and night at the Malden's Fancy?!! The Deathfist Orcs in the Commonlands are up to something. As the inept humans in Freeport hunt down the warrior orcs, the pawns run about on some secret mission. I have been appointed by King Nathox to attend to this matter and hire young warriors who wish to [collect] pawn kills.");
	end
	if(e.message:findi("collect")) then
		-- Orc Pawn Picks
		e.self:Say("Yes, You will. You need not know the reason why. I command you by order of King Naythox Thex to venture forth to the Commonlands and slay all the orc pawns you see. Return with four pawn picks and maybe I shall even reward you. Leave at once or you shall find yourself hanging from the Hooks of Innoruuk!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- Handin: Orc Pawn Pick
	if(item_lib.check_turn_in(e.trade, {item1 = 13885, item2 = 13885, item3 = 13885, item4 = 13885})) then
		-- Orc Pawn Picks [END]
		e.self:Say("As instructed, I shaw reward your good deed. But I choose to reward you with provisions from the pantries of Neriak. They shall keep you strong.");
		e.other:Faction(155,5);   -- +Indigo Brotherhood
		e.other:Faction(92,-5);   -- -Emerald Warriors
		e.other:Faction(311,-5);  -- -Steel Warriors
		e.other:AddEXP(25);
		e.other:Ding();
		-- Summon: Neriak Nectar
		e.other:SummonItem(13021, 2);
	end
	--do all other handins first with plugin, then let it do disciplines
	
	item_lib.return_items(e.self, e.other, e.trade)
end


--EOF

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
