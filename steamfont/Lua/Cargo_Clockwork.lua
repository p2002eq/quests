local delivery = 0;
local bandit1id = 56178;
local bandit2id = 56179;
local bandit3id = 56180;

function event_spawn(e)
	eq.set_timer("CargoTimer",5000);
end

function event_signal(e)
	e.self:Emote("Chuga.. Chug..Chug..");
	e.self:Say("This unit requires maintenance.");
end

function event_timer(e)
	-- [FLAG: Check target: eq.get_globals()] local qglobals = eq.get_qglobals();
	if(qglobals["CargoClockwork"] == nil and (e.self:GetZ()onehour == 8)) then
		eq.set_global("CargoClockwork",1,1,"H2");
		eq.start(5); --Path to windmills
	end
	if(x == 700 and e.self:GetY() == -1783 and delivery == 1) then
		eq.stop();
		delivery = 0;
	end
	if(x == 550 and e.self:GetY() == -830) then
		e.self:Say("kachunk .. kachunk..");
		eq.signal(56066,1); --Watchman Grep
	end
	if(x == 90 and e.self:GetY() == -700 and delivery == 0) then
		delivery = 1;
		e.self:Emote("Chuga.. Chug..Chug..");
		e.self:Emote("The chugging of the Cargo Clockwork comes to a halt.");
		
		bandit1 = eq.spawn2(bandit1id,0,0,30,-700,-109,62); --Hector
		bandit1obj = eq.get_entity_list():GetMobID(bandit1);
		bandit1npc = bandit1obj:CastToNPC();
		bandit1npc:AddToHateList(npc,1);
		
		bandit2 = eq.spawn2(bandit2id,0,0,95,-732,-108,240); --Renaldo
		bandit2obj = eq.get_entity_list():GetMobID(bandit2);
		bandit2npc = bandit2obj:CastToNPC();
		bandit2npc:AddToHateList(npc,1);
		
		bandit3 = eq.spawn2(bandit3id,0,0,53,-615,-107,113); --Jerald
		bandit3obj = eq.get_entity_list():GetMobID(bandit3);
		bandit3npc = bandit3obj:CastToNPC();
		bandit3npc:AddToHateList(npc,1);
		
		e.self:Say("This is highway robbery.");
	end
	if(targetname=~/highway_bandit") then)
		e.self:WipeHateList();
	end
end

function event_death_complete(e)
	eq.stop_timer("CargoTimer");
	delivery = 0;
	eq.signal(bandit1id,0); --Hector
	eq.signal(bandit2id,0); --Renaldo
	eq.signal(bandit3id,0); --Jerald
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
