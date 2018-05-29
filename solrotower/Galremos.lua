--Galremos (212033)
--Spawn percents and quantities per live 01/09/14

local xloc = 0;
local yloc = 0;
local zloc = 0;

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset", 5 * 60 * 1000);
	end
end

function event_spawn(e)
	eq.set_next_hp_event(90);
end

function event_hp(e)
	if (e.hp_event == 90) then
		e.self:Emote("begins to break into smaller pieces!");
		spawn_golems(e,1);
		e.self:ChangeSize(28);
		eq.set_next_hp_event(60);
	elseif (e.hp_event == 60) then
		e.self:Emote("begins to break into smaller pieces!");
		spawn_golems(e,2);
		e.self:ChangeSize(24);
		eq.set_next_hp_event(35);
	elseif (e.hp_event == 35) then
		e.self:Emote("begins to break into smaller pieces!");
		spawn_golems(e,1);
		e.self:ChangeSize(20);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		e.self:Emote("begins to break into smaller pieces!");
		spawn_golems(e,4);
		e.self:ChangeSize(16);
		eq.set_next_hp_event(5);
	elseif (e.hp_event == 5) then
		e.self:Emote("begins to break into smaller pieces!");
		spawn_golems(e,6);
		e.self:ChangeSize(12);
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer(e.timer);
		eq.set_next_hp_event(90);
		eq.depop_all(212064);
		e.self:ChangeSize(30);
	end
end

function spawn_golems(e,num)
	xloc = e.self:GetX();
	yloc = e.self:GetY();
	zloc = e.self:GetZ();
	for n = 1,num do
		eq.spawn2(212064,0,0,xloc + math.random(-5,5),yloc + math.random(-5,5),zloc,0); -- #a_magmite (212064)
	end
end
