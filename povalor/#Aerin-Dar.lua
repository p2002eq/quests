--#Aerin`Dar
--ID:208074
--Zone:povalor 

local guards = { [1] = {347220, 347221}, [2] = {347219, 347217}, [3] = {347215, 347216}, [4] = {347214, 347218} };	--guard spawnpoints set up in packs of two
local spawnpoints  ={347220, 347221, 347219, 347217,347215, 347216, 347214, 347218, 347213};  --spawnpoints for depop/repop functions


function event_spawn(e)
	eq.set_next_hp_event(80);	
end

function event_hp(e)
	if e.hp_event == 80 then
		GetAdds(e,1);
		eq.set_next_hp_event(60);
		eq.set_next_inc_hp_event(98); --to reset on event failure
	elseif e.hp_event == 60 then
		GetAdds(e,2);
		eq.set_next_hp_event(40);
	elseif e.hp_event == 40 then
		GetAdds(e,3);
		eq.set_next_hp_event(20);
	elseif e.hp_event == 20 then
		local rhalgon = eq.get_entity_list():GetMobByNpcTypeID(208176);
		GetAdds(e,4);
		activate(e,rhalgon);	--activate named golem
	end
	
	if e.inc_hp_event == 98 then
		eq.set_next_hp_event(80);
		DepopGolems();
		RepopGolems();
	end
end

function event_death_complete(e)	
	eq.spawn2(208192,0,0, 370,2540,45,254);	--A_Planar_Projection
end

function GetAdds(e,n)
	for x = 1,2 do 
		local npc_list = eq.get_entity_list():GetNPCList();

		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if npc:GetSpawnPointID() == guards[n][x] then
					activate(e,npc);
				end
			end
		end
	end
end


function activate(e,mob)
	mob:SetBodyType(1, true);
	mob:SetSpecialAbility(24, 0);
	mob:AddToHateList(e.self:GetHateRandom(),1);
end

function RepopGolems()
	for _,spawns in pairs(spawnpoints) do
		local mobs = eq.get_entity_list():GetSpawnByID(spawns);
		mobs:Enable();
		mobs:Reset();
		mobs:Repop(5);
	end
end

function DepopGolems()	
	for _,spawns in pairs(spawnpoints) do
		local npc_list = eq.get_entity_list():GetNPCList();

		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if npc:GetSpawnPointID() == spawns then
					npc:Depop(true);
				end
			end
		end
	end
end
	


