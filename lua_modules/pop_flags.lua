--PoP Alpha Testing Module to assist with zone flagging accessable via specified zones

local pop_flags = {};

local all_flags = {[1] = {"PoJ Mavuin preflag","pop_poj_mavuin"}, [2] = {"PoJ Tribunal flag","pop_poj_tribunal"}, [3] = {"PoJ Mavuin PoV PoS flag","pop_poj_valor_storms"}, [4] = {"PoN Hedge preflag","pop_pon_hedge_jezith"}, [5] = {"PoN Hedge construct","pop_pon_construct"}, [6] = {"PoNb  Terris Thule","pop_ponb_terris"}, [7] = {"PoNb Elder Poxbourne","pop_ponb_poxbourne"}, [8] = {"PoI dragon","pop_poi_dragon"}, [9] = {"PoI MB preflag","pop_poi_behometh_preflag"}, [10] = {"PoI MB final flag","pop_poi_behometh_flag"}, [11] = {"PoD Grummus preflag","pop_pod_alder_fuirstel"}, [12] = {"PoD Grummus","pop_pod_grimmus_planar_projection"}, [13] = {"PoD Elder Fuirstel","pop_pod_elder_fuirstel"}, [14] = {"PoV Aerin Dar","pop_pov_aerin_dar"}, [15] = {"PoS Askr Preflag","pop_pos_askr_the_lost"}, [16] = {"PoS Askr final flag","pop_pos_askr_the_lost_final"}, [17] = {"CoD Bertoxx cycle preflag","pop_cod_preflag"}, [18] = {"CoD Bertoxx flag","pop_cod_bertox"}, [19] = {"CoD Elder Fuirstel final","pop_cod_final"}, [20] = {"PoTorment Tylis preflag","pop_pot_shadyglade"}, [21] = {"PoTorment KoS","pop_pot_newleaf"}, [22] = {"PoT Saryrn","pop_pot_saryrn"}, [23] = {"PoT Shadyglade final","pop_pot_saryrn_final"}, [24] = {"PoK Maelin Saryrn Lore","pop_maelin_lore_saryrn"}, [25] = {"HoHa Rydda Dar Trial","pop_hoh_faye"}, [26] = {"HoHa Villagers Trial","pop_hoh_trell"}, [27] = {"HoHa Maidens trial","pop_hoh_garn"}, [28] = {"HoHb Mith Marr","pop_hohb_marr"}, [29] = {"PoK Maelin Mith Marr Lore","pop_maelin_lore_mithaniel"}, [30] = {"BoT Karana","pop_bot_karana"}, [31] = {"BoT Agnarr","pop_bot_agnarr"}, [32] = {"PoK Maelin Karana Lore","pop_maelin_lore_karana"}, [33] = {"PoTactics TZ","pop_tactics_tallon"}, [34] = {"PoTactics VZ","pop_tactics_vallon"}, [35] = {"PoK Maelin Zeks VZTZ Lore","pop_maelin_info_zek_bros"}, [36] = {"PoTactics RZ","pop_tactics_ralloz"}, [37] = {"PoK Maelin RZ Lore","pop_maelin_info_rallos"}, [38] = {"SRT Miak Preflag","pop_sol_ro_miak"}, [39] = {"SRT Arlyxir","pop_sol_ro_arlyxir"}, [40] = {"SRT Dresolik","pop_sol_ro_dresolik"}, [41] = {"SRT Jiva","pop_sol_ro_jiva"}, [42] = {"SRT Rizlona","pop_sol_ro_rizlona"}, [43] = {"SRT Xuzl","pop_sol_ro_xuzl"}, [44] = {"SRT Solusek Ro","pop_sol_ro_solusk"}, [45] = {"Elementals Maelin","pop_elemental_grand_librarian"}, [46] = {"PoA Xegony","pop_wind_xegony_projection"}, [47] = {"PoW Coirnav","pop_water_coirnav_projection"}, [48] = {"PoF Fennin Ro","pop_fire_fennin_projection"}, [49] = {"PoEa Arbitor","pop_eartha_arbitor_projection"}, [50] = {"PoEb Rathe","pop_earthb_rathe"}, [51] = {"PoTime Maelin","pop_time_maelin"}};

local zoneflags = {208,210,200,207,209,211,220,214,212,215,216,217,218}; 
local zonenames = {"Plane of Valor", "The Plane of Storms", "Crypt of Decay", "Plane of Torment", "Bastion of Thunder", "Halls of Honor", "Temple of Marr", "Plane of Tactics", "Tower of Solusek Ro","Plane of Air", "Plane of Water", "Plane of Fire", "Plane of Earth"};
local flag_list ={};

