--Glykus_Helmir (214053)
--potactics

local first_engage;
local boars = { 214040,		--a_Fledgling_War_Boar (214040)
				214311,		--#an_Enraged_War_Boar (214311)
				214312,		--#a_Fierce_War_Boar (214312)
				214313,		--#a_Greater_War_Boar (214313)
				214314 };	--#an_Enchanted_War_Boar (214314)	--note:  included in signal loop though npc doesn't contain signal function

function event_spawn(e)
	first_engage = false;
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
		eq.signal(214040,1,2*1000);
		if not first_engage then	--spawn additional adds
			first_engage = true;
			RepopBoars();
		end
	else
		eq.stop_timer("adds");
		eq.set_timer("reset", 2 * 60 * 1000);
	end
end
		
function event_timer(e)
	if e.timer == "reset" and not e.self:IsEngaged() then
		eq.stop_timer(e.timer);
		first_engage = false;
	end
end

function RepopBoars()
	local spawnpoints = {361349,361350,361351,361352,361356 };
	eq.depop_all(214040);
	
	for num,spawns in pairs(spawnpoints) do
		boar = eq.get_entity_list():GetSpawnByID(spawns);
		boar:Repop(2);
	end
end
	

