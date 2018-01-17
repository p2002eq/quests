--Jiva (212014)
--solrotower

local counter;
	
local efreetis = {	[1] = {212402, "Makin, come to my aid!"},								--#an_efreeti_makin
					[2] = {212398, "Adeel, I require your assistance!"},					--#an_efreeti_adeel
					[3] = {212401, "Jiri, lend me your help!"},								--#an_efreeti_jiri
					[4] = {212404, "Seif, to my side!"},									--#an_efreeti_seif
					[5] = {212403, "Nabil, come to my aid!"},								--#an_efreeti_nabil
					[6] = {212399, "Aydin, your knowledge of the arcane is needed!"},		--#an_efreeti_aydin
					[7] = {212400, "Cemal, enchanted ones, I need your help!"},				--#an_efreeti_cemal
					[8] = {212405, "Fahim, your control over the elements is needed!"} };	--#an_efreeti_fahim

local spawn_locs = {[1] = {-2255,-331,-1095,127},
					[2] = {-2302,-310,-1095,161},
					[3] = {-2322,-264,-1095,191},
					[4] = {-2303,-217,-1095,224},
					[5] = {-2256,-195,-1095,256},
					[6] = {-2209,-216,-1095,35},
					[7] = {-2185,-264,-1095,64},
					[8] = {-2208,-311,-1095,95}};


function event_combat(e)
	if e.joined then
		if counter == nil then
			counter = 0;
		end
		eq.set_timer("adds", 45 * 1000);
		eq.stop_timer("reset");
	else
		eq.stop_timer("adds");
		eq.set_timer("reset", 10 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "adds" then		
		counter = counter + 1;
		call_efreeti(e,counter);
		if counter == 8 then
			counter = 0;
		end
	elseif e.timer == "reset" then
		eq.stop_timer(e.timer);
		counter = 0;
		for n = 1,8 do
			eq.depop_all(efreetis[n][1]);	--depop guards if up
		end
	end
end

function event_death_complete(e)
	eq.spawn2(212067,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ()-5, e.self:GetHeading());	--A_Planar_Projection (212067)
end

function call_efreeti(e,num)
	e.self:Say(tostring(efreetis[num][2]));
	efreeti = eq.spawn2(efreetis[num][1],0,0,unpack(spawn_locs[num]));
	efreeti:AddToHateList(e.self:GetHateRandom(),1);
end