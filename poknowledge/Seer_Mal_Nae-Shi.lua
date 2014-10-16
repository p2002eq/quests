function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("Hail")) then
		e.other:Say("Greetings, " .. e.other:GetName() .. ". I can provide you information upon your travels through the planes by [guided meditation].");
	elseif(e.message:findi("guided meditation")) then
		e.other:Message(1,"You converse with Seer Mal Nae`Shi as she guides your meditation... You feel a power within your being, pulling your thougts left and right.  After some time, your mind clears, and Seer Mal Nae`Shi speaks.");
		e.other:Message(9,"Now that your thoughts have calmed, tell me where you have traveled... There are many planes, try to think about your past, and your adventures in: [Plane of Justice] [Plane of Nightmare] [Plane of Innovation] [Plane of Disease] [Plane of Valor] [Plane of Storms] [Plane of Torment] [Ruins of Lxanvom] [Doomfire, the Burning Lands] [Drunder, Fortress of Zek] [Eryslai, the Kingdom of Wind] [Halls of Honor] [Lair of Terris Thule] [Bastion of Thunder] [Reef of Coirnav] [Tower of Solusek Ro] [Vegarlson, the Earthen Badlands] [Ragrax, Stronghold of the Twelve] [Temple of Marr].  If you have completed your elemental flag, say [elemental flag]");
		e.other:Message(9,"If one option does not give you the information you need, you may be missing experience from some zones.  To find the credit you currently have, please just [unlock memories].");
		e.other:Message(9,"There are special restrictions for the Temple of Marr, elemental planes, and Plane of Torment.  If you need assistance, say [special zones].");
	elseif(e.message:findi("special zones")) then
		e.other:Message(9,"The Temple of Marr is a special access zone.  To access the Temple of Marr you must kill Bertox, Terris Thule, complete the three trials within Halls of Honor, and defeat Saryrn. The other special access zones are the elemental planes. These planes are Plane of Air, Plane of Water and Plane of Earth. To inquire about access to elemental planes, say [elemental planes]. To access the elemental planes: Plane of Fire is obtained by killing through the plane of innovation, to Drunder, Fortress of Zek, then to the Tower of Soluesk Ro, where you must kill Solusek Ro himother.  To access the other elemental planes, you must have completed ALL zone flags in lower zones, and kill Agnarr the storm lord, and Mithaniel Marr. To inquire about access to the Temple of Marr, say [Access to Temple of Marr]. The last special access zone is the Plane of Torment. You must have killed Terris Thule and Bertox before you can enter to kill Saryrn. To inquire about the Plane of Torment, say [Access to Torment].");
