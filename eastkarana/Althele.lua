-- fleshbound tome
local count = 0;
local started = 0;

function event_spawn(e)
	count = 0;
	started = 0;
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. Beautiful is what I would call such a day normally but lately? I sense that something is [" .. eq.say_link("out of balance") .. "].'");
	elseif(e.message:findi("balance")) then
		e.self:Say("I sense something foreboding, young one, but you should think nothing of it. The sons and daughters of nature will be able to deal with this problem.");
	end
end

function event_trade(e)
	local item_lib = require("items");
		if(started == 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 20448})) then -- Worn Dark Metal Coin
			started = 1;
			e.self:Emote("looks at the coin and nods gravely at you as she slips it into a fold of her clothing. 'I see. The story of this coin speaks much to me as do the words you have given me. Telin sent word that you would arrive. The tidings you bring are ill indeed. Here, take this amulet and find Sionae. She is nearby. We will speak more on this matter when all are present.'");
			e.other:SummonItem(20450); -- Braided Grass Amulet
			eq.spawn2(15178,0,0,-1595,-2595,4,254);	-- Sionae
			-- extra safety. If these guys aren't up... somehow... they'll get repopped
			if (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(15042)) then eq.get_entity_list():GetSpawnByID(329482):Repop(); end -- Fang
			if (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(15043)) then eq.get_entity_list():GetSpawnByID(329483):Repop(); end -- Tholris

		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20452})) then -- Fleshbound Tome
			e.self:Emote("hands the book to Tholris who reads through it with lines of concern etched on his face, then whispers into her ear. 'Dire news, indeed. This cannot be allowed. I must keep this book but you, " .. e.other:GetName() .. ", must not allow Innoruuk to seed the land with his hatred and filth. You have only just begun your quest. The path you are guided upon will be difficult, if not impossible, but someone must finish it. Please, take this, read of it, follow its instructions. Tunare bless your path and Karana watch over you.");
			e.other:QuestReward(e.self,0,0,0,0,18959,100000); -- Earth Stained Note
			e.self:Say("We cannot speak again. Our circle is now known and must seek sanctuary. In case this note were to fall into others' hands. I cannot tell you plainly the next steps of your task. All I can say is to seek she who walks the path of the mother, she who walks the lands in service to her kin. Give her this note and she will know.");
			reset_Event();
		end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	if(e.signal == 1) then
		count = count + 1;
		if (count == 3) then
			e.self:Say("Great mother of life and father of sky, growth and spirit, Tunare and Karana. Innoruuk once again schemes and we have failed in our duties to protect our land. We give our powers in sacrifice for your help. Heed our call and send us your wisdom.");
			eq.set_timer("emotes",20000); -- 20 Sec
			eq.set_timer("attack",60000); -- 60 Sec
			eq.set_timer("depop",900000); -- 15 Minutes
		end
	end
end

function event_timer(e)
	if(e.timer == "prep") then -- gives the last druid, teloa, time to walk to the gathering
	elseif(e.timer == "emotes") then
		eq.stop_timer("emotes");
		eq.signal(15178,99,0); -- Sionae
		eq.signal(15167,99,3000); -- Nuien
		eq.signal(15170,99,6000); -- Teloa
		eq.signal(15043,99,9000); -- Tholris
	elseif(e.timer == "attack") then -- dark elves start to make their way to the gathering
		eq.stop_timer("attack");
		e.self:Emote("snaps her head towards you. 'Innoruuk's brood is upon us. Go, find the spawn of hatred before they reach this point and destroy them!");
		local althele = eq.get_entity_list():GetMobByNpcTypeID(15044); -- Althele
		eq.spawn2(15153,0,0,-996,-1529,354,260):AddToHateList(althele, 1); -- Dark Elf Corruptor
		eq.spawn2(15150,0,0,-1090,-1529,355.4,260):AddToHateList(althele, 1); -- Dark Elf Reaver
		eq.spawn2(15150,0,0,-1063,-1490,367.5,260):AddToHateList(althele, 1); -- Dark Elf Reaver
	elseif(e.timer == "depop") then -- something might have gone wrong resetting the druids after 10 minutes
		eq.stop_timer("depop");
		reset_Event();
	end
end

function event_death_complete(e)
	reset_Event();
end

function reset_Event() -- depops everyone, letting the three that spawn in the wild repop on their own timers.
	eq.depop(15178); -- despawn Sionae
	eq.depop(15167); -- despawn Nuien
	eq.depop(15170); -- despawn Teloa
	eq.depop_with_timer(15043);	-- despawn Tholris
	eq.depop_with_timer(15042);	-- despawn Fang
	eq.depop_with_timer(15044); -- despawn Althele
	started = 0;
end
