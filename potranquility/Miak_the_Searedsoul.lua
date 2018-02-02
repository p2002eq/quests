--Miak_the_Searedsoul (203381)
--potranquility


function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if (qglobals.pop_sol_ro_solusk ~= nil) and (qglobals.pop_elemental_grand_librarian ~= nil) and (e.message:findi("hail")) then	--confirms has Solusek Ro flag and elemental pre-flags
			e.self:Say("Greetings again. I sense that you have the correct path for the portal to the Plane of Fire. If you simply touch the portal, I will channel it to open to the location in your mind.");
	elseif (e.message:findi("hail")) then
			e.self:Say("Greetings traveler.  I am Miak, guardian of the portal to the greater elemental [" .. eq.say_link("Plane of Fire.") .. "]");
	elseif (e.message:findi("Plane of Fire")) then
		e.self:Say("The Plane of Fire is no place for a mortal to go frolicking about.  Regardless, to use the portal now would surely mean [" .. eq.say_link("your demise.") .. "]");
	elseif (e.message:findi("demise")) then
		e.self:Say("Yes, the end of your mortal existence.  Recently the portal seems to have lost its direction.  The location the portal sends you to is not safe; the [" .. eq.say_link("portal's destination") .. "] seems to have moved somehow.");
	elseif (e.message:findi("portal's destination")) then
		e.self:Say("I do not know if I will ever be able to correct the portal's destination, but if you have the true route for the portal in your mind I will be able to channel the portal to the correct location.");
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end



-- qglobals.pop_pon_hedge_jezith=nil;
-- qglobals.pop_pon_construct=nil;
-- qglobals.pop_ponb_terris=nil;
-- qglobals.pop_ponb_poxbourne=nil;
-- qglobals.pop_poi_dragon=nil;
-- qglobals.pop_poi_behometh_preflag=nil;
-- qglobals.pop_poi_behometh_flag=nil;
-- qglobals.pop_pod_alder_fuirstel=nil;
-- qglobals.pop_pod_grimmus_planar_projection=nil;
-- qglobals.pop_pod_elder_fuirstel=nil;
-- qglobals.pop_poj_mavuin=nil;
-- qglobals.pop_poj_tribunal=nil;
-- qglobals.pop_poj_valor_storms=nil;
-- qglobals.pop_poj_execution=nil;
-- qglobals.pop_poj_flame=nil;
-- qglobals.pop_poj_hanging=nil;
-- qglobals.pop_poj_lashing=nil;
-- qglobals.pop_poj_stoning=nil;
-- qglobals.pop_poj_torture=nil;
-- qglobals.pop_pov_aerin_dar=nil;
-- qglobals.pop_pos_askr_the_lost=nil;
-- qglobals.pop_pos_askr_the_lost_final=nil;
-- qglobals.pop_cod_preflag =nil;
-- qglobals.pop_cod_bertox=nil;
-- qglobals.pop_cod_final=nil;
-- qglobals.pop_pot_shadyglade=nil;
-- qglobals.pop_pot_newleaf=nil;
-- qglobals.pop_pot_saryrn=nil;
-- qglobals.pop_pot_saryn_final=nil;
-- qglobals.pop_hoh_faye=nil;
-- qglobals.pop_hoh_trell=nil;
-- qglobals.pop_hoh_garn=nil;
-- qglobals.pop_hohb_marr=nil;
-- qglobals.pop_bot_agnarr=nil;
-- qglobals.pop_bot_karana=nil;
-- qglobals.pop_tactics_tallon =nil;
-- qglobals.pop_tactics_vallon=nil;
-- qglobals.pop_tactics_ralloz=nil;
-- qglobals.pop_elemental_grand_librarian=nil;
-- qglobals.pop_sol_ro_miak=nil;
-- qglobals.pop_sol_ro_arlyxir=nil;
-- qglobals.pop_sol_ro_dresolik=nil;
-- qglobals.pop_sol_ro_jiva=nil;
-- qglobals.pop_sol_ro_rizlona=nil;
-- qglobals.pop_sol_ro_xuzl=nil;
-- qglobals.pop_sol_ro_solusk=nil;
-- qglobals.pop_fire_fennin_projection=nil;
-- qglobals.pop_wind_xegony_projection=nil;
-- qglobals.pop_water_coirnav_projection=nil;
-- qglobals.pop_eartha_arbitor_projection=nil;
-- qglobals.pop_earthb_rathe=nil;
-- qglobals.pop_time_maelin=nil;
