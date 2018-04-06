--Fishlord_Craiyk (216255)
--Fishlord Ring Event
--powater

local miniNamedChance = 8;	--percent chance of triggering rare per wave
local miniNamedCount = 0;
local miniNamedMaxSpawns = 15;	--set a limit for rare mobs that can spawn

local started;
local wave_timer = 30;  --in seconds
local final_boss_timer = 3 * 60 * 60 -- 3 hrs
local wave = 0;

--trash mob npc listing
local trash_mobs = {216282,		--#a_reef_anglerfish (216282)
					216283,		--#a_fierce_anglerfish (216283)
					216281,		--#a_ferocious_anglerfish (216281)
					216284};	--#a_furious_anglerfish (216284);

--rare mob listing
local rare_mobs = {	216239,		--#a_hungry_anglerfish (216239)
					216240,		--#a_stringy_anglerfish (216240)
					216241, 	--#a_wicked_anglerfish (216241)
					216242,		--#a_toughened_anglerfish (216242)
					216243,		--#a_foul_anglerfish (216243)
					216235,		--#a_dark_anglerfish (216235)
					216244,		--#a_superior_anglerfish (216244)
					216245,		--#a_prime_anglerfish (216245)
					216246};	--#a_prismatic_anglerfish (216246)


--final boss npc listing
local final_bosses = {	216247,		--#a_king_anglerfish (216247)
						216248,		--#a_master_anglerfish (216248)
						216249};	--#a_supreme_anglerfish (216249)

function event_spawn(e)
	started = false;
	wave = 0;
	miniNamedCount = 0;
end

function event_say(e)
	if e.message:findi("Hail") then 
		e.self:Say("Be like the water name. The water spirits have fortold of your coming. I am a fishlord, summoner of the [" .. eq.say_link("dwellers") .. "] of the deep.");
	elseif e.message:findi("dwellers") then 
		e.self:Say("These are great creatures that dwell in the nether reaches of this reef. For 100 platinum I will summon them forth.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local money = e.trade.platinum + (e.trade.gold / 10) + (e.trade.silver / 100) + (e.trade.copper / 1000)
	if (money ~= 100) then
		e.self:Say("I have no need for this, " .. e.other:GetName() .. ". You can have it back.")
	elseif (not started) and (item_lib.check_turn_in(e.self, e.trade, {platinum = 100})) then 
		e.self:Say("Very well, I will summon forth the creatures of the deep. They do not like being disturbed so you must protect me from harm. I am very vulnerable when summoning the dwellers of the deep. If death claims me the summoning will be finished. During the course of the summoning many powerful dwellers will appear. You must watch for them.");
		started = true;
		eq.set_timer("wave_timer", 25 * 1000);	--initial timer shorter
		eq.set_timer("FinalNamed", final_boss_timer * 1000);	
		eq.move_to(-269.7, 160.7, -355,-1,true);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function spawn_mob(npc_id,loc)	--loc also determines grid
	local spawn_locs = { [1] = {-268, 30, -362, 256}, [2] = {-296, 92, -362, 64}, [3] = {-226, 61, -362, 190}, [4] = {-208, 300, -362, 194}, [5] = {-268, 267, -362, 74}, [6] = {-247, 327, -362, 132}, [7] = {-294, 87, -362, 23}, [8] = {-241, 247, -362, 289} };
	local grid = {201,202,203,204,205,206,207,208}; 	--Fishlord_Craiyk area
	
	eq.spawn2(npc_id,grid[loc],0,unpack(spawn_locs[loc]));
end

function TableCheck(ran, tab)
	for i,v in pairs(tab) do
		if v == ran then
			return false;	--already have this value in the table - skip and roll again			
		end
	end
	return true;	-- not a duplicate value - OK to proceed
end

function select_mob(mobs)	--return random mob based on max table count
	local mob = mobs[math.random(table.getn(mobs))];
	return mob;
end	

function event_timer(e)
	if(e.timer == "wave_timer") then
		eq.stop_timer(e.timer);
		eq.set_timer("wave_timer", wave_timer * 1000);
		wave = wave + 1;
		
		--Initial event start trigger
		if wave == 1 then	
			e.self:Say("Listen oh spirits of water! I summon forth the dwellers of the deep.' He then begins to hum softly closing his eyes and seemingly settling into a deep focus. Suddenly he shouts a mystical chant saying, 'XAX XAX tomae tomae XAX podiggle podiggle XAX AZKHAZKKKY!");
		end
		
		--determine wave spawn count
		local mob_rand = math.random(1,100);
		if mob_rand <= 15 then	--15% chance
			mob_count = 4;
		elseif mob_rand <= 70 then	-- 55% chance
			mob_count = 3;
		else
			mob_count = 2;	-- 30% chance
		end
		
		spawns = {};
		local n = 1;
	
		--get random locations and add in spawns table
		while n <= mob_count do
			local loc = math.random(1,6)
			if TableCheck(loc,spawns) then
				table.insert(spawns,n, loc);			
				n = n + 1;
				spawn_mob(select_mob(trash_mobs),loc)
			end
		end
		
		--roll chance on mini named
		local rand = math.random(1,100);		
		if rand <= miniNamedChance and wave >= 5 and miniNamedCount < miniNamedMaxSpawns then
			eq.set_timer("MiniNamed", math.random(1,15) * 1000) -- 1 to 15 sec delay of named spawning
		end
	elseif(e.timer ==  "MiniNamed") then
		eq.stop_timer(e.timer);
		e.self:Say("A dweller of some power comes, prepare yourself.");
		spawn_mob(select_mob(rare_mobs),eq.ChooseRandom(7,8))
		miniNamedCount = miniNamedCount + 1;
	elseif(e.timer == "FinalNamed") then
		e.self:Say("I sense a creature of immense power has been summoned forth. My job here is finished. You all have done very well for mortals.");
		spawn_mob(select_mob(final_bosses),eq.ChooseRandom(1,6))
		eq.update_spawn_timer(369033,21600 * 1000);	--Set respawn timer to 6 hrs
		eq.depop_with_timer();
	end
end

function event_death_complete(e)
	e.self:Say("It is over. Failure is all that we have gained here.");
end
