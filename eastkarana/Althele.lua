-- 15044 - Althele at #loc -1592, -3657, -17 - to start corruptor/reaver spawns for fleshbound tome

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. Beautiful is what I would call such a day normally but lately? I sense that something is [out of balance].'");
	elseif(e.message:findi("balance")) then
		e.self:Say("I sense something foreboding, young one, but you should think nothing of it. The sons and daughters of nature will be able to deal with this problem.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20448})) then
		e.self:Emote("looks at the coin and nods gravely at you as she slips it into a fold of her clothing. 'I see. The story of this coin speaks much to me as do the words you have given me. Telin sent word that you would arrive. The tidings you bring are ill indeed. Here, take this amulet and find Sionae. She is nearby. We will speak more on this matter when all are present.'");
		e.other:SummonItem(20450);								-- Braided Grass Amulet
		eq.spawn2(15178,0,0,-1595,-2595,4,127);					-- spawn sionae at #loc -1595, -2595, 4				-- north of Althele 1063 units away

	elseif(item_lib.check_turn_in(e.trade, {item1 = 20452})) then
		e.self:Emote("hands the book to Tholris who reads through it with lines of concern etched on his face, then whispers into her ear. 'Dire news, indeed. This cannot be allowed. I must keep this book but you, " .. e.other:GetName() .. ", must not allow Innoruuk to seed the land with his hatred and filth. You have only just begun your quest. The path you are guided upon will be difficult, if not impossible, but someone must finish it. Please, take this, read of it, follow its instructions. Tunare bless your path and Karana watch over you.");
		e.other:QuestReward(e.self,0,0,0,0,18959,100000); 		-- Earth Stained Note
		eq.get_entity_list():GetMobByNpcTypeID(15178):Depop();	-- despawn Sionae		at #loc -1595, -2595, 4		-- north of Althele 1063 units away
		eq.get_entity_list():GetMobByNpcTypeID(15167):Depop();	-- despawn Nuien
		eq.get_entity_list():GetMobByNpcTypeID(15170):Depop();	-- despawn Teloa
		eq.get_entity_list():GetMobByNpcTypeID(15043):Depop();	-- despawn Tholris		at #loc -1597, -3661, -17	-- next to Althele
		eq.get_entity_list():GetMobByNpcTypeID(15042):Depop();	-- despawn Fang			at #loc -1585, -3657, -18	-- next to Althele
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 3) then
		eq.get_entity_list():GetMobByNpcTypeID(15178):CastToNPC():SignalNPC(1);
	elseif(e.signal == 6) then
		eq.get_entity_list():GetMobByNpcTypeID(15167):CastToNPC():SignalNPC(1);
	else
		eq.set_timer("prep",90000);
		eq.set_timer("attack",120000);
		eq.set_timer("depop",600000);
		eq.get_entity_list():GetMobByNpcTypeID(15170):CastToNPC():SignalNPC(1);
	end
end

function event_timer(e)
	if(e.timer == "prep") then			-- gives the last druid, teloa, time to walk to the gathering
		eq.stop_timer("prep");
		e.self:Say("Great mother of life and father of sky, growth and spirit, Tunare and Karana. Innoruuk once again schemes and we have failed in our duties to protect our land. We give our powers in sacrifice for your help. Heed our call and send us your wisdom.");
		eq.signal(15178,99,3);
		eq.signal(15167,99,6);
		eq.signal(15170,99,9);
		eq.signal(15043,99,12);
	elseif(e.timer == "attack") then	--dark elves start to make their way to the gathering
		eq.stop_timer("attack");
		e.self:Emote("snaps her head towards you. 'Innoruuk's brood is upon us. Go, find the spawn of hatred before they reach this point and destroy them!");
		eq.get_entity_list():GetMobID(eq.spawn2(15153,0,0,-996,-1529,354,130)):CastToNPC():AddToHateList(npc, 1);		--corruptor
		eq.get_entity_list():GetMobID(eq.spawn2(15150,0,0,-1090,-1529,355.4,130)):CastToNPC():AddToHateList(npc, 1);	--reaver
		eq.get_entity_list():GetMobID(eq.spawn2(15150,0,0,-1063,-1490,367.5,130)):CastToNPC():AddToHateList(npc, 1);	--reaver
	elseif(e.timer == "depop") then		--something might have gone wrong resetting the druids after 10 minutes
		eq.stop_timer("depop");
		eq.get_entity_list():GetMobByNpcTypeID(15178):CastToNPC():Depop();
		eq.get_entity_list():GetMobByNpcTypeID(15167):CastToNPC():Depop();
		eq.get_entity_list():GetMobByNpcTypeID(15170):CastToNPC():Depop();
	end
end

-- rewrote by Speedz
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
