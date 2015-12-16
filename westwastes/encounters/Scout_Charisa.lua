function event_encounter_load(e)
	eq.spawn2(120115,0,0,-3501,-4868,-108, 0); -- a Kromzek Captain
	eq.spawn2(120121,0,0,-3507,-4897,-106, 0); -- Kromzek Warrior
	eq.spawn2(120121,0,0,-3496,-4874,-109, 0); -- Kromzek Warrior
	eq.spawn2(120121,0,0,-3474,-4863,-114, 0); -- Kromzek Warrior
	eq.spawn2(120121,0,0,-3463,-4852,-117, 0); -- Kromzek Warrior
	eq.spawn2(120121,0,0,-3452,-4841,-119, 0); -- Kromzek Warrior
	eq.spawn2(120121,0,0,-3441,-4830,-122, 0); -- Kromzek Warrior
	eq.spawn2(120121,0,0,-3430,-4819,-124, 0); -- Kromzek Warrior
	set_timer("depop", 120);
end

function event_timer(e)
	if (e.timer == "depop") then
	eq.stop_timer("depop");	
	eq.depop_all(120121); --Warriors
	eq.depop(120115); --Captain
	end

end