------------------------------------------
--THIS JUST TELLS PEOPLE ABOUT ALL FLAGS--
------------------------------------------
	elseif(e.message:findi("unlock memories")) then
		e.other:Message(9,"At the moment, your credit is as follows");
		if(qglobals["pop_poj_mavuin"] == "1") then
			e.other:Message(12,"You have talked to Mavuin, and have agreed to plea his case to The Tribunal.");
		else
			e.other:Message(9,"You have NOT talked to Mavuin, and agreed to plea his case to The Tribunal.");
		end
		if(qglobals["pop_poj_execution"] == "1") then
			e.other:Message(12,"You have completed the Trial of Execution.");
		else
			e.other:Message(9,"You have NOT completed the Trial of Execution.");
		end
		if(qglobals["pop_poj_flame"] == "1") then
			e.other:Message(12,"You have completed the Trial of Flame.");
		else
			e.other:Message(9,"You have NOT completed the Trial of Flame.");
		end
		if(qglobals["pop_poj_hanging"] == "1") then
			e.other:Message(12,"You have completed the Trial of Hanging.");
		else
			e.other:Message(9,"You have NOT completed the Trial of Hanging.");
		end
		if(qglobals["pop_poj_lashing"] == "1") then
			e.other:Message(12,"You have completed the Trial of Lashing.");
		else
			e.other:Message(9,"You have NOT completed the Trial of Lashing.");
		end
		if(qglobals["pop_poj_stoning"] == "1") then
			e.other:Message(12,"You have completed the Trial of Stoning.");
		else
			e.other:Message(9,"You have NOT completed the Trial of Stoning.");
		end
		if(qglobals["pop_poj_torture"] == "1") then
			e.other:Message(12,"You have completed the Trial of Torture.");
		else
			e.other:Message(9,"You have NOT completed the Trial of Torture.");
		end
		if(qglobals["pop_poj_tribunal"] == "1") then
			e.other:Message(12,"You have shown the Tribunal the mark from the trial you have completed.");
		else
			e.other:Message(9,"You have NOT shown the Tribunal the mark from the trial you have completed.");
		end
		if(qglobals["pop_poj_valor_storms"] == "1") then
			e.other:Message(12,"You have returned to Mavuin, letting him know the tribunal will hear his case.");
		else
			e.other:Message(9,"You have NOT returned to mavuin to tell him the tribunal will hear his case.");
		end		
		if(qglobals["pop_pon_hedge_jezith"] == "1") then
			e.other:Message(12,"You have spoken to Jezith within the Plane of Tranquillity for the Hedge pre-flag by saying tormented by nightmares.");
		else
			e.other:Message(9,"You have NOT spoken to Jezith within the Plane of Tranquillity for the Hedge pre-flag by saying tormented by nightmares.");
		end
		if(qglobals["pop_pon_construct"] == "1") then
			e.other:Message(12,"You have killed the Construct of Nightmares.");
		else
			e.other:Message(9,"You have NOT killed the Construct of Nightmares.");
		end
		if(qglobals["pop_ponb_terris"] == "1") then
			e.other:Message(12,"You have killed Terris Thule.");
		else
			e.other:Message(9,"You have NOT killed Terris Thule.");
		end
		if(qglobals["pop_ponb_poxbourne"] == "1") then
			e.other:Message(12,"You have talked to Poxbourne in the Plane of Tranquillity after defeating Terris Thule.");
		else
			e.other:Message(9,"You have NOT talked to Poxbourne in the Plane of Tranquillity after defeating Terris Thule.");
		end
		if(qglobals["pop_poi_dragon"] == "1") then
			e.other:Message(12,"You have killed the dragon within the Plane of Innovation");
		else
			e.other:Message(9,"You have NOT killed the dragon within the Plane of Innovation.");
		end
		if(qglobals["pop_poi_behometh_preflag"] == "1") then
			e.other:Message(12,"You have talked to the Gnome within the Plane of Innovation factory.");
		else
			e.other:Message(9,"You have NOT talked to the Gnome within the Plane of Innovation factory.");
		end
		if(qglobals["pop_poi_behometh_flag"] == "1") then
			e.other:Message(12,"You have defeated the Behemoth within the Plane of Innovation and then QUICKLY hailed the Gnome in the factory.");
		else
			e.other:Message(9,"You have NOT defeated the Behemoth within the Plane of Innovation and then QUICKLY hailed the Gnome in the factory.");
		end
		if(qglobals["pop_pod_alder_fuirstel"] == "1") then
			e.other:Message(12,"You have talked to Adler Fuirstel outside of the Plane of Disease.");
		else
			e.other:Message(9,"You have NOT talked to Adler Fuirstel outside of the Plane of Disease.");
		end
		if(qglobals["pop_pod_grimmus_planar_projection"] == "1") then
			e.other:Message(12,"You have defeated Grummus.");
		else
			e.other:Message(9,"You have NOT defeated Grummus.");
		end
		if(qglobals["pop_pod_elder_fuirstel"] == "1") then
			e.other:Message(12,"You have talked to Elder Fuirstel in the plane of Tranquillity.");
		else
			e.other:Message(9,"You have NOT talked to Elder Fuirstel in the Plane of Tranquillity.");
		end
		if(qglobals["pop_pov_aerin_dar"] == "1") then
			e.other:Message(12,"You have defeated the prismatic dragon, Aerin`Dar, within the Plane of Valor.");
		else
			e.other:Message(9,"You have NOT defeated the prismatic dragon, Aerin`Dar, within the Plane of Valor.");
		end
		if(qglobals["pop_pos_askr_the_lost"] == "3") then
			e.other:Message(12,"You have completed part one of Askr's task within the Plane of Storms.");
		else
			e.other:Message(9,"You have NOT completed part one of Askr's task within the Plane of Storms.");
		end
		if(qglobals["pop_pos_askr_the_lost_final"] == "1") then
			e.other:Message(12,"You have killed the giants within the Plane of Storms and completed Askr's task.");
		else
			e.other:Message(9,"You have NOT killed the giants within the Plane of Storms to complete Askr's task.");
		end
		if(qglobals["pop_cod_preflag"] == "1") then
			e.other:Message(12,"You have completed the Carprin cycle within Ruins of Lxanvom.");
		else
			e.other:Message(9,"You have NOT completed the Carprin Cycle within Ruins of Laxanvom.");
		end
		if(qglobals["pop_cod_bertox"] == "1") then
			e.other:Message(12,"You have killed Bertox and hailed the planar projection.");
		else
			e.other:Message(9,"You have NOT killed Bertox and hailed the planar projection.");
		end
		if(qglobals["pop_cod_final"] == "1") then
			e.other:Message(12,"You have killed Bertox and talked to Adler Fuirstel");
		else
			e.other:Message(9,"You have NOT talked to Adler Fuirstel after killing Bertox.");
		end
		if(qglobals["pop_pot_shadyglade"] == "1") then
			e.other:Message(12,"You have talked to Shadyglade within the Plane of Tranquillity");
		else
			e.other:Message(9,"You have NOT talked to Shadyglade within the Plane of Tranquillity.");
		end
		if(qglobals["pop_pot_newleaf"] == "1") then
			e.other:Message(12,"You have killed the Keeper of Sorrows.");
		else
			e.other:Message(9,"You have NOT killed the Keeper of Sorrows.");
		end
		if(qglobals["pop_pot_saryrn"] == "1") then
			e.other:Message(12,"You have killed Saryrn and hailed the planar projection.");
		else
			e.other:Message(9,"You have NOT killed Saryrn and hailed the planar projection.");
		end
		if(qglobals["pop_pot_saryrn_final"] == "1") then
			e.other:Message(12,"You have killed Saryrn, hailed the planar projection, and then talked to Shadyglade once more.");
		else
			e.other:Message(9,"You have NOT talked to Shadyglade after killing Saryrn.");
		end
		if(qglobals["pop_hoh_faye"] == "1") then
			e.other:Message(12,"You have completed the Halls of Honor trial given by Faye.");
		else
			e.other:Message(9,"You have NOT completed the Halls of Honor trial given by Faye.");
		end
		if(qglobals["pop_hoh_trell"] == "1") then
			e.other:Message(12,"You have completed the Halls of Honor trial given by Rhaliq Trell.");
		else
			e.other:Message(9,"You have NOT completed the Halls of Honor trial given by Rhaliq Trell.");
		end
		if(qglobals["pop_hoh_garn"] == "1") then
			e.other:Message(12,"You have completed the Halls of Honor trial given by Alekson Garn.");
		else
			e.other:Message(9,"You have NOT completed the Halls of Honor trial given by Alekson Garn.");
		end
		if(qglobals["pop_hohb_marr"] == "1") then
			e.other:Message(12,"You have defeated Lord Marr within his temple.");
		else
			e.other:Message(9,"You have NOT defeated Lord Marr within his Temple.");
		end
		if(qglobals["pop_bot_agnarr"] == "1") then
			e.other:Message(12,"You have defeated Agnarr, the Storm Lord.");
		else
			e.other:Message(9,"You have NOT defeated Agnarr, the Storm Lord.");
		end
		if(qglobals["pop_tactics_tallon"] == "1") then
			e.other:Message(12,"You have killed Tallon Zek.");
		else
			e.other:Message(9,"You have NOT killed Tallon Zek");
		end
		if(qglobals["pop_tactics_vallon"] == "1") then
			e.other:Message(12,"You have killed Vallon Zek.");
		else
			e.other:Message(9,"You have NOT killed Vallon Zek.");
		end
		if(qglobals["pop_tactics_ralloz"] == "1") then
			e.other:Message(12,"You have killed Rallos Zek the Warlord.");
		else
			e.other:Message(9,"You have NOT killed Rallos Zek the Warlord.");
		end
		if(qglobals["pop_sol_ro_arlyxir"] == "1") then
			e.other:Message(12,"You have defeated Arlyxir within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated Arlyxir within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_dresolik"] == "1") then
			e.other:Message(12,"You have defeated The Protector of Dresolik within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated The Protector of Dresolik within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_jiva"] == "1") then
			e.other:Message(12,"You have defeated Jiva within the Tower of Soluesk Ro.");
		else
			e.other:Message(9,"You have NOT defeated Jiva within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_rizlona"] == "1") then
			e.other:Message(12,"You have defeated Rizlona within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated Rizlona within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_xuzl"] == "1") then
			e.other:Message(12,"You have defeated Xuzl within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated Xuzl within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_solusk"] == "1") then
			e.other:Message(12,"You have defeated Solusek Ro within his own tower.");
		else
			e.other:Message(9,"You have NOT defeated Solusek Ro within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_elemental_grand_librarian"] == "1") then
			e.other:Message(12,"You have spoken with the grand librarian to receive access to the Elemental Planes.");
		else
			e.other:Message(9,"You have NOT spoken with the grand librarian to receive access to the Elemental Planes.");
		end
		if(qglobals["pop_fire_fennin_projection"] == "1") then
			e.other:Message(12,"You have defeated Fennin Ro, the Tyrant of Fire.");
		else
			e.other:Message(9,"You have NOT defeated Fennin Ro, the Tyrant of Fire.");
		end
		if(qglobals["pop_wind_xegony_projection"] == "1") then
			e.other:Message(12,"You have defeated Xegony, the Queen of Air.");
		else
			e.other:Message(9,"You have NOT defeated Xegony, the Queen of Air.");
		end
		if(qglobals["pop_water_coirnav_projection"] == "1") then
			e.other:Message(12,"You have defeated Coirnav, the Avatar of Water.");
		else
			e.other:Message(9,"You have NOT defeated Coirnav, the Avatar of Water.");
		end
		if(qglobals["pop_eartha_arbitor_projection"] == "1") then
			e.other:Message(12,"You have defeated the arbitor within Plane of Earth A.");
		else
			e.other:Message(9,"You have NOT defeated the Arbitor of Earth within Plane of Earth A");
		end
		if(qglobals["pop_earthb_rathe"] == "1") then
			e.other:Message(12,"You have defeated the Rathe Council within Plane of Earth B");
		else
			e.other:Message(9,"You have NOT defeated the Rathe Council within Plane of Earth B");
		end
		if(qglobals["pop_time_maelin"] == "1") then
			e.other:Message(12,"You have completed the Plane of Time flag.");
		else
			e.other:Message(9,"You have NOT completed your Plane of Time flag.");
		end
