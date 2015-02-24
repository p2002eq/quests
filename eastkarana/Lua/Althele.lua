-- --20448 : Althele to start corruptor/reaver spawns for fleshbound tome
local depop1;
local depop2;
local depop3;
local depop4;
local depop5;
local entid1;
local entid2;
local entid3;
local mob1;
local mob2;
local mob3;
local start;
local moving;
local depopnpc1;
local depopnpc2;
local depopnpc3;
local depopnpc4;
local depopnpc5;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. Beautiful is what I would call such a day normally but lately?");
	elseif(e.message:findi("your eyes")) then
		e.self:Say("Yes. I cannot see any longer, my sight long since lost in the march of years. By the blessings of Tunare and Karana, though, I still make myself useful.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20448})) then
		e.self:Emote("looks at the coin and nods gravely at you as she slips it into a fold of her clothing. 'I see. The story of this coin speaks much to me as do the words you have given me. Telin sent word that you would arrive. The tidings you bring are ill indeed. Here, take this amulet and find Sionae. She is nearby. We will speak more on this matter when all are present.'");
		e.other:SummonItem(20450);
		eq.spawn2(15178,0,0,-1595,-2595,3.2,127); --spawn sionae

	elseif(item_lib.check_turn_in(e.trade, {item1 = 20452})) then
		e.self:Emote("hands the book to Tholris who reads through it with lines of concern etched on his face, then whispers into her ear. 'Dire news, indeed. This cannot be allowed. I must keep this book but you, " .. e.other:GetName() .. ", must not allow Innoruuk to seed the land with his hatred and filth. You have only just begun your quest. The path you are guided upon will be difficult, if not impossible, but someone must finish it. Please, take this, read of it, follow its instructions. Tunare bless your path and Karana watch over you.");
		e.other:AddEXP(100000);
		e.other:SummonItem(18959);
		depop1 = eq.get_entity_list():GetMobByNpcTypeID(15178); --despawn the druids
		depop2 = eq.get_entity_list():GetMobByNpcTypeID(15167);
		depop3 = eq.get_entity_list():GetMobByNpcTypeID(15170);
		depop4 = eq.get_entity_list():GetMobByNpcTypeID(15043);
		depop5 = eq.get_entity_list():GetMobByNpcTypeID(15042);

		if(depop1) then
			depopnpc1 = depop1:CastToNPC();
			depopnpc1:Depop();
		end
		if(depop2) then
			depopnpc2 = depop2:CastToNPC();
			depopnpc2:Depop();
		end
		if(depop3) then
			depopnpc3 = depop3:CastToNPC();
			depopnpc3:Depop();
		end
		if(depop4) then
			depopnpc4 = depop4:CastToNPC();
			depopnpc4:Depop();
		end
		if(depop5) then
			depopnpc5 = depop5:CastToNPC();
			depopnpc5:Depop();
		end
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 15178) then
		start = eq.get_entity_list():GetMobByNpcTypeID(15178);
		moving = start:CastToNPC();
		moving:SignalNPC(1);
	elseif(e.signal == 15167) then
		start = eq.get_entity_list():GetMobByNpcTypeID(15167);
		moving = start:CastToNPC();
		moving:SignalNPC(1);
	else
		eq.set_timer("prep",90000);
		eq.set_timer("attack",120000);
		eq.set_timer("depop",600000);
		start = eq.get_entity_list():GetMobByNpcTypeID(15170);
		moving = start:CastToNPC();
		moving:SignalNPC(1);
	end
end

function event_timer(e)
	if(e.timer == "prep") then -- gives the last druid, teloa, time to walk to the gathering
		eq.stop_timer("prep");
		e.self:Say("Great mother of life and father of sky, growth and spirit, Tunare and Karana. Innoruuk once again schemes and we have failed in our duties to protect our land. We give our powers in sacrifice for your help. Heed our call and send us your wisdom.");
		eq.signal(15178,99,3);
		eq.signal(15167,99,6);
		eq.signal(15170,99,9);
		eq.signal(15043,99,12);
	elseif(e.timer == "attack") then --dark elves start to make their way to the gathering
		eq.stop_timer("attack");
		e.self:Emote("snaps her head towards you. 'Innoruuk's brood is upon us. Go, find the spawn of hatred before they reach this point and destroy them!");
		entid1 = eq.spawn2(15153,0,0,-996,-1529,354,130); --corruptor
		entid2 = eq.spawn2(15150,0,0,-1090,-1529,355.4,130); --reaver
		entid3 = eq.spawn2(15150,0,0,-1063,-1490,367.5,130); --reaver
		mob1 = eq.get_entity_list():GetMobID(entid1);
		mob2 = eq.get_entity_list():GetMobID(entid2);
		mob3 = eq.get_entity_list():GetMobID(entid3);
		local mob1attack = mob1:CastToNPC();
		local mob2attack = mob2:CastToNPC();
		local mob3attack = mob3:CastToNPC();
		mob1attack:AddToHateList(npc, 1);
		mob2attack:AddToHateList(npc, 1);
		mob3attack:AddToHateList(npc, 1);
	elseif(e.timer == "depop") then --something might have gone wrong resetting the druids after 10 minutes
		eq.stop_timer("depop");
		depop1 = eq.get_entity_list():GetMobByNpcTypeID(15178);
		depop2 = eq.get_entity_list():GetMobByNpcTypeID(15167);
		depop3 = eq.get_entity_list():GetMobByNpcTypeID(15170);
		if(depop1) then
			depopnpc1 = depop1:CastToNPC();
			depopnpc1:Depop();
		end
		if(depop2) then
			depopnpc2 = depop2:CastToNPC();
			depopnpc2:Depop();
		end
		if(depop3) then
			depopnpc3 = depop3:CastToNPC();
			depopnpc3:Depop();
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
