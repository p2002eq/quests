--PoP Alpha Module to assist with zone flagging accessable via specified zones

local pop_flags = {};


local zoneflags = {208,210,200,207,209,211,220,214,212,215,216,217,218}; 
local zonenames = {"Plane of Valor", "The Plane of Storms", "Crypt of Decay", "Plane of Torment", "Bastion of Thunder", "Halls of Honor", "Temple of Marr", "Plane of Tactics", "Tower of Solusek Ro","Plane of Air", "Plane of Water", "Plane of Fire", "Plane of Earth"};
local flag_list ={};

function pop_flags.options(e)
	if e.message:findi("flag help") then
		e.self:Message(3,"Flagging options are: [".. eq.say_link("flagme all") .. "], [" .. eq.say_link("deflag all") .. "], [" .. eq.say_link("zone access status") .. "]");
		e.self:Message(3,"You may also manage specific flags by zone via [" .. eq.say_link("zone options") .. "]")
	elseif e.message:findi("zone access status") then
		e.self:Message(15,"Zone Flag status for PoP Zones:");
		for n,zone_id in pairs(zoneflags) do
			if e.self:HasZoneFlag(zone_id) then
				e.self:Message(14,zonenames[n] .. ": [TRUE]");
			else
				e.self:Message(13,zonenames[n] .. ": [FALSE]");
			end
		end
		e.self:Message(5,"Please note that zone access is granted AFTER you try to zone in with the correct pre-flags from Plane of Tranquility (do not use #zone the first time).  If you use zone specific flagging options then the status will not show you have access until successfuly zone in. If you use 'flagme all' then you will automatically receive zone access flags");
	elseif e.message:findi("zone options") then
		e.self:Message(3,"By using this menu you will be able to toggle flags unique to each specific zone.  The following zones are available for testing via this feature: [" .. eq.say_link("PoN options", false, "Plane of Nightmare") .. "], [" .. eq.say_link("PoD options", false, "Plane of Disease") .. "], [" .. eq.say_link("PoJ options", false, "Plane of Justice") .. "], [" .. eq.say_link("PoV options", false, "Plane of Valor") .. "], [" .. eq.say_link("PoS options", false, "Plane of Storms") .. "], [" .. eq.say_link("HoHa options", false, "Halls of Honor") .. "], [" .. eq.say_link("BoT options", false, "Bastion of Thunder") .. "]");
	
	--Plane of Justice
	elseif e.message:findi("PoJ options") then
		e.self:Message(3,"Plane of Justice flagging options are: [" .. eq.say_link("PoJ flag all",false,"flag all") .. "], [" .. eq.say_link("PoJ deflag all", false, "deflag all") .. "]" )
		e.self:Message(3,"By selecting the flag all option you will receive all flags required to enter The Plane of Valor and The Plane of Storms.");
	elseif e.message:findi("PoJ flag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms"};
		
		for k,flag in pairs(flag_list) do
			eq.set_global(flag,"1",5,"F");
		end	
		e.self:Message(18,"All of Plane of Justice flags added.");
	elseif e.message:findi("PoJ deflag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms"};
		
		for k,flag in pairs(flag_list) do
			eq.delete_global(flag);
		end
		e.self:Message(18,"All of Plane of Justice flags have been deleted.");
		
	--Plane of Storms
	elseif e.message:findi("PoS options") then
		e.self:Message(3,"Plane of Storms flagging options are: [" .. eq.say_link("PoS flag all",false,"flag all") .. "], [" .. eq.say_link("PoS deflag all", false, "deflag all") .. "]" )
		e.self:Message(3,"By selecting the flag all option you will receive all flags required to enter Torden, Bastion of Thunder.");
	elseif e.message:findi("PoS flag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final"};

		for k,flag in pairs(flag_list) do
			eq.set_global(flag,"1",5,"F");
		end	
		e.self:Message(18,"All of Plane of Storms flags added.");
	elseif e.message:findi("PoS deflag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final"};
		
		for k,flag in pairs(flag_list) do
			eq.delete_global(flag);
		end
		e.self:Message(18,"All of Plane of Storms flags have been deleted.");
	
	--Bastion of Thunder
	elseif e.message:findi("BoT options") then
		e.self:Message(3,"Bastion of Thunder flagging options are: [" .. eq.say_link("BoT flag all",false,"flag all") .. "], [" .. eq.say_link("BoT deflag all", false, "deflag all") .. "]" )
		e.self:Message(3,"By selecting the flag all option you will receive the flag from Karana and all required pre-flags.");
	elseif e.message:findi("BoT flag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final", "pop_bot_karana"};
		
		for k,flag in pairs(flag_list) do
			eq.set_global(flag,"1",5,"F");
		end	
		e.self:Message(18,"All of Bastion of Thunder flags added.");
	elseif e.message:findi("BoT deflag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final", "pop_bot_karana"};
		
		for k,flag in pairs(flag_list) do
			eq.delete_global(flag);
		end
		e.self:Message(18,"All of Bastion of Thunder flags have been deleted.");
	
	--Plane of Valor
	elseif e.message:findi("PoV options") then
		e.self:Message(3,"Plane of Valor flagging options are: [" .. eq.say_link("PoV flag all",false,"flag all") .. "], [" .. eq.say_link("PoV deflag all", false, "deflag all") .. "]" )
		e.self:Message(3,"By selecting the flag all option you will receive all flags required to enter The Halls of Honor.");
	elseif e.message:findi("PoV flag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar"};
		
		for k,flag in pairs(flag_list) do
			eq.set_global(flag,"1",5,"F");
		end	
		e.self:Message(18,"All of Plane of Valor flags added.");
	elseif e.message:findi("PoV deflag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar"};
		
		for k,flag in pairs(flag_list) do
			eq.delete_global(flag);
		end
		e.self:Message(18,"All of Plane of Valor flags have been deleted.");
	
	--Halls of Honor
	elseif e.message:findi("HoHa options") then
		e.self:Message(3,"Halls of Honor flagging options are: [" .. eq.say_link("HoHa flag all",false,"flag all") .. "], [" .. eq.say_link("HoHa deflag all", false, "deflag all") .. "]" )
		e.self:Message(3,"By selecting the flag all option you will receive all flags required to enter The Temple of Marr (Halls of Honor B).");
	elseif e.message:findi("HoHa flag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar", "pop_hoh_faye", "pop_hoh_trell", "pop_hoh_garn"};

		for k,flag in pairs(flag_list) do
			eq.set_global(flag,"1",5,"F");
		end	
		e.self:Message(18,"All of Halls of Honor flags added.");
	elseif e.message:findi("HoHa deflag all") then
		flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar", "pop_hoh_faye", "pop_hoh_trell", "pop_hoh_garn"};
		
		for k,flag in pairs(flag_list) do
			eq.delete_global(flag);
		end
		e.self:Message(18,"All of Halls of Honor flags have been deleted.");
	
	--Plane of Nightmare
		elseif e.message:findi("PoN options") then
		e.self:Message(3,"Plane of Nightmare flagging options are: [" .. eq.say_link("PoN flag all",false,"flag all") .. "], [" .. eq.say_link("PoN deflag all", false, "deflag all") .. "]" )
		e.self:Message(3,"By selecting flag all option you will receive all flags required to enter the Lair of Terris Thule.");
	elseif e.message:findi("PoN flag all") then
		flag_list = {"pop_pon_hedge_jezith", "pop_pon_construct"};
 
		for k,flag in pairs(flag_list) do
			eq.set_global(flag,"1",5,"F");
		end	
		e.self:Message(18,"All of Plane of Nightmare flags added.");
	elseif e.message:findi("PoN deflag all") then
		flag_list = {"pop_pon_hedge_jezith", "pop_pon_construct"};
		
		for k,flag in pairs(flag_list) do
			eq.delete_global(flag);
		end
		e.self:Message(18,"All of Plane of Nightmare flags have been deleted.");
	
	--Plane of Disease
	elseif e.message:findi("PoD options") then
		e.self:Message(3,"Plane of Disease flagging options are: [" .. eq.say_link("PoD flag all",false,"flag all") .. "], [" .. eq.say_link("PoD deflag all", false, "deflag all") .. "]" )
		e.self:Message(3,"By selecting flag all option you will receive all flags required to enter the Ruins of Lxanvom(The Crypt of Decay).");
	elseif e.message:findi("PoD flag all") then
		flag_list = {"pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel"};
 
		for k,flag in pairs(flag_list) do
			eq.set_global(flag,"1",5,"F");
		end	
		e.self:Message(18,"All of Plane of Disease flags added.");
	elseif e.message:findi("PoD deflag all") then
		flag_list = {"pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel"};
		
		for k,flag in pairs(flag_list) do
			eq.delete_global(flag);
		end
		e.self:Message(18,"All of Plane of Disease flags have been deleted.");
	
	--Universal Flagging for all zones
	elseif e.message:findi("deflag all") then
		deflagme(e);
	elseif e.message:findi("flagme all") then
		flagme_all(e);	
	end
