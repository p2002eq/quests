local depop_list = {126158, 126227, 126200, 126157, 126295, 126173, 126251, 126178, 126323, 126342, 126211, 126254, 126324, 126327, 126338, 126334, 126252, 126248, 126335, 126331, 126606, 126607, 126608, 126609, 126610, 126611, 126605};

function event_spawn(e)
	eq.set_timer("depop",1);  				-- clear pops upon spawn at 6am
	eq.set_timer("row1s2",1); 			    --audience procession starts at 7am
	eq.set_timer("row1s1",5*1000);
	eq.set_timer("row2s2",10*1000);
	eq.set_timer("row2s1",15*1000);
	eq.set_timer("row3s2",20*1000);
	eq.set_timer("row3s1",25*1000);
	eq.set_timer("row4s2",30*1000);
	eq.set_timer("row4s1",35*1000);	
	eq.set_timer("row5s2",40*1000);
	eq.set_timer("row5s1",45*1000);	
	eq.set_timer("puppets",1*60*1000);	--debug line
	--eq.set_timer("puppets",6*60*1000);  	 -- puppets spawn at 9am 
	eq.set_timer("bristlebane",1*60*1000);	  --debug line
	--eq.set_timer("bristlebane",9*60*1000);	  --bristlebane spawns around 10am
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		local count = 1;		
			while (depop_list[count] ~= nil) do
				eq.depop_all(depop_list[count]);  --Despawns all audience and puppets
				count = count + 1;
			end
		eq.depop_all(126160);  -- Despawn Bristlebane
	elseif (e.timer == "row1s2") then
		eq.stop_timer("row1s2");
		eq.spawn2(126158,15,0,260,404.54,118.72,65); -- Spawns Loplo using Grid 15
		eq.spawn2(126227,13,0,65,404.54,118.72,191); -- Spawns Nerzuz using Grid 13

	elseif (e.timer == "row1s1") then
		eq.stop_timer("row1s1");
		eq.spawn2(126200,16,0,260,404.54,118.72,65); -- Spawns Uinus using Grid 16
		eq.spawn2(126157,14,0,65,404.54,118.72,191); -- Spawns Hiana using Grid 14
		
	elseif (e.timer == "row2s2") then
		eq.stop_timer("row2s2");
		eq.spawn2(126295,17,0,260,404.54,118.72,65); -- Spawns Siris using Grid 17
		eq.spawn2(126173,19,0,65,404.54,118.72,191); -- Spawns Kelld using Grid 19
		
	elseif (e.timer == "row2s1") then
		eq.stop_timer("row2s1");
		eq.spawn2(126251,18,0,260,404.54,118.72,65); -- Spawns Tolas using Grid 18
		eq.spawn2(126178,20,0,65,404.54,118.72,191); -- Spawns Jinara using Grid 20
		
	elseif (e.timer == "row3s2") then
		eq.stop_timer("row3s2");
		eq.spawn2(126323,21,0,260,404.54,118.72,65); -- Spawns Lelel using Grid 21
		eq.spawn2(126342,23,0,65,404.54,118.72,191); -- Spawns Snide using Grid 23
		
	elseif (e.timer == "row3s1") then
		eq.stop_timer("row3s1");
		eq.spawn2(126211,22,0,260,404.54,118.72,65); -- Spawns Zerna using Grid 22
		eq.spawn2(126254,24,0,65,404.54,118.72,191); -- Spawns Bidalla using Grid 24

	elseif (e.timer == "row4s2") then
		eq.stop_timer("row4s2");
		eq.spawn2(126324,25,0,260,404.54,118.72,65); -- Spawns Forlus using Grid 25
		eq.spawn2(126327,27,0,65,404.54,118.72,191); -- Spawns Lelp using Grid 27
		
	elseif (e.timer == "row4s1") then
		eq.stop_timer("row4s1");
		eq.spawn2(126338,26,0,260,404.54,118.72,65); -- Spawns Verna using Grid 26
		eq.spawn2(126334,28,0,65,404.54,118.72,191); -- Spawns Osfof using Grid 28
		
	elseif (e.timer == "row5s2") then
		eq.stop_timer("row5s2");
		eq.spawn2(126252,29,0,260,404.54,118.72,65); -- Spawns Selvz using Grid 29
		eq.spawn2(126248,31,0,65,404.54,118.72,191); -- Spawns Geb using Grid 31
		
	elseif (e.timer == "row5s1") then
		eq.stop_timer("row5s1");
		eq.spawn2(126335,30,0,260,404.54,118.72,65); -- Spawns Terana using Grid 30
		eq.spawn2(126331,32,0,65,404.54,118.72,191); -- Spawns Brendaine using Grid 32
		
	elseif (e.timer == "puppets") then
		eq.stop_timer("puppets");
		eq.spawn2(126606,0,0,189,625,145.81,130); -- Spawns Solusek Puppet
		eq.spawn2(126607,0,0,179,625,145.81,130); -- Spawns Rallos Puppet
		eq.spawn2(126608,0,0,169,625,145.81,130); -- Spawns Erollsi Marr Puppet
		eq.spawn2(126609,0,0,159,625,145.81,130); -- Spawns Innoruuk Puppet
		eq.spawn2(126610,0,0,149,625,145.81,130); -- Spawns Tribunal Puppet #1
		eq.spawn2(126610,0,0,142,625,145.81,130); -- Spawns Tribunal Puppet #2
		eq.spawn2(126610,0,0,135,625,145.81,130); -- Spawns Tribunal Puppet #3
		eq.spawn2(126611,0,0,182,603,145.81,130); -- Spawns Bristlebane Puppet
		eq.spawn2(126605,0,0,142,603,145.81,130); -- Spawns Tunare Puppet

	elseif (e.timer == "bristlebane") then
		eq.stop_timer("bristlebane");
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(126248) == true) then  --if Geb not killed then spawns Bristlebane and starts depop timer
			eq.spawn2(126160,0,0,163,425,153.69,255);  --Spawn Bristlebane
			eq.signal(126160,1);					--send signal for Bristlebane shout about CT puppet
			eq.signal(126160,2,3*58*1000);			--send signal for Bristlebane zone-wide shout for everyone to go home
			eq.set_timer("depop", 3*60*1000);		--sets despawn for 11am
		end
	
	end 	


end