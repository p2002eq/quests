function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s eyes flare with fury as her beautiful features twist into a snarl of hatred that echoes her hissing voice, 'How dare you address me in such a fashion?!  I am the leader of the Indigo Brotherhood!!  You are lucky I do not strike you down where you stand!  You shall address me as 'Mistress.'  Many warriors have died so that I might gain this title.'");
	end
	if(e.message:findi("mistress")) then
		e.self:Emote("maintains her imposing posture as she indifferently eyes " .. e.other:GetName() .. ", 'You stand now in the Cauldron of Hate -- the Indigo Brotherhood. We are an organization of Neriak's finest warriors whom remain dedicated to Neriak, the Dark Father, and our founder -- his majesty, King Naythox Thex. I am Seloxia Punox, second to only his majesty in command of the Brotherhood. From the Cauldron of Hate, we maintain the protection of the city both within our city walls and beyond in the forest of Nektulos. Perhaps you would wish to prove yourself worthy of our ranks and perform a [little test] of your skills and dedication?'");
	end
	if(e.message:findi("little test")) then
		e.self:Say("My little test is this. I desire a report from Ambassador K'Rynn in the Ogre city of Oggok. You shall run to him. I will not wait until you raise your fighting skills. Combat is not your test. Overcoming the odds is. Fast agile warriors are we. We desire nothing less. Will you [venture to Oggok]?");
	end
	if(e.message:findi("venture to oggok")) then
		e.self:Say("Then you will go at once. Find your own way. Deliver this note to Ambassador K'Rynn and he shall give you the note to return to me. Do not stop to practice your skills. I offer this test to only the young warriors. If you die, then so be it. We need not inferior warriors. Now go!!");
		e.other:SummonItem(18842); -- Sealed Letter (Letter To Krynn)
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18751})) then
		e.self:Say("I shall reserve any official welcoming until you have proven yourself a suitable member for the Indigo Brotherhood. That proof shall be obtained by your progression in your training. See Yegek B'Larin, one of my most trusted trainers in the Brotherhood and obey his command carefully if you wish to succeed as a member of the Brotherhood.");
		e.other:SummonItem(13580); --Old Training Tunic*
		e.other:Ding();
		e.other:Faction(155,100); --Indigo Brotherhood
		e.other:Faction(92,-15); --Emerald Warriors
		e.other:Faction(311,-5); --Steel Warriors
		e.other:Faction(260,-200); --Primordial Malice
		e.other:AddEXP(100);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 18843})) then   -- Sealed Letter (Letter To Seloxia)
		e.self:Say("Very fine work my young warrior. You may soon be ready to become a Teir'Dal courier. For now we shall reward you. This will assist you in further service to the Indigo Brotherhood and King Naythox Thex.");
		e.other:SummonItem(eq.ChooseRandom(5026,1001,1002,1003,1004,1005,5014,5015,5021,5027)); -- Random minor items
		e.other:Faction(155, 10); --Indigo Brotherhood
		e.other:Faction(92,-5); --Emerald Warriors
		e.other:Faction(311,-5); --Steel Warriors
		e.other:Faction(260,-5); --Primordial Malice
		e.other:Ding();
		e.other:AddEXP("250");
	end
	--do all other handins first with plugin, then let it do disciplines
	
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41066 -- Seloxia_Punox

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