---------------------------------
---------------------------------
--Plane of JUSTICE INSTRUCTIONS--
---------------------------------
---------------------------------
	elseif(e.message:findi("Plane of Justice") and (qglobals["pop_poj_mavuin"] == nil) or (qglobals["pop_poj_tribunal"] == nil) or (qglobals["pop_poj_valor_storms"] == nil)) then
		if(qglobals["pop_poj_mavuin"] == "1") then
			e.other:Message(12,"You have talked to Mavuin, and have agreed to plea his case to The Tribunal.");
		else
			e.other:Message(9,"You have NOT talked to Mavuin, and agreed to plea his case to The Tribunal.");
		end
		if(qglobals["pop_poj_tribunal"] == "1") then
			e.other:Message(12,"You have shown the Tribunal the mark from the trial you have completed.");
		else
			e.other:Message(9,"You have NOT shown the Tribunal the mark from the trial you have completed.");
		end
		if(qglobals["pop_poj_valor_storms"] == "1") then
			e.other:Message(12,"You have returned to Mavuin, letting him know the tribunal will hear his case.");
		else
			e.other:Message(9,"You have NOT returned to Mavuin to tell him the tribunal will hear his case.");
		end
	elseif(e.message:findi("Plane of Justice") and (qglobals["pop_poj_mavuin"] == "1") and (qglobals["pop_poj_tribunal"] == "1") and (qglobals["pop_poj_valor_storms"] == "1")) then
		e.other:Message(4,"Congratulations! Converse with the Planar Projection by saying [I am familiar with Order] to receive access to Planes of Valor and Storms.");
---------------------------------------------------
---------------------------------------------------
-- PLANE OF NIGHTMARE ACCESS TO PONB INSTRUCTIONS--
---------------------------------------------------
---------------------------------------------------
	elseif(e.message:findi("Plane of Nightmare") and (qglobals["pop_pon_hedge_jezith"] == nil) or (qglobals["pop_pon_construct"] == nil)) then
		if(qglobals["pop_pon_hedge_jezith"] == "1") then
			e.other:Message(12,"You have spoken to Jezith within the Plane of Tranquillity for the Hedge Pre-flag by saying tormented by nightmares.");
		else
			e.other:Message(9,"You have not spoken to Jezith within the Plane of Tranquillity for the Hedge Pre-flag by saying tormented by nightmares.");
		end
		if(qglobals["pop_pon_construct"] == "1") then
			e.other:Message(12,"You have killed the Construct of Nightmares.");
		else
			e.other:Message(9,"You have NOT killed the Construct of Nightmares.");
		end
	elseif(e.message:findi("Plane of Nightmare") and (qglobals["pop_pon_construct"] == "1") and (qglobals["pop_pon_hedge_jezith"] == "1")) then
		e.other:Message(4,"You do not fear the Dark?--then converse with the Planar Projection by saying [Darkness Beckons].");
