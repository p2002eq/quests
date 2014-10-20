-- a Sarnak Spy, Frontier Mountains
-- Second part of the chardok quest, initiated by Herald Telcha
-- Regal Band of Bathezid
-- global RegalBandBathezid, needed to be sure players won't jump to the last part of the quest
--   at 1 : you gave the Signet of Service to the goblin traitor

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["RegalBandBathezid"] == "1") then -- we handed the Signet of Service yet
		if(e.message:findi("proceed")) then
			e.self:Say("Good, here then is what you must do. It's pretty simple actually and even one such as you should have no troubles. Skargus has been trading in slaves with the Iksar. He has a courier there visits the outskirts of Cabilis and sends weekly reports back to Droga. If we could get that report, Skargus would be finished. Will you go to Cabilis and [get the report]?");
		end
		if(e.message:findi("get the report")) then
			e.self:Emote("scowls at you, clearly unimpressed by your efforts. 'Of course you'll go get the report fool, but do you think that the courier will just give to you?' The sarnak shakes his head sadly. 'Okay, look. Go into Droga and try to get a warlord's insignia off one of the goblins in there. Take this forged note to the courier I've written out, along with the insignia to Warslik's woods and give it to the courier. With luck, he'll believe you work for Skargus and give you the report. If you get the report, find Gragbar and give it to him.'");
			e.other:SummonItem(6471); -- 6471  Forged Note to Courier
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 6472})) then -- Traitor's note, from goblin traitor
		e.self:Emote("reads the note slowly, turning it around in his claws a few times before completing it. 'I see you spoke with that half-wit goblin! I hate hate hate it when he sends me a note, his penmanship is almost illegible. I hope he informed you of the situation, he's really not the most dependable agent of Di'zok, and sadly his note doesn't really make much sense. No matter though, are you ready to [proceed] in this mission?'");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
