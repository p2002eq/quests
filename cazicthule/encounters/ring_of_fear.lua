x = {590, 536, 540, 631, 639};
y = {1054, 1067, 1138, 1126, 1080};
z = -94;
h = 132;
wave = nil;

function event_encounter_load(e)
	local mob = eq.get_entity_list():GetMobByNpcTypeID(48057);
	if(mob) then		-- despawn the invul tahia if up.
		mob:CastToNPC():Depop();
	end
	eq.spawn2(48388,0,0,587,1147,-96,128);	-- spawn new tahia
	eq.set_timer("aoe", 90000); 
end

function event_timer(e)
	if(e.timer == "aoe") then
		eq.zone_emote(1,"The walls of the temple begin to crack as the ground beneath your feet shakes violently");
		eq.stop_timer("aoe");
		-- spawn invis mob to cast aoe spell then depop
		--eq.spawn2(214104,0,0,586,1055,-96.97,132):TempName("An_explosion_of_fear");
		eq.spawn2(214104,0,0,586,1055,-96.97,132);
		eq.signal(214104,1);
		eq.set_timer("aoe2",30000);
	elseif(e.timer == "aoe2") then
		eq.stop_timer("aoe2");
		eq.zone_emote(1,"an unstable rift glows, and dissipates");
		eq.zone_emote(1,"an unstable rift begins to cast a spell.");
		eq.zone_emote(1,"You struggle with the urge to flee in terror!");
		eq.zone_emote(1,"A piercing, disembodied scream echos from deep within the temple. Your body begins to tremble uncontrollably with fear.");
		eq.stop_timer("aoe2");	
		-- spawn invis mob to cast aoe spell then depop
		--eq.spawn2(214104,0,0,586,1090,-90,132):TempName("An explosion of fear");
		eq.spawn2(214104,0,0,586,1090,-90,132);
		eq.signal(214104,2);
		eq.set_timer("avatar",30000);
	elseif(e.timer == "avatar") then
		eq.stop_timer("avatar");
		eq.spawn2(48387,0,0,586,1090,-73,132):Shout("In the name of the faceless, I command you, the minions of fear, ARISE!");		-- spawn avatar of fear
		eq.set_timer("wave1",2000);
		wave = 1;
	elseif(e.timer == "wave1") then
		spawn_wave(48354,5,300000);	
	elseif(e.timer == "wave2") then
		spawn_wave(48382,5,300000);	
	elseif(e.timer == "wave3") then
		spawn_wave(48383,5,300000);	
	elseif(e.timer == "wave4") then
		spawn_wave(48384,1,480000);	
	elseif(e.timer == "wave5") then
		spawn_wave(48354,5,300000);	
	elseif(e.timer == "wave6") then
		spawn_wave(48382,5,300000);	
	elseif(e.timer == "wave7") then
		spawn_wave(48383,5,300000);	
	elseif(e.timer == "wave8") then
		spawn_wave(48385,1,480000);	
	elseif(e.timer == "wave9") then
		spawn_wave(48354,5,300000);	
	elseif(e.timer == "wave10") then
		spawn_wave(48382,5,300000);	
	elseif(e.timer == "wave11") then
		spawn_wave(48383,5,300000);	
	elseif(e.timer == "wave12") then
		spawn_wave(48386,1,480000);	
	elseif(e.timer == "wave13") then
		local mob = eq.get_entity_list():GetMobByNpcTypeID(48387);
		if(mob) then		-- despawn the invul tahia if up.
			mob:CastToNPC():Depop();
		end
		spawn_wave(48381,1,20000);	
	elseif(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.signal(48388,1);
		wave = nil;
		eq.unload_encounter("ring of fear");
	end
end
	
function spawn_wave(npcId,npcs,timer)
	eq.stop_timer("wave" .. tostring(wave));
    for i = 1, npcs do
		eq.spawn2(npcId,0,0,x[i],y[i],z,h);
	end
	wave = wave + 1;		
	if (wave == 14) then
		eq.set_timer("depop",10000);		-- 30 minute depop of it all.
	else
		eq.set_timer("wave" .. tostring(wave),timer);
	end
end