-------------------------------------------------------
-------------------------------------------------------
-- Plane of INNOVATION ACCESS TO DRUNDER INSTRUCTIONS--
-------------------------------------------------------
-------------------------------------------------------
	elseif(e.message:findi("Plane of Innovation") and (qglobals["pop_poi_dragon"] == nil) or (qglobals["pop_poi_behometh_preflag"] == nil) or (qglobals["pop_poi_behometh_flag"] == nil)) then
		if(qglobals["pop_poi_dragon"] == "1") then
			e.other:Message(12,"You have killed the dragon within the Plane of Innovation");
		else
			e.other:Message(9,"You have NOT killed the dragon within the Plane of Innovation.");
		end
		if(qglobals["pop_poi_behometh_preflag"] == "1") then
			e.other:Message(12,"You have talked to the Gnome within the Plane of Innovation Factory.");
		else
			e.other:Message(9,"You have NOT talked to the Gnome within the plane of innovation factory.");
		end
		if(qglobals["pop_poi_behometh_flag"] == "1") then
			e.other:Message(12,"You have defeated the Behemoth within Plane of Innovation and then QUICKLY hailed the gnome within the factory.");
		else
			e.other:Message(9,"You have NOT defeated the Behemoth within Plane of Innovation and then QUICKLY hailed the gnome within the factory.");
		end
	elseif(e.message:findi("Plane of Innovation") and (qglobals["pop_poi_behometh_preflag"] == "1") and (qglobals["pop_poi_behometh_flag"] == "1")) then
		e.other:Message(4,"You have halted production of these evil machines by Killing the Behemoth! Converse with the Planar projection by saying [The War Drums Echo]");
----------------------------------------
----------------------------------------
--Plane of Disease instructions TO COD--
----------------------------------------
----------------------------------------
	elseif(e.message:findi("Plane of Disease") and (qglobals["pop_pod_alder_fuirstel"] == nil) or (qglobals["pop_pod_grimmus_planar_projection"] == nil) or (qglobals["pop_pod_elder_fuirstel"] == nil)) then
		if(qglobals["pop_pod_alder_fuirstel"] == "1") then
			e.other:Message(12,"You have talked to Adler Fuirstel outside of the Plane of Disease.");
		else
			e.other:Message(9,"You have NOT talked to Adler Fuirstel outside of the Plane of Disease.");
		end
		if(qglobals["pop_pod_grimmus_planar_projection"] == "1") then
			e.other:Message(12,"You have defeated Grummus");
		else
			e.other:Message(9,"You have NOT defeated Grummus.");
		end
		if(qglobals["pop_pod_elder_fuirstel"] == "1") then
			e.other:Message(12,"You have talked to Elder Fuirstel in the Plane of Tranquillity.");
		else
			e.other:Message(9,"You have NOT talked to Elder Fuirstel in the Plane of Tranquillity.");
		end
	elseif(e.message:findi("Plane of Disease") and (qglobals["pop_pod_alder_fuirstel"] == "1") and (qglobals["pop_pod_grimmus_planar_projection"] == "1") and (qglobals["pop_pod_elder_fuirstel"] == "1")) then
		e.other:Message(4,"Congratulations! Converse with the Planar Projection by saying [I will destroy the plaguebringer]");
-----------------------------
-----------------------------
--PLANE OF VALOR COMPLETION--
-----------------------------
-----------------------------
	elseif(e.message:findi("Plane of Valor")) then
		if(qglobals["pop_pov_aerin_dar"] == "1") then
			e.other:Message(12,"You have defeated the prismatic dragon, Aerin`Dar, within the Plane of Valor.");
		else
			e.other:Message(9,"You have NOT defeated the prismatic dragon, Aerin`Dar, within the Plane of Valor.  Make sure you have completed a [Plane of Justice] Trial.");
		end
	elseif(e.message:findi("Plane of Valor") and (qglobals["pop_poj_mavuin"] == "1") and (qglobals["pop_poj_tribunal"] == "1") and (qglobals["pop_poj_valor_storms"] == "1")and (qglobals["pop_pov_aerin_dar"] == "1")) then
		e.other:Message(4,"Congratulations! Converse with the Planar Projection by saying [My Valor is Unmatched] to gain access to the Halls of Honor");
--------------------------------
--------------------------------
--PLANE OF STORMS INSTRUCTIONS--
--------------------------------
--------------------------------
	elseif(e.message:findi("Plane of Storms") and (qglobals["pop_pos_askr_the_lost"] == nil) or (qglobals["pop_pos_askr_the_lost"] == nil)) then
		if(qglobals["pop_pos_askr_the_lost"] == "3") then
			e.other:Message(12,"You have completed part one of Askr's task within the Plane of Storms.");
		else
			e.other:Message(9,"You have NOT completed part one of Askr's task within the Plane of Storms.  Make sure you have completed a [Plane of Justice] Trial.");
		end
		if(qglobals["pop_pos_askr_the_lost_final"] == "1") then
			e.other:Message(12,"You have killed the giants within the Plane of Storms and completed Askr's task.");
		else
			e.other:Message(9,"You have NOT killed the giants within the Plane of Storms to complete Askr's task. Make sure you have completed a [Plane of Justice] Trial.");
		end
	elseif(e.message:findi("Plane of Storms") and (qglobals["pop_poj_mavuin"] == "1") and (qglobals["pop_poj_tribunal"] == "1") and (qglobals["pop_poj_valor_storms"] == "1") and (qglobals["pop_pos_askr_the_lost"] == "3")) then
		e.other:Message(4,"Congratulations! Converse with the Planar Projection by saying [I will defeat the Storm Lord] to gain access to the Bastion of Thunder");