end

function deflagme(e)
	eq.delete_global("pop_poj_mavuin");				eq.delete_global("pop_pod_grimmus_planar_projection");	eq.delete_global("pop_tactics_tallon");
	eq.delete_global("pop_poj_execution");			eq.delete_global("pop_pod_elder_fuirstel");				eq.delete_global("pop_tactics_vallon");
	eq.delete_global("pop_poj_flame");				eq.delete_global("pop_pov_aerin_dar");					eq.delete_global("pop_tactics_ralloz");
	eq.delete_global("pop_poj_hanging");			eq.delete_global("pop_pos_askr_the_lost");				eq.delete_global("pop_sol_ro_arlyxir");
	eq.delete_global("pop_poj_lashing");			eq.delete_global("pop_pos_askr_the_lost_final");		eq.delete_global("pop_sol_ro_dresolik");
	eq.delete_global("pop_poj_stoning");			eq.delete_global("pop_cod_preflag");					eq.delete_global("pop_sol_ro_jiva");
	eq.delete_global("pop_poj_torture");			eq.delete_global("pop_cod_bertox");						eq.delete_global("pop_sol_ro_rizlona");
	eq.delete_global("pop_poj_tribunal");			eq.delete_global("pop_cod_final");						eq.delete_global("pop_sol_ro_xuzl");
	eq.delete_global("pop_poj_valor_storms");		eq.delete_global("pop_pot_shadyglade");					eq.delete_global("pop_sol_ro_solusk");
	eq.delete_global("pop_pon_hedge_jezith");		eq.delete_global("pop_pot_newleaf");					eq.delete_global("pop_elemental_grand_librarian");
	eq.delete_global("pop_pon_construct");			eq.delete_global("pop_pot_saryrn");						eq.delete_global("pop_fire_fennin_projection");
	eq.delete_global("pop_ponb_terris");			eq.delete_global("pop_pot_saryrn_final");				eq.delete_global("pop_wind_xegony_projection");
	eq.delete_global("pop_ponb_poxbourne");			eq.delete_global("pop_hoh_faye");						eq.delete_global("pop_water_coirnav_projection");
	eq.delete_global("pop_poi_dragon");				eq.delete_global("pop_hoh_trell");						eq.delete_global("pop_eartha_arbitor_projection");
	eq.delete_global("pop_poi_behometh_preflag");	eq.delete_global("pop_hoh_garn");						eq.delete_global("pop_earthb_rathe");
	eq.delete_global("pop_poi_behometh_flag");		eq.delete_global("pop_hohb_marr");						eq.delete_global("pop_time_maelin");
	eq.delete_global("pop_pod_alder_fuirstel");		eq.delete_global("pop_bot_karana");
	
	for _,zone_id in pairs(zoneflags) do
		e.self:ClearZoneFlag(zone_id);
	end
	e.self:Message(18,"All PoP flags have been removed.");