function pop_flags.options(e)
	if e.self:GetGM() then
		if e.message:findi("flag help") then
			e.self:Message(3,"Flagging options are: [".. eq.say_link("flagme all") .. "], [" .. eq.say_link("deflag all") .. "], [" .. eq.say_link("zone access status") .. "]");
			e.self:Message(3,"You may also manage specific flags by zone via [" .. eq.say_link("zone options") .. "]")
			e.self:Message(3,"Advanced flagging options are also available to [" .. eq.say_link("advanced flag add",false,"add") .. "] or [" .. eq.say_link("advanced flag delete",false,"remove") .. "] specific flags.")
			e.self:Message(15,"DISCLAIMER: The advanced flagging option assumes you have knowledge of how planar progression should work.");
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
			e.self:Message(3,"By using this menu you will be able to toggle flags unique to each specific zone.  The following zones are available for testing via this feature: [" .. eq.say_link("PoN options", false, "Plane of Nightmare") .. "], [" .. eq.say_link("PoD options", false, "Plane of Disease") .. "], [" .. eq.say_link("PoJ options", false, "Plane of Justice") .. "], [" .. eq.say_link("PoI options", false, "Plane of Innovation") .. "], [" .. eq.say_link("PoV options", false, "Plane of Valor") .. "], [" .. eq.say_link("PoS options", false, "Plane of Storms") .. "], [" .. eq.say_link("HoHa options", false, "Halls of Honor") .. "], [" .. eq.say_link("CoD options", false, "Crypt of Decay") .. "], [" .. eq.say_link("PoNb options", false, "Lair of Terris Thule") .. "], [" .. eq.say_link("PoTactics options", false, "Tower of Solusek Ro") .. "], [" .. eq.say_link("BoT options", false, "Bastion of Thunder") .. "], [" .. eq.say_link("PoTorment options", false, "Plane of Torment") .. "], [" .. eq.say_link("HoHb options", false, "Temple of Marr") .. "], [" .. eq.say_link("PoTactics options", false, "Drunder, Fortress of Zek") .. "], [" .. eq.say_link("SRT options", false, "Tower of Solusek Ro") .. "], [" .. eq.say_link("EP options", false, "Elemental Planes Access") .. "]");
		
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
			flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final", "pop_bot_agnarr","pop_bot_karana"};
			
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All of Bastion of Thunder flags added.");
		elseif e.message:findi("BoT deflag all") then
			flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final", "pop_bot_agnarr","pop_bot_karana"};
			
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
		
		--Plane of Innovation
		elseif e.message:findi("PoI options") then
			e.self:Message(3,"Plane of Innovation flagging options are: [" .. eq.say_link("PoI flag all",false,"flag all") .. "], [" .. eq.say_link("PoI deflag all", false, "deflag all") .. "]" )
			e.self:Message(3,"By selecting flag all option you will receive all flags required to enter the Drunder, The Fortress of Zek (potactics).");
		elseif e.message:findi("PoI flag all") then
			flag_list = {"pop_poi_dragon", "pop_poi_behometh_preflag", "pop_poi_behometh_flag"};
	 
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All of Plane of Innovation flags added.");
		elseif e.message:findi("PoI deflag all") then
			flag_list = {"pop_poi_dragon", "pop_poi_behometh_preflag", "pop_poi_behometh_flag"};
			
			for k,flag in pairs(flag_list) do
				eq.delete_global(flag);
			end
			e.self:Message(18,"All of Plane of Innovation flags have been deleted.");
		
		--Crypt of Decay
		elseif e.message:findi("CoD options") then
			e.self:Message(3,"Crypt of Decay flagging options are: [" .. eq.say_link("CoD flag all",false,"flag all") .. "], [" .. eq.say_link("CoD deflag all", false, "deflag all") .. "]" )
			e.self:Message(3,"By selecting flag all option you will receive all flags required to complete Bertoxx questline (Ready for Plane of Torment if Terris questline is complete).");
		
		elseif e.message:findi("CoD flag all") then
			flag_list = {"pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel","pop_cod_preflag","pop_cod_bertox","pop_cod_final"};
	 
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All of Crypt of Decay flags added.");
			
		elseif e.message:findi("CoD deflag all") then
			flag_list = {"pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel","pop_cod_preflag","pop_cod_bertox","pop_cod_final"};
			
			for k,flag in pairs(flag_list) do
				eq.delete_global(flag);
			end
			e.self:Message(18,"All of Crypt of Decay flags have been deleted.");
		
		--Lair of Terris Thule
		elseif e.message:findi("PoNb options") then
			e.self:Message(3,"Plane of Nightmare flagging options are: [" .. eq.say_link("PoNb flag all",false,"flag all") .. "], [" .. eq.say_link("PoNb deflag all", false, "deflag all") .. "]" )
			e.self:Message(3,"By selecting flag all option you will have completed the Terris Thule questline (Ready for Plane of Torment if Bertoxx chain is complete)");
		
		elseif e.message:findi("PoNb flag all") then
			flag_list = {"pop_pon_hedge_jezith", "pop_pon_construct","pop_ponb_terris","pop_ponb_poxbourne"};
	 
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All of the Lair of Terris Thule flags added.");
		
		elseif e.message:findi("PoNb deflag all") then
			flag_list = {"pop_pon_hedge_jezith", "pop_pon_construct","pop_ponb_terris","pop_ponb_poxbourne"};
			
			for k,flag in pairs(flag_list) do
				eq.delete_global(flag);
			end
			e.self:Message(18,"All of the Lair of Terris flags have been deleted.");
		
		--Plane of Torment
		elseif e.message:findi("PoTorment options") then
			e.self:Message(3,"Plane of Torment flagging options are: [" .. eq.say_link("PoTorment flag all",false,"flag all") .. "], [" .. eq.say_link("PoTorment deflag all", false, "deflag all") .. "]" )
			e.self:Message(3,"By selecting flag all option you will have completed Plane of Torment questline.");
		
		elseif e.message:findi("PoTorment flag all") then
			flag_list = {"pop_pon_hedge_jezith", "pop_pon_construct","pop_ponb_terris", "pop_ponb_poxbourne","pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel","pop_cod_preflag","pop_cod_bertox","pop_cod_final","pop_pot_shadyglade","pop_pot_newleaf","pop_pot_saryrn","pop_pot_saryrn_final"};
	 
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All of Plane of Torment flags added.");
		
		elseif e.message:findi("PoTorment deflag all") then
			flag_list = {"pop_pon_hedge_jezith", "pop_pon_construct","pop_ponb_terris", "pop_ponb_poxbourne","pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel","pop_cod_preflag","pop_cod_bertox","pop_cod_final","pop_pot_shadyglade","pop_pot_newleaf","pop_pot_saryrn","pop_pot_saryrn_final"};
			
			for k,flag in pairs(flag_list) do
				eq.delete_global(flag);
			end
			e.self:Message(18,"All of Plane of Torment flags have been deleted.");
			
		--Temple of Marr
		elseif e.message:findi("HoHb options") then
			e.self:Message(3,"Temple of Marr flagging options are: [" .. eq.say_link("HoHb flag all",false,"flag all") .. "], [" .. eq.say_link("HoHb deflag all", false, "deflag all") .. "]" )
			e.self:Message(3,"By selecting flag all option you will have completed The Temple of Marr questline.");
		
		elseif e.message:findi("HoHb flag all") then
			flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar", "pop_hoh_faye", "pop_hoh_trell", "pop_hoh_garn", "pop_hohb_marr"};
	 
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All of Temple of Marr flags added.");
		
		elseif e.message:findi("HoHb deflag all") then
			flag_list = {"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar", "pop_hoh_faye", "pop_hoh_trell", "pop_hoh_garn", "pop_hohb_marr"};
			
			for k,flag in pairs(flag_list) do
				eq.delete_global(flag);
			end
			e.self:Message(18,"All of Temple of Marr flags have been deleted.");

		--Plane of Tactics
		elseif e.message:findi("PoTactics options") then
			e.self:Message(3,"Drunder, Fortress of Zek flagging options are: [" .. eq.say_link("PoTactics flag all",false,"flag all") .. "], [" .. eq.say_link("PoTactics deflag all", false, "deflag all") .. "]" )
			e.self:Message(3,"By selecting flag all option you will have completed the Drunder, Fortress of Zek questline.");
		
		elseif e.message:findi("PoTactics flag all") then
			flag_list = {"pop_poi_dragon", "pop_poi_behometh_preflag", "pop_poi_behometh_flag","pop_tactics_ralloz", "pop_tactics_vallon", "pop_tactics_tallon"};
	 
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All of Drunder, Fortress of Zek flags added.");
		
		elseif e.message:findi("PoTactics deflag all") then
			flag_list = {"pop_poi_dragon", "pop_poi_behometh_preflag", "pop_poi_behometh_flag","pop_tactics_ralloz", "pop_tactics_vallon", "pop_tactics_tallon"};
			
			for k,flag in pairs(flag_list) do
				eq.delete_global(flag);
			end
			e.self:Message(18,"All of Drunder, Fortress of Zek flags have been deleted.");
		
		--Tower of Solusek Ro
		elseif e.message:findi("SRT options") then
			e.self:Message(3,"Tower of Solusek Ro flagging options are: [" .. eq.say_link("SRT flag all",false,"flag all") .. "], [" .. eq.say_link("SRT deflag all", false, "deflag all") .. "]" )
			e.self:Message(3,"By selecting flag all option you will have completed the Tower of Solusek Ro and will be flagged for Plane of Fire.");
		
		elseif e.message:findi("SRT flag all") then
			flag_list = {	"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar", "pop_hoh_faye", "pop_hoh_trell", "pop_hoh_garn", "pop_hohb_marr",  --MM flags
							"pop_poi_dragon", "pop_poi_behometh_preflag", "pop_poi_behometh_flag", "pop_tactics_vallon", "pop_tactics_tallon","pop_tactics_ralloz",	--PoTactics flags
							"pop_pon_hedge_jezith", "pop_pon_construct","pop_ponb_terris", "pop_ponb_poxbourne","pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel","pop_cod_preflag","pop_cod_bertox","pop_cod_final","pop_pot_shadyglade","pop_pot_newleaf","pop_pot_saryrn","pop_pot_saryrn_final",	--Saryrn flags (excludes RZ)
							"pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final", "pop_bot_agnarr","pop_bot_karana",	--Agnarr/Karana flags
							"pop_sol_ro_miak","pop_sol_ro_arlyxir","pop_sol_ro_dresolik","pop_sol_ro_jiva","pop_sol_ro_rizlona","pop_sol_ro_xuzl","pop_sol_ro_solusk", "pop_elemental_grand_librarian"};  --SRT/Elemental Flags
	 
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All of Tower of Solusek Ro flags added.");
		
		elseif e.message:findi("SRT deflag all") then
			flag_list = {	"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar", "pop_hoh_faye", "pop_hoh_trell", "pop_hoh_garn", "pop_hohb_marr",  --MM flags
							"pop_poi_dragon", "pop_poi_behometh_preflag", "pop_poi_behometh_flag", "pop_tactics_vallon", "pop_tactics_tallon","pop_tactics_ralloz",	--PoTactics flags
							"pop_pon_hedge_jezith", "pop_pon_construct","pop_ponb_terris", "pop_ponb_poxbourne","pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel","pop_cod_preflag","pop_cod_bertox","pop_cod_final","pop_pot_shadyglade","pop_pot_newleaf","pop_pot_saryrn","pop_pot_saryrn_final",	--Saryrn flags (excludes RZ)
							"pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final", "pop_bot_agnarr","pop_bot_karana",	--Agnarr/Karana flags
							"pop_sol_ro_miak","pop_sol_ro_arlyxir","pop_sol_ro_dresolik","pop_sol_ro_jiva","pop_sol_ro_rizlona","pop_sol_ro_xuzl","pop_sol_ro_solusk", "pop_elemental_grand_librarian"};  --SRT/Elemental Flags
	 
			for k,flag in pairs(flag_list) do
				eq.delete_global(flag);
			end
			e.self:Message(18,"All of Tower of Solusek Ro flags have been deleted.");
		
		--Elemental Planes
		elseif e.message:findi("EP options") then
			e.self:Message(3,"Tower of Solusek Ro flagging options are: [" .. eq.say_link("EP flag all",false,"flag all") .. "], [" .. eq.say_link("EP deflag all", false, "deflag all") .. "]" )
			e.self:Message(3,"By selecting flag all option provide all flags to grant access to the Elemental Planes (Air, Water, Earth).  Choose SRT options for PoFire.");
		
		elseif e.message:findi("EP flag all") then
			flag_list = {	"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar", "pop_hoh_faye", "pop_hoh_trell", "pop_hoh_garn", "pop_hohb_marr",  --MM flags
							"pop_poi_dragon", "pop_poi_behometh_preflag", "pop_poi_behometh_flag", "pop_tactics_vallon", "pop_tactics_tallon","pop_tactics_ralloz",	--PoTactics flags
							"pop_pon_hedge_jezith", "pop_pon_construct","pop_ponb_terris", "pop_ponb_poxbourne","pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel","pop_cod_preflag","pop_cod_bertox","pop_cod_final","pop_pot_shadyglade","pop_pot_newleaf","pop_pot_saryrn","pop_pot_saryrn_final",	--Saryrn flags (excludes RZ)
							"pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final", "pop_bot_agnarr","pop_bot_karana",	--Agnarr/Karana flags
							"pop_elemental_grand_librarian"};  --Elemental Flags
	 
			for k,flag in pairs(flag_list) do
				eq.set_global(flag,"1",5,"F");
			end	
			e.self:Message(18,"All Elemental Planes flags added.");
		
		elseif e.message:findi("EP deflag all") then
			flag_list = {	"pop_poj_mavuin", "pop_poj_tribunal", "pop_poj_valor_storms", "pop_pov_aerin_dar", "pop_hoh_faye", "pop_hoh_trell", "pop_hoh_garn", "pop_hohb_marr",  --MM flags
							"pop_poi_dragon", "pop_poi_behometh_preflag", "pop_poi_behometh_flag", "pop_tactics_vallon", "pop_tactics_tallon","pop_tactics_ralloz",	--PoTactics flags
							"pop_pon_hedge_jezith", "pop_pon_construct","pop_ponb_terris", "pop_ponb_poxbourne","pop_pod_alder_fuirstel", "pop_pod_grimmus_planar_projection", "pop_pod_elder_fuirstel","pop_cod_preflag","pop_cod_bertox","pop_cod_final","pop_pot_shadyglade","pop_pot_newleaf","pop_pot_saryrn","pop_pot_saryrn_final",	--Saryrn flags (excludes RZ)
							"pop_pos_askr_the_lost", "pop_pos_askr_the_lost_final", "pop_bot_agnarr","pop_bot_karana",	--Agnarr/Karana flags
							"pop_elemental_grand_librarian"};  --Elemental Flags
			
			for k,flag in pairs(flag_list) do
				eq.delete_global(flag);
			end
			e.self:Message(18,"All Elemental Planes flags have been deleted.");
		
		--Universal Flagging for all zones
		elseif e.message:findi("deflag all") then
			deflagme(e);
		elseif e.message:findi("flagme all") then
			flagme_all(e);	
		
		--Advanced individual flagging options
		elseif e.message:findi("advanced flag add") then
			e.self:Message(14,"Click the flags below to add individually:");
			advanced_flag_listing(e,true)
		
		elseif e.message:findi("advanced flag delete") then
			e.self:Message(14,"Click the flags below to delete individually:");
			advanced_flag_listing(e,false)
		elseif e.message:findi("race") then	
			e.self:Message(14,tostring(e.self:Race()));

		end
		
		--check advanced flagging options
		for k,v in pairs(all_flags) do
			if e.message:findi("setflag " .. v[1]) then
				if tostring(v[1]) == "PoS Askr Preflag" then
					eq.set_global(tostring(v[2]),"3",5,"F");
				else
					eq.set_global(tostring(v[2]),"1",5,"F");
				end
				e.self:Message(18, v[1] .. " flag has been added!");
			elseif e.message:findi("removeflag " .. v[1]) then
				eq.delete_global(tostring(v[2]));
				e.self:Message(18, v[1] .. " flag has been deleted!");
			end
		end
	end
