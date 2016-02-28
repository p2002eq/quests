--Icefang
local icefang = 0;

function event_signal(e)
	if (e.signal == 1161101) then
		eq.move_to(3232, -7997, 146, 0, true);
		icefang = 10;
	elseif (e.signal == 1161102) then
		eq.move_to(1803, -7757, 193);
		icefang = 25;
	end

end

function event_waypoint_depart(e)
--	if (icefang == 10) then
--		eq.move_to(3235, -7970, 146);
--		icefang = 20;
	if (icefang == 10) then
		eq.signal(116594, 116567, 0);
		icefang = 0;
	elseif (icefang == 25) then
		eq.move_to(1401, -7748, 210);
		icefang = 30;
	elseif (icefang == 30) then
		eq.move_to(1030, -7713, 196);
		icefang = 40;
	elseif (icefang == 40) then
		eq.move_to(793, -7685, 179);
		icefang = 50;
	elseif (icefang == 50) then
		eq.move_to(273, -7149, 146);
		icefang = 60;
	elseif (icefang == 60) then
		eq.move_to(165, -6949, 169);
		icefang = 70;
	elseif (icefang == 70) then
		eq.move_to(61, -6753, 180);
		icefang = 80;
	elseif (icefang == 80) then
		eq.move_to(61, -6753, 180);
		icefang = 90;
	elseif (icefang == 90) then
		eq.move_to(-263, -5697, 164);
		icefang = 100;
	elseif (icefang == 100) then
		eq.move_to(-394, -5054, 146);
		icefang = 110;
	elseif (icefang == 110) then
		eq.move_to(-171, -4746, 219);
		icefang = 120;
	elseif (icefang == 120) then
		eq.move_to(25, -4538, 158);
		icefang = 125;
	elseif (icefang == 125) then
		eq.move_to(-300, -4353, 182);
		icefang = 130;
	elseif (icefang == 130) then
		eq.move_to(-604, -4180, 243);
		icefang = 135;
	elseif (icefang == 135) then
		eq.move_to(-850, -4050, 207);
		icefang = 137;
	elseif (icefang == 137) then
		eq.move_to(-1158, -3800, 155);
		icefang = 140;
	elseif (icefang == 140) then
		eq.move_to(-1368, -3686, 195);
		icefang = 145;
	elseif (icefang == 145) then
		eq.move_to(-1688, -3450, 154);
		icefang = 150;
	elseif (icefang == 150) then
		eq.move_to(-2095, -3147, 228);
		icefang = 160;
	elseif (icefang == 160) then
		eq.move_to(-3024, -3156, 147);
		icefang = 170;
	elseif (icefang == 170) then 
		e.self:Emote("sniffs the ground and growls.");
		eq.move_to(-3730, -3305, 197);
		eq.set_timer("icefang", 6000000); --10 min
		icefang = 180;
		eq.load_encounter("RingSix");
	elseif (icefang == 180) then
		eq.move_to(-4404, -3354, 146);
		icefang = 0; --clear the var
	end

end

function event_timer(e)
	if (e.timer == "icefang") then
		eq.stop_timer("icefang");
		eq.unload_encounter("RingSix");
		eq.depop_all(116587);
		eq.depop_all(116596);
		--text made up
		e.self:Emote("blends into the snowy landscape and disappears from sight.");
		eq.depop_with_timer();
	end
end

function event_death_complete(e)
    eq.stop_timer("icefang");
    eq.unload_encounter("RingSix");
    eq.depop_all(116596);
    eq.depop_all(116587);
end