-------------------------------------
-------------------------------------
--PLANE OF NIGHTMARE B INSTRUCTIONS--
-------------------------------------
-------------------------------------
	elseif(e.message:findi("Lair of Terris Thule") and (qglobals["pop_ponb_terris"] == nil) or (qglobals["pop_ponb_poxbourne"] == nil)) then
		if(qglobals["pop_ponb_terris"] == "1") then
			e.other:Message(12,"You have killed Terris Thule.");
		else
			e.other:Message(9,"You have NOT killed Terris Thule.  Make sure you have completed the events within the [Plane of Nightmare].");
		end
		if(qglobals["pop_ponb_poxbourne"] == "1") then
			e.other:Message(12,"You have talked to Poxbourne in the Plane of Tranquillity after defeating Terris Thule.");
		else
			e.other:Message(9,"You have NOT talked to Poxbourne in the Plane of Tranquillity after defeating Terris Thule.  Make sure you have completed the events within the [Plane of Nightmare].");
		end
	elseif(e.message:findi("Lair of Terris Thule") and (qglobals["pop_ponb_terris"] == "1")  and (qglobals["pop_ponb_poxbourne"] == "1") and (qglobals["pop_pon_hedge_jezith"] == "1") and (qglobals["pop_pon_construct"] == "1")) then
		e.other:Message(4,"You have completed a partial flag for the Plane of Torment! Say [access to torment] to see what else is required.");
-----------------------------------------------
-----------------------------------------------
--RUINS OF LX INSTRUCTIONS - Ruins of Lxanvom--
-----------------------------------------------
-----------------------------------------------
	elseif(e.message:findi("Ruins of Lxanvom") and (qglobals["pop_cod_preflag"] == nil) or (qglobals["pop_cod_bertox"] == nil) or (qglobals["pop_cod_final"] == nil)) then
		if(qglobals["pop_cod_preflag"] == "1") then
			e.other:Message(12,"You have completed the Carprin cycle within the Ruins of Lxanvom.");
		else
			e.other:Message(9,"You have NOT completed the Carprin Cycle within Ruins of Laxanvom.  Make sure you have completed the events within [Plane of Disease]");
		end
		if(qglobals["pop_cod_bertox"] == "1") then
			e.other:Message(12,"You have killed Bertox and hailed the planar projection.");
		else
			e.other:Message(9,"You have NOT killed Bertox and hailed the planar projection.  Make sure you have completed the events within [Plane of Disease]");
		end
		if(qglobals["pop_cod_final"] == "1") then
			e.other:Message(12,"You have killed Bertox and talked to Adler Fuirstel");
		else
			e.other:Message(9,"You have NOT talked to Adler Fuirstel after killing Bertox.  Make sure you have completed the events within [Plane of Disease]");
		end
	elseif(e.message:findi("Ruins of Lxanvom") and (qglobals["pop_cod_preflag"] == "1") and (qglobals["pop_cod_bertox"] == "1")and (qglobals["pop_cod_final"] == "1")and (qglobals["pop_pod_alder_fuirstel"] == "1") and (qglobals["pop_pod_grimmus_planar_projection"] == "1") and (qglobals["pop_pod_elder_fuirstel"] == "1")) then
		e.other:Message(4,"You have completed a partial flag for the Plane of Torment!  Say [access to Torment] to see what else is required.");
---------------------------------
---------------------------------
--Plane of Torment INSTRUCTIONS--
---------------------------------
---------------------------------
	elseif(e.message:findi("Plane of Torment") and (qglobals["pop_pot_shadyglade"] == nil) or (qglobals["pop_pot_newleaf"] == nil) or (qglobals["pop_pot_saryrn"] == nil) or (qglobals["pop_pot_saryrn_final"] == nil)) then
		if(qglobals["pop_pot_shadyglade"] == "1") then
			e.other:Message(12,"You have talked to Shadyglade within the Plane of Tranquillity");
		else
			e.other:Message(9,"You have NOT talked to Shadyglade within the Plane of Tranquillity.");
		end
		if(qglobals["pop_pot_newleaf"] == "1") then
			e.other:Message(12,"You have killed the Keeper of Sorrows.");
		else
			e.other:Message(9,"You have NOT killed the Keeper of Sorrows.");
		end
		if(qglobals["pop_pot_saryrn"] == "1") then
			e.other:Message(12,"You have killed Saryrn and hailed the planar projection.");
		else
			e.other:Message(9,"You have NOT killed Saryrn and hailed the planar projection.");
		end
		if(qglobals["pop_pot_saryrn_final"] == "1") then
			e.other:Message(12,"You have killed Saryrn, hailed the planar projection, and then talked to Shadyglade once more. Please make sure you have completed events within [Plane of Nightmare] [Plane of Disease] [Halls of Honor] [Lair of Terris Thule] [Ruins of Lxanvom] [Plane of Storms] to advance to the Temple of Marr.");
		else
			e.other:Message(9,"You have NOT talked to Shadyglade after killing Saryrn. Please make sure you have completed events within [Plane of Nightmare] [Plane of Disease] [Halls of Honor] [Lair of Terris Thule] [Ruins of Lxanvom] [Plane of Storms] to advance to the Temple of Marr.");
		end
	elseif(e.message:findi("Plane of Torment") and (qglobals["pop_pot_shadyglade"] == "1") and (qglobals["pop_pot_newleaf"] == "1") and (qglobals["pop_pot_saryrn"] == "1") and (qglobals["pop_pot_saryrn_final"] == "1")) then
		e.other:Message(4,"Congratulations! You have defeated Saryrn!");
