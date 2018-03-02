--#Archmage Gorraferg Event (Inner AC) #154104

local started = false;
local wave = 0;
local wave_timer = 15;   --initial wave timer
local spawns = { {228,11,-7,192}, {238,11,-7,192}, {248,11,-7,192},{258,11,-7,192}, {228,-21,-7,192}, {238,-21,-7,192}, {248,-21,-7,192}, {258,-21,-7,192}, {225,-7,-7,192}, {260,-7,-7,192} };
local warder = 154377;  -- grimling warder
				
local grimlings = { 154381, --a_grimling_alchemist
					154382, --a_grimling_battlepriest 
					154383, --a_grimling_cleanser
					154384, --a_grimling_corpsemaster
					154385, --a_grimling_deathdealer 
					154386, --a_grimling_possessor
					154387} --a_grimling_skullsplinterer

local AM =  154388 --Archmage_Gorraferg

function event_spawn(e)
	started = false;
end

function event_signal(e)
	if e.signal == 1 then		--signal from Archmage death
		EventReset();
		eq.stop_all_timers();
	elseif e.signal == 99 then
		wave = 0;
		wave_timer = 15;
		eq.set_timer("main",wave_timer * 1000);  -- 15 seconds for initial wave
		started = true;
		eq.spawn2(warder,0,0,208,-84,-7,510.0);  -- spawns grimling warder
	end
end

function WaveShout(wav)
	AM = eq.get_entity_list():GetMobByNpcTypeID(154103);
	if wav == 1 then
		AM:Shout("By the power of the master, I summon forth his minions to cleanse the realm of intruders...");
	elseif wav == 2 then
		AM:Shout("You tresspassers are still here? You will not interrupt my work! I will summon a legion of our kind if needed!");
	elseif wav == 3 then
		AM:Shout("Master! More of our people are needed to cleanse the sacred palace. I beg, make the intruders pay with their lives!");
	elseif wav == 4 then
		AM:Shout("You fools! You do not understand! Your efforts here are fruitless. You will die and your remains will live again to serve us!");
	elseif wav == 5 then
		AM:Shout("Master! The intruders persist! I beg, teach them humility through defeat!");
	elseif wav == 6 then
		AM:Shout("Your petty resistance will only make it worse for you in the end. Leave, or die!!");
	elseif wav == 7 then
		AM:Shout("Master, they are weakening! I beg, finish them!");
	elseif wav == 8 then
		AM:Shout("Master, the intruders persist! I beg, give me the power to overcome them. May their flesh burn on your sacred altar!");
	end
end

function event_timer(e)
	if e.timer == "main" then
		wave_timer = process_wave();
		eq.set_timer("main",wave_timer * 1000);
		WaveShout(wave);
	end
end

function EventReset()
	started = false;
	wave = 0;
	eq.signal(warder,2)  --depop warder
end

function process_wave()
	wave = wave + 1;
	
	if wave <= 2 then
		spawn_mob(grimlings,spawns);
		return 8*6;  -- 8 ticks
	elseif wave == 3 then
		spawn_mob(grimlings,spawns);
		return 18*6;  -- 18 ticks
	elseif wave < 8 then
		spawn_mob(grimlings,spawns);
		return 8*6;  -- 8 ticks
	elseif wave == 8 then
		eq.stop_timer("main");
		eq.signal(154103,1,12*1000);  --2 ticks to spawn AM
		return -1;
	end
end

function spawn_mob(NPCID, loc)
	s = math.random(7,10);
	for n = 1, s do 
	eq.spawn2(NPCID[math.random(1,7)],0,0,unpack(loc[n]));  
	end
end

