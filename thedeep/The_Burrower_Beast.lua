-- The Burrower Beast event
-- The Burrower Beast (164098), A rock burrower (164130), A stone carver (164133), A spiny rock burrower (164132), A core burrower (164129), A parasite larva (164128/164131), A massive burrower (164134), A burrower parasite (164127)

event_mobs = { 164130, 164132, 164133, 164129, 164128, 164131, 164127, 164134 };

function event_spawn(e)
	setup(e);
end

function event_enter(e)
	eq.zone_emote(1, "The ground around you begins to tremble and shake.");
	eq.spawn2(164134, 0, 0, 1600, 275, -62,128.0);
	eq.set_timer('wave', 45000);
	eq.set_timer('HB', 30000);
	eq.clear_proximity();
end

function event_timer(e)
	if e.timer == 'HB' then
		if not player_check() then
			cleanup();
			setup(e);
		end
	elseif e.timer == 'wave' then
		wave = wave + 1;
		if wave == 1 then
			e.self:Emote('roars, causing the ground to rumble. You begin to sense movement around you.');
			spawn_wave(1);
		elseif wave == 2 then
			e.self:Emote('begins to thrash in the narrow tunnel and the ground erupts around you!');
			spawn_wave(1);
		elseif wave == 3 then
			e.self:Emote('roars again... the sounds of smaller beasts fill the room with a reply!');
			spawn_wave(1);
		elseif wave == 4 then
			e.self:Emote('inhales deeply before releasing another great roar!');
			spawn_wave(2);
		elseif wave == 5 then
			e.self:Emote('shakes and rages, rattling the entire chamber!'); -- text made up
			spawn_wave(2);
		elseif wave == 6 then
			e.self:Emote('slams against the walls of the tunnel, filling your nostrills with the stench of fresh earth and rock dust!');
			spawn_wave(2);
		elseif wave == 7 then
			e.self:Emote('roars in pain, releasing a foul current of air!');
			spawn_wave(3);
		elseif wave == 9 then -- skips wave == 8 to create 10-minute pause
			e.self:Emote('begins to tunnel into the ground below it. As it digs, its flesh splits revealing an enormous parasite!');
			wave_final(e);
		end
		eq.stop_timer(e.timer);
		eq.set_timer('wave', 300 * 1000);
	end
end

function spawn_wave(wave_type)
	if wave_type == 1 then
		for i=1, 12 do
			local xloc, yloc;
			repeat
				xloc = math.random(1700, 1850)
				yloc = math.random(200, 350)
			until not (xloc > 1740 and xloc < 1800 and yloc > 235 and yloc < 300)
			eq.spawn2(event_mobs[math.random(3)], 0, 0, xloc, yloc, -60,0.0);
		end
	elseif wave_type == 2 then
		for i=1, 6 do
			local xloc, yloc;
			repeat
				xloc = math.random(1700, 1850)
				yloc = math.random(200, 350)
			until not (xloc > 1740 and xloc < 1800 and yloc > 235 and yloc < 300)
			eq.spawn2(164129, 0, 0, xloc, yloc, -60,0.0);
		end
	elseif wave_type == 3 then
		eq.spawn2(164128,0.0, 0, 1792, 5, -70, 0);
		eq.spawn2(164131,0.0, 0, 1767, 5, -70, 0);
	end
end

function wave_final(ev)
	eq.spawn2(164127,0.0, 0, ev.self:GetX(), ev.self:GetY(), ev.self:GetZ(), 0);
	eq.stop_all_timers();
	eq.depop_with_timer();
end

function cleanup()
	for _, mob in ipairs(event_mobs) do
		eq.depop_all(mob);
	end
end

function setup(ev)
	eq.stop_all_timers();
	wave = 0;
	eq.set_proximity(ev.self:GetX()-50,ev.self:GetX()+50,ev.self:GetY()-100,ev.self:GetY()+150);
end

function player_check()
	-- checks for players
	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do
			if player:GetX() > 1650 and player:GetX() < 1860 and player:GetY() > 150 and player:GetY() < 360 and not player:GetFeigned() then
				return true; -- if player in event area and not FD
			end
		end
	end
	
	return false; -- if nothing checks out, returns false
end