-------------------------------
-------------------------------
--HALLS OF HONOR INSTRUCTIONS--
-------------------------------
-------------------------------
	elseif(e.message:findi("Halls of Honor") and (qglobals["pop_hoh_faye"] == nil) or (qglobals["pop_hoh_trell"] == nil) or (qglobals["pop_hoh_garn"] == nil)) then
		if(qglobals["pop_hoh_faye"] == "1") then
			e.other:Message(12,"You have completed the Halls of Honor trial given by Faye.");
		else
			e.other:Message(9,"You have NOT completed the Halls of Honor trial given by Faye.");
		end
		if(qglobals["pop_hoh_trell"] == "1") then
			e.other:Message(12,"You have completed the Halls of Honor trial given by Rhaliq Trell.");
		else
			e.other:Message(9,"You have NOT completed the Halls of Honor trial given by Rhaliq Trell.");
		end
		if(qglobals["pop_hoh_garn"] == "1") then
			e.other:Message(12,"You have completed the Halls of Honor trial given by Alekson Garn.");
		else
			e.other:Message(9,"You have NOT completed the Halls of Honor trial given by Alekson Garn.");
		end
	elseif(e.message:findi("Halls of Honor") and (qglobals["pop_hoh_faye"] == "1") and (qglobals["pop_hoh_trell"] == "1") and (qglobals["pop_hoh_garn"] == "1")) then
		e.other:Message(4,"You have completed all trials! Converse with the Projection by saying [I am ready to face Lord Mithaniel Marr]");
--------------------
--------------------
--PLANE OF TACTICS--
--------------------
--------------------
	elseif(e.message:findi("Fortress of Zek") and (qglobals["pop_tactics_tallon"] == nil) or (qglobals["pop_tactics_vallon"] == nil) or (qglobals["pop_tactics_ralloz"] == nil)) then
		if(qglobals["pop_tactics_tallon"] == "1") then
			e.other:Message(12,"You have killed Tallon Zek.");
		else
			e.other:Message(9,"You have NOT killed Tallon Zek");
		end
		if(qglobals["pop_tactics_vallon"] == "1") then
			e.other:Message(12,"You have killed Vallon Zek.");
		else
			e.other:Message(9,"You have NOT killed Vallon Zek.");
		end
		if(qglobals["pop_tactics_ralloz"] == "1") then
			e.other:Message(12,"You have killed Rallos Zek the Warlord.");
		else
			e.other:Message(9,"You have NOT killed Rallos Zek the Warlord.  Make sure you have completed the [Plane of Innovation] flags");
		end
	elseif(e.message:findi("Fortress of Zek") and (qglobals["pop_tactics_tallon"] == "1") and (qglobals["pop_tactics_vallon"] == "1") and (qglobals["pop_tactics_ralloz"] == "1") (qglobals["pop_pot_saryrn_final"] == "1") and (qglobals["pop_pot_saryrn"] == "1") and (qglobals["pop_hohb_marr"] == "1")) then
		e.other:Message(4,"Congratulations! You have proven yourself in war, now let us see if you can prove yourself in fire! To gain access to the Tower of Solusek Ro, converse with the projection and say [No gladiator shall match me]");
-----------------------
-----------------------
--SOL RO INSTRUCTIONS--
-----------------------
-----------------------
	elseif(e.message:findi("Tower of Solusek Ro") and (qglobals["pop_sol_ro_arlyxir"] == nil) or (qglobals["pop_sol_ro_dresolik"] == nil) or (qglobals["pop_sol_ro_jiva"] == nil) or (qglobals["pop_sol_ro_xuzl"]  == nil) or (qglobals["pop_sol_ro_rizlona"] == nil) or (qglobals["pop_sol_ro_solusk"] == nil)) then
		if(qglobals["pop_sol_ro_arlyxir"] == "1") then
			e.other:Message(12,"You have defeated Arlyxir within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated Arlyxir within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_dresolik"] == "1") then
			e.other:Message(12,"You have defeated The Protector of Dresolik within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated The Protector of Dresolik within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_jiva"] == "1") then
			e.other:Message(12,"You have defeated Jiva within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated Jiva within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_rizlona"] == "1") then
			e.other:Message(12,"You have defeated Rizlona within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated Rizlona within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_xuzl"] == "1") then
			e.other:Message(12,"You have defeated Xuzl within the Tower of Solusek Ro.");
		else
			e.other:Message(9,"You have NOT defeated Xuzl within the Tower of Solusek Ro.");
		end
		if(qglobals["pop_sol_ro_solusk"] == "1") then
			e.other:Message(12,"You have defeated Solusek Ro within his own tower.  Please make sure you've completed events in the [Plane of Innovation] and [Drunder, Fortress of Zek].");
		else
			e.other:Message(9,"You have NOT defeated Solusek Ro within the Tower of Solusek Ro.  Please make sure you've completed events in the [Plane of Innovation] and [Drunder, Fortress of Zek].");
		end
	elseif(e.message:findi("Tower of Solusek Ro") and (qglobals["pop_sol_ro_arlyxir"] == "1") and (qglobals["pop_sol_ro_dresolik"] == "1") and (qglobals["pop_sol_ro_jiva"] == "1") and (qglobals["pop_sol_ro_xuzl"]  == "1") and (qglobals["pop_sol_ro_rizlona"] == "1") and (qglobals["pop_sol_ro_solusk"] == "1")) then
		e.other:Message(4,"Congratulations! You are now able to enter the Plane of Fire!  Converse with the Projection and tell him [I am a child of fire].");
------------------------------
------------------------------
--PLANE OF FIRE INSTRUCTIONS--
------------------------------
------------------------------
	elseif(e.message:findi("Doomfire")) then
		if(qglobals["pop_fire_fennin_projection"] == "1") then
			e.other:Message(4,"You have defeated Fennin Ro, the Tyrant of Fire! This flag is one quarter of the Plane of Time flag. The grand librarian gives out the Plane of Time flag. However, you are able to continually check your flags through guided meditation to see what remains.");
		else
			e.other:Message(4,"You must kill Fennin Ro.");
		end