end

function advanced_flag_listing(e,option)
	if option == true then phrase = "setflag" else phrase = "removeflag" end;
	local num = 0;
	for _ in ipairs(all_flags) do 
		
		num = num + 1;
		e.self:Message(14,"[" .. eq.say_link(tostring(phrase) .. " " .. all_flags[num][1] ,false, all_flags[num][1]) .. "]");
	end
end

function deflagme(e)
	--DELETE QGLOBALS
	for k,v in pairs(all_flags) do
		eq.delete_global(tostring(v[2]))
	end

	--CLEAR ZONE FLAGS
	for _,zone_id in pairs(zoneflags) do
		e.self:ClearZoneFlag(zone_id);
	end
	e.self:Message(18,"All PoP flags have been removed.");
end

function flagme_all(e)
	--ADD QGLOBALS
	for k,v in pairs(all_flags) do
		if tostring(v[2]) == "pop_pos_askr_the_lost" then
			eq.set_global(tostring(v[2]),"3",5,"F");	--Special Plane of Storms value
		else
			eq.set_global(tostring(v[2]),"1",5,"F");
		end
	end
	
	--ADD ZONE FLAGS
	for _,zone_id in pairs(zoneflags) do
		e.self:SetZoneFlag(zone_id);
	end
	e.self:Message(18,"You have been flagged for all zones");

end

return pop_flags;