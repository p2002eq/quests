-- WDTrpMn (NPCID: 154130)
--Khati Sha Event
-- Created by Gonner
-- Converted to .lua by Speedz
-- Modified by Daeron

local event_counter;
local jammer_locs_A = { [1] = {321,-258,-7,28}, [2] = {363,-259,-7,228}, [3] = {344,-207,-7,127} }; -- Jail Cell A (Kama)
local jammer_locs_B = { [1] = {322,-294,-7,102}, [2] = {364,-296,-7,154}, [3] = {344,-347,-7,256} }; -- Jail Cell B (Andro)
local life_seal;
local death_seal;
local fail_timer = 10 --default value (in minutes)

function event_spawn(e)
	eq.unique_spawn(154053,0,0,344, -323.49, -7.94,256); -- Spiritist_Andro_Shimi
	eq.unique_spawn(154052,0,0,344, -232.48, -7.94,256); -- Spiritist_Kama_Resan 
	event_counter = 0;
	life_seal = false;
	death_seal = false;
end

function event_signal(e)	
	if (e.signal == 1) then
			SpawnJammers(3,jammer_locs_A);	--initial wave always 3 mobs  
			SpawnJammers(3,jammer_locs_B);	--initial wave always 3 mobs  
			eq.set_timer("jammers", 60 * 1000); -- 90 second jammer respawn time
			eq.set_timer("fail",fail_timer*60*1000)
			eq.unique_spawn(154154,0,0,315,-277,-6,260);  -- Ward of Life
			eq.unique_spawn(154155,0,0,403,-219,37.06,130); -- Ward of death	
			eq.signal(154404,99); --signals Witchdoctor event spawner to temporarily depop
			
	elseif(e.signal == 2) then 		--signaled upon Warder of Life activation
		eq.stop_timer("jammers");
	elseif(e.signal == 3) then -- Succeed
		--eq.spawn2(154145,0,0,940.00,-610.00,-41.00,0); -- Spawn Kahti Sha   debug  (already spawned on P2002)
		eq.signal(154145,100); -- Signal Khati Sha to Shout
		eq.signal(154129,5,20); -- depops grimlings
		eq.signal(154151,6,10); -- emotes A Spiritual Arcanist V1
		eq.signal(154151,7,500); -- depops A Spiritual Arcanist V1
		eq.depop();
	elseif(e.signal == 4) then -- Fail
		e.self:Shout("FAIL - signal 4")
		eq.signal(154129,5,20); -- depops diseased grimlings
		eq.signal(154152,7,500); -- depops Spiritist_Kama_Resan
		eq.spawn2(154153,0,0,539.10,-374.98,-24.44,0); -- depops Spiritist_Andro_Shimi 
		eq.depop_with_timer();
	elseif(e.signal == 5) then
		e.self:Shout("FAIL - signal 5")
		eq.depop_with_timer();
	elseif(e.signal == 10) then		--checks for signal from #Ward_of_Life upon its death
		life_seal = true;
		WardCheck();
	elseif(e.signal == 11) then		--checks for signal from #Ward_of_Death upon its death
		death_seal = true;
		WardCheck();
	end
end

function event_timer(e)
	if e.timer == "jammers" then 
		SpawnJammers(math.random(2,3),jammer_locs_A);	
		SpawnJammers(math.random(2,3),jammer_locs_B);
		eq.zone_emote(15,"Jammer time!"); --debug
	elseif e.timer == "fail" then
		eq.zone_emote(13,"The image of the Ward beings to waver as its physical form fades and it falls behind protection again.");
		eq.signal(154052,10)  --signal event failure to Spiritist_Kama_Resan
		eq.signal(154053,10)  --signal event failure to Spiritist_Andro_Shimi
		eq.depop(154154);	--depop Warder of Life
		eq.signal(154155,10);	--depop Warder of death		
		eq.depop_all(154157); --depops Reanimated Guardians if up
		eq.depop_with_timer();
	end
end

function SpawnJammers(total,cell)	
	for n = 1,total do 
		eq.spawn2(154147,0,0,unpack(cell[n]));
	end
end

function WardCheck() --verifies both warders are dead before allowing progress to next stage of event
	if life_seal and death_seal then
		local instance_id = eq.get_zone_instance_id();
		eq.stop_timer("fail");
		eq.spawn2(154122,0,0,614.00,-345.00,-23.00,187); -- Spawns Arcanist Trigger
		eq.set_global(instance_id.. "_IAC_Seal_1","1",3,"H2");
		eq.zone_emote(14,"ADVANCING EVENT TO STAGE 2")	--debug
		eq.depop(154053); -- Spiritist_Andro_Shimi
		eq.depop(154052); -- Spiritist_Kama_Resan 
		eq.depop_with_timer();
	end
end