-------------------------------
-------------------------------
--PLANE OF WATER INSTRUCTIONS--
-------------------------------
-------------------------------
	elseif(e.message:findi("Reef of")) then
		if(qglobals["pop_water_coirnav_projection"] == "1") then
			e.other:Message(4,"You have defeated Coirnav, the Avatar of Water! This flag is one quarter of the Plane of Time flag. The grand librarian gives out the Plane of Time flag. However, you are able to continually check your flags through guided meditation to see what remains.");
		else
			e.other:Message(4,"You must kill Coirnav, the Avatar of Water.");
		end
-----------------------------
-----------------------------
--PLANE OF AIR INSTRUCTIONS--
-----------------------------
-----------------------------
	elseif(e.message:findi("Kingdom of Wind")) then
		if(qglobals["pop_wind_xegony_projection"] == "1") then
			e.other:Message(4,"You have defeated Xegony, the Queen of Air! This flag is one quarter of the Plane of Time flag. The grand librarian gives out the Plane of Time flag. However, you are able to continually check your flags through guided meditation to see what remains.");
		else
			e.other:Message(4,"You must kill Xegony, the Queen of Air.");
		end
---------------------------------
---------------------------------
--PLANE OF EARTH A INSTRUCTIONS--
---------------------------------
---------------------------------
	elseif(e.message:findi("Earthen Badlands")) then
		if(qglobals["pop_eartha_arbitor_projection"] == "1") then
			e.other:Message(4,"You have defeated the Arbitor of Earth! To receive your Plane of Earth B flag, converse with the projection and say [I will prove myself by defeating the Rathe Council].");
		else
			e.other:Message(4,"To receive your flag for Poearth B, you must defeat the four trials in Plane of Earth and kill the Arbitor.");
		end
-----------------------------------------------------------
-----------------------------------------------------------
--PLANE OF EARTH B INSTRUCTIONS -Stronghold of the Twelve--
-----------------------------------------------------------
-----------------------------------------------------------
	elseif(e.message:findi("stronghold of twelve")) then
		if(qglobals["pop_earthb_rathe"] == "1") then
			e.other:Message(4,"You have defeated the Rathe Council! This flag is one quarter of the Plane of Time flag. The grand librarian gives out the Plane of Time flag. However, you are able to continually check your flags through guided meditation to see what remains.");
		else
			e.other:Message(4,"You must defeat the Rathe Council.");
		end
------------------------------------
------------------------------------
-- BASTION OF THUNDER INSTRUCTIONS--
------------------------------------
------------------------------------
	elseif(e.message:findi("of thunder")) then
		if(qglobals["pop_bot_agnarr"] == "1") then
			e.other:Message(4,"You have defeated Agnarr, the Storm Lord! This is part of the elemental flag! Once you are finished with the elemental flag, let me know by saying [elemental flag].");
		else
			e.other:Message(4,"You have not defeated Agnarr, the Storm Lord.");
		end
--------------------------------
--------------------------------
-- TEMPLE OF MARR INSTRUCTIONS--
--------------------------------
--------------------------------
	elseif(e.message:findi("temple of")) then
		if(qglobals["pop_hohb_marr"] == "1") then
			e.other:Message(4,"You have defeated Lord Mithaniel Marr!  This is part of the elemental flag! Once you are finished with the elemental flag, let me know by saying [elemental flag].");
		else
			e.other:Message(4,"You have not killed Lord Mithaniel Marr.");
		end
--------------------
--------------------
--ELEMENTAL PLANES--
--------------------
--------------------
	elseif(e.message:findi("elemental planes")) then
		if((qglobals["pop_hohb_marr"] == "1") and (qglobals["pop_bot_agnarr"] == "1") and (qglobals["pop_pon_hedge_jezith"] == "1") and (qglobals["pop_pon_construct"]  == "1") and (qglobals["pop_ponb_terris"] == "1") and (qglobals["pop_ponb_poxbourne"] == "1") and (qglobals["pop_pod_alder_fuirstel"] == "1") and (qglobals["pop_pod_grimmus_planar_projection"] == "1") and (qglobals["pop_pod_elder_fuirstel"] == "1") and (qglobals["pop_poj_mavuin"] == "1") and (qglobals["pop_poj_tribunal"] == "1") and (qglobals["pop_poj_valor_storms"] == "1") and (qglobals["pop_pov_aerin_dar"] == "1") and (qglobals["pop_pos_askr_the_lost"] == "3") and (qglobals["pop_pos_askr_the_lost_final"] == "1") and (qglobals["pop_cod_preflag"] == "1") and (qglobals["pop_cod_bertox"] == "1") and (qglobals["pop_cod_final"]  == "1") and (qglobals["pop_pot_shadyglade"] == "1") and (qglobals["pop_pot_shadyglade"] == "1") and ( qglobals["pop_pot_saryrn"] == "1") and (qglobals["pop_pot_saryrn_final"] == "1") and (qglobals["pop_hoh_faye"] == "1") and (qglobals["pop_hoh_trell"] == "1") and (qglobals["pop_hoh_garn"] == "1")) then
			e.other:Message(4,"You have completed the Elemental Flag! You now will have access to Plane of Water, Plane of Air, and Plane of Earth! Plane of Fire access is given through the killing of Solusek Ro. If you do not currently have the Plane of Fire flag, please say [unlock memories]... Otherwise, converse with the elemental and say [I am worthy of the Elemental Planes]");
		else
			e.other:Message(4,"You first must kill Agnarr and Lord Marr before you may attempt a request for an elemental flag!  The elemental flags in [Plane of Nightmare] [Plane of Disease] [Plane of Justice] [Plane of Valor] [Plane of Storms] [Bastion of Thunder] [Plane of Torment] [Lair of Terris Thule] [Halls of Honor] [Ruins of Lxanvom].");
		end