end

function flagme_all(e)
	eq.set_global("pop_poj_mavuin","1",5,"F");				eq.set_global("pop_pod_grimmus_planar_projection","1",5,"F");	eq.set_global("pop_tactics_tallon","1",5,"F");
	eq.set_global("pop_poj_execution","1",5,"F");			eq.set_global("pop_pod_elder_fuirstel","1",5,"F");				eq.set_global("pop_tactics_vallon","1",5,"F");
	eq.set_global("pop_poj_flame","1",5,"F");				eq.set_global("pop_pov_aerin_dar","1",5,"F");					eq.set_global("pop_tactics_ralloz","1",5,"F");
	eq.set_global("pop_poj_hanging","1",5,"F");				eq.set_global("pop_pos_askr_the_lost","3",5,"F");				eq.set_global("pop_sol_ro_arlyxir","1",5,"F");
	eq.set_global("pop_poj_lashing","1",5,"F");				eq.set_global("pop_pos_askr_the_lost_final","1",5,"F");			eq.set_global("pop_sol_ro_dresolik","1",5,"F");
	eq.set_global("pop_poj_stoning","1",5,"F");				eq.set_global("pop_cod_preflag","1",5,"F");						eq.set_global("pop_sol_ro_jiva","1",5,"F");
	eq.set_global("pop_poj_torture","1",5,"F");				eq.set_global("pop_cod_bertox","1",5,"F");						eq.set_global("pop_sol_ro_rizlona","1",5,"F");
	eq.set_global("pop_poj_tribunal","1",5,"F");			eq.set_global("pop_cod_final","1",5,"F");						eq.set_global("pop_sol_ro_xuzl","1",5,"F");
	eq.set_global("pop_poj_valor_storms","1",5,"F");		eq.set_global("pop_pot_shadyglade","1",5,"F");					eq.set_global("pop_sol_ro_solusk","1",5,"F");
	eq.set_global("pop_pon_hedge_jezith","1",5,"F");		eq.set_global("pop_pot_newleaf","1",5,"F");						eq.set_global("pop_elemental_grand_librarian","1",5,"F");
	eq.set_global("pop_pon_construct","1",5,"F");			eq.set_global("pop_pot_saryrn","1",5,"F");						eq.set_global("pop_fire_fennin_projection","1",5,"F");
	eq.set_global("pop_ponb_terris","1",5,"F");				eq.set_global("pop_pot_saryrn_final","1",5,"F");				eq.set_global("pop_wind_xegony_projection","1",5,"F");
	eq.set_global("pop_ponb_poxbourne","1",5,"F");			eq.set_global("pop_hoh_faye","1",5,"F");						eq.set_global("pop_water_coirnav_projection","1",5,"F");
	eq.set_global("pop_poi_dragon","1",5,"F");				eq.set_global("pop_hoh_trell","1",5,"F");						eq.set_global("pop_eartha_arbitor_projection","1",5,"F");
	eq.set_global("pop_poi_behometh_preflag","1",5,"F");	eq.set_global("pop_hoh_garn","1",5,"F");						eq.set_global("pop_earthb_rathe","1",5,"F");
	eq.set_global("pop_poi_behometh_flag","1",5,"F");		eq.set_global("pop_hohb_marr","1",5,"F");						eq.set_global("pop_time_maelin","1",5,"F");
	eq.set_global("pop_pod_alder_fuirstel","1",5,"F");		eq.set_global("pop_bot_karana","1",5,"F");
	
	for _,zone_id in pairs(zoneflags) do
		e.self:SetZoneFlag(zone_id);
	end
	e.self:Message(18,"You have been flagged for all zones");

end

return pop_flags;