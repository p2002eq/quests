--Queynos Researcher's Badge Enchanted Rat Experiment Script

local diseased = 2179	--diseased rat
local healthy = 2180;	--healthy rat
local empty = 2177; 	--empty tile
local enchanted = 2181; -- enchanted rat


local game1 = {	--ordered from left to right  10 x 10 square
	AD  = {healthy, -272, -182, 1, 0},	--x,y,z,h
	AC  = {diseased, -262, -182, 1, 0},
	AB  = {empty, -252, -182, 1, 0},
	AA  = {healthy, -242, -182, 1, 0},
	BD  = {diseased, -272, -192, 1, 0},
	BC  = {empty,-262, -192, 1, 0},
	BB  = {diseased, -252, -192, 1, 0},
	BA  = {healthy, -242, -192, 1, 0},
	CD  = {diseased, -272, -202, 1, 0},
	CC  = {diseased, -262, -202, 1, 0},
	CB  = {empty, -252, -202, 1, 0},
	CA  = {empty, -242, -202, 1, 0},
	DD	= {empty, -272, -212, 1, 0},	
	DC	= {healthy, -262, -212, 1, 0},
	DB	= {empty, -252, -212, 1, 0},
	DA	= {empty, -242, -212, 1, 0}
}

local game2 = {	--ordered from left to right  10 x 10 square
	AD  = {empty, -272, -182, 1, 0},	--x,y,z,h
	AC  = {diseased, -262, -182, 1, 0},
	AB  = {diseased, -252, -182, 1, 0},
	AA  = {healthy, -242, -182, 1, 0},
	BD  = {diseased, -272, -192, 1, 0},
	BC  = {empty,-262, -192, 1, 0},
	BB  = {healthy, -252, -192, 1, 0},
	BA  = {diseased, -242, -192, 1, 0},
	CD  = {diseased, -272, -202, 1, 0},
	CC  = {diseased, -262, -202, 1, 0},
	CB  = {empty, -252, -202, 1, 0},
	CA  = {diseased, -242, -202, 1, 0},
	DD	= {healthy, -272, -212, 1, 0},	
	DC	= {diseased, -262, -212, 1, 0},
	DB	= {diseased, -252, -212, 1, 0},
	DA	= {empty, -242, -212, 1, 0}
}

local game3 = {	--ordered from left to right  10 x 10 square
	AD  = {healthy, -272, -182, 1, 0},	--x,y,z,h
	AC  = {diseased, -262, -182, 1, 0},
	AB  = {empty, -252, -182, 1, 0},
	AA  = {empty, -242, -182, 1, 0},
	BD  = {diseased, -272, -192, 1, 0},
	BC  = {empty,-262, -192, 1, 0},
	BB  = {diseased, -252, -192, 1, 0},
	BA  = {healthy, -242, -192, 1, 0},
	CD  = {diseased, -272, -202, 1, 0},
	CC  = {diseased, -262, -202, 1, 0},
	CB  = {diseased, -252, -202, 1, 0},
	CA  = {empty, -242, -202, 1, 0},
	DD	= {empty, -272, -212, 1, 0},	
	DC	= {healthy, -262, -212, 1, 0},
	DB	= {healthy, -252, -212, 1, 0},
	DA	= {empty, -242, -212, 1, 0}
}

local game4 = {	--ordered from left to right  10 x 10 square
	AD  = {healthy, -272, -182, 1, 0},	--x,y,z,h
	AC  = {diseased, -262, -182, 1, 0},
	AB  = {diseased, -252, -182, 1, 0},
	AA  = {empty, -242, -182, 1, 0},
	BD  = {empty, -272, -192, 1, 0},
	BC  = {diseased,-262, -192, 1, 0},
	BB  = {diseased, -252, -192, 1, 0},
	BA  = {diseased, -242, -192, 1, 0},
	CD  = {diseased, -272, -202, 1, 0},
	CC  = {empty, -262, -202, 1, 0},
	CB  = {healthy, -252, -202, 1, 0},
	CA  = {empty, -242, -202, 1, 0},
	DD	= {empty, -272, -212, 1, 0},	
	DC	= {diseased, -262, -212, 1, 0},
	DB	= {diseased, -252, -212, 1, 0},
	DA	= {healthy, -242, -212, 1, 0}
}

local game5 = {	--ordered from left to right  10 x 10 square
	AD  = {empty, -272, -182, 1, 0},	--x,y,z,h
	AC  = {diseased, -262, -182, 1, 0},
	AB  = {diseased, -252, -182, 1, 0},
	AA  = {healthy, -242, -182, 1, 0},
	BD  = {empty, -272, -192, 1, 0},
	BC  = {diseased,-262, -192, 1, 0},
	BB  = {diseased, -252, -192, 1, 0},
	BA  = {diseased, -242, -192, 1, 0},
	CD  = {diseased, -272, -202, 1, 0},
	CC  = {empty, -262, -202, 1, 0},
	CB  = {empty, -252, -202, 1, 0},
	CA  = {diseased, -242, -202, 1, 0},
	DD	= {healthy, -272, -212, 1, 0},	
	DC	= {diseased, -262, -212, 1, 0},
	DB	= {diseased, -252, -212, 1, 0},
	DA	= {empty, -242, -212, 1, 0}
}


function event_spawn()
	spawnTiles(eq.ChooseRandom(game1, game2, game3, game4, game5));
	eq.set_timer("game_over", 18 * 60 * 1000) -- game should allow for 18 minutes to complete or will otherwise reset/depop
end

function spawnTiles(game)
	for key,tiles in pairs(game) do
		local mob = eq.spawn2(tiles[1], 0, 0, tiles[2], tiles[3], tiles[4], tiles[5]);
		if (tiles[1] == 2177) then
			mob:TempName("tile " .. key);	--assign empty tile names based on location
		end
	end
end

function event_timer(e)
	if e.timer == "game_over" then 
		ClearEvent();
		eq.signal(2052,2);  -- Velarte Selire signal to depop
	end
end

function event_signal(e)
	if e.signal == 1 then
		ClearEvent();
	end
end

function ClearEvent()
	eq.depop_all(diseased);
	eq.depop_all(healthy);
	eq.depop_all(empty);
	eq.depop_all(enchanted);
	eq.depop();
end
	
	
	