------------------
------------------
--Access to Marr--
------------------
------------------
	elseif(e.message:findi("Access to Temple of Marr") or e.message:findi("I am ready to access the Temple of Marr")) then
		if((qglobals["pop_pon_hedge_jezith"] == "1") and (qglobals["pop_pon_construct"] == "1") and (qglobals["pop_ponb_terris"] == "1") and (qglobals["pop_ponb_poxbourne"] == "1") and (qglobals["pop_poi_dragon"] == "1") and (qglobals["pop_poi_behometh_preflag"] == "1") and (qglobals["pop_poi_behometh_flag"] == "1") and (qglobals["pop_pod_alder_fuirstel"] ==1) and (qglobals["pop_pod_grimmus_planar_projection"] == "1") and (qglobals["pop_pod_elder_fuirstel"] == "1") and (qglobals["pop_poj_mavuin"] == "1") and (qglobals["pop_poj_tribunal"] == "1") and (qglobals["pop_poj_valor_storms"] == "1") and (qglobals["pop_pov_aerin_dar"] == "1") and (qglobals["pop_pos_askr_the_lost"] == "3") and (qglobals["pop_pos_askr_the_lost_final"] == "1") and (qglobals["pop_cod_preflag"] == "1") and (qglobals["pop_cod_bertox"] == "1") and (qglobals["pop_cod_final"] == "1") and (qglobals["pop_pot_shadyglade"]  == "1") and (qglobals["pop_pot_shadyglade"] == "1") and (qglobals["pop_pot_saryrn"] == "1") and (qglobals["pop_pot_saryrn_final"] == "1") and (qglobals["pop_hoh_faye"] == "1") and (qglobals["pop_hoh_trell"] == "1") and (qglobals["pop_hoh_garn"] == "1")) then
			e.other:Message(4,"You have completed your access to the Temple of Marr! Congratulations! Converse with the projection by saying [I am ready to face Lord Mithaniel Marr].");
		else
			e.other:Message(4,"To access the Temple of Marr, after you have killed Terris Thule, Saryrn, Bertox the Halls of Honor Trials, and all of the flags before this (further help, say [unlock memories]), or say [I am ready to access the Temple of Marr].");
		end
---------------------
---------------------
--Access to TORMENT--
---------------------
---------------------
	elseif(e.message:findi("Access to Torment")) then
		if((qglobals["pop_pod_alder_fuirstel"] == "1") and (qglobals["pop_pod_grimmus_planar_projection"] == "1") and (qglobals["pop_pod_elder_fuirstel"] == "1") and (qglobals["pop_pon_construct"] == "1") and (qglobals["pop_pon_hedge_jezith"] == "1") and (qglobals["pop_ponb_terris"] == "1") and (qglobals["pop_ponb_poxbourne"] == "1") and (qglobals["pop_cod_preflag"] == "1") and (qglobals["pop_cod_bertox"] == "1") and (qglobals["pop_cod_final"] == "1")) then
			e.other:Message(4,"You have full filled the requirements for the Plane of Torment! Converse with the Projection by saying [I will defeat Saryrn]");
		else
			e.other:Message(4,"To access the Plane of Torment, one must first defeat Terris Thule, Bertox, and all of the flags below them.  I am unable to find all of the required flags to allow you access to this plane currently.  Please check what you currently possess by using [unlock memories]");
		end
	end

	qglobals.pop_poj_mavuin			= nil; qglobals.pop_poi_behometh_preflag			= nil; qglobals.pop_cod_bertox			= nil; qglobals.pop_sol_ro_dresolik				= nil;
	qglobals.pop_poj_flame			= nil; qglobals.pop_poi_behometh_flag				= nil; qglobals.pop_cod_final			= nil; qglobals.pop_sol_ro_jiva					= nil;
	qglobals.pop_poj_lashing		= nil; qglobals.pop_pod_elder_fuirstel				= nil; qglobals.pop_pot_newleaf			= nil; qglobals.pop_sol_ro_rizlona				= nil;
	qglobals.pop_poj_stoning		= nil; qglobals.pop_pod_alder_fuirstel				= nil; qglobals.pop_pot_shadyglade		= nil; qglobals.pop_sol_ro_xuzl					= nil;
	qglobals.pop_poj_torture		= nil; qglobals.pop_pod_grimmus_planar_projection	= nil; qglobals.pop_pot_saryrn			= nil; qglobals.pop_sol_ro_solusk				= nil;
	qglobals.pop_poj_execution		= nil; qglobals.pop_tactics_tallon					= nil; qglobals.pop_pot_saryrn_final	= nil; qglobals.pop_elemental_grand_librarian	= nil;
	qglobals.pop_poj_hanging		= nil; qglobals.pop_tactics_vallon					= nil; qglobals.pop_hoh_faye			= nil; qglobals.pop_wind_xegony_projection		= nil;
	qglobals.pop_poj_tribunal		= nil; qglobals.pop_tactics_ralloz					= nil; qglobals.pop_hoh_trell			= nil; qglobals.pop_water_coirnav_projection	= nil;
	qglobals.pop_pon_hedge_jezith	= nil; qglobals.pop_pos_askr_the_lost				= nil; qglobals.pop_hoh_garn			= nil; qglobals.pop_fire_fennin_projection		= nil;
	qglobals.pop_pon_construct		= nil; qglobals.pop_pos_askr_the_lost_final			= nil; qglobals.pop_hohb_marr			= nil; qglobals.pop_eartha_arbitor_projection	= nil;
	qglobals.pop_ponb_poxbourne		= nil; qglobals.pop_pov_aerin_dar					= nil; qglobals.pop_bot_agnarr			= nil; qglobals.pop_earthb_rathe				= nil;
	qglobals.pop_ponb_terris		= nil; qglobals.pop_poj_valor_storms				= nil; qglobals.pop_bot_karana			= nil; qglobals.pop_time_maelin					= nil;
	qglobals.pop_poi_dragon			= nil; qglobals.pop_cod_preflag						= nil; qglobals.pop_sol_ro_arlyxir		= nil;

end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
