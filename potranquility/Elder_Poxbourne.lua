--Elder_Poxbourne (203374)  Thelin Poxbourne
--Terris Thule/Plane of Nightmare Planar Progression
--potranquility

-- Pre-flags required:  
-- None

-- Flagging Steps:
-- (1) qglobals.pop_pon_hedge_jezith (1) -- Spoken to Jezith in PoTranq (Pre-Flag)
-- (2) qglobals.pop_pon_construct (1) -- Killed Construct of Nightmares (PoNB - Terris Lair Flag)
-- (3)qglobals.pop_ponb_terris (1) -- Killed Terris Thule
-- (4)qglobals.pop_ponb_poxbourne (1) -- Spoken to Poxbourne after killing Terris (Completed PoNightmares)

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);

-- e.self:Say("hedge: "..qglobals.pop_pon_hedge_jezith);
-- e.self:Say("consturct: ".. qglobals.pop_pon_construct);
-- e.self:Say("terris: ".. qglobals.pop_ponb_terris);
  if(e.message:findi('hail')) then
    if (tonumber(qglobals.pop_pon_construct) > 1) then
			eq.set_global("pop_pon_construct","1",5,"F");
    end
  end


	if(e.message:findi("hail") and tonumber(qglobals.pop_pon_hedge_jezith) == 1 and tonumber(qglobals.pop_pon_construct) == 1 and tonumber(qglobals.pop_ponb_terris) == 1) then
		e.other:Message(7,"Thelin tells you, 'I apologize but I cannot stand to greet you. I am still quite weak and recovery will be a long and painful road, though it is a most welcome venture. I want you to know how much I appreciate your bravery in helping me. I am forever in your debt.'");
		if qglobals.pop_ponb_poxbourne == nil then
			eq.set_global("pop_ponb_poxbourne", "1", 5, "F");
			e.other:Message(15,"You've received a character flag!");
		end
	elseif e.message:findi("hail") then
		e.other:Message(7,"Thelin tosses and turns violently on the floor, then is still.");
		eq.signal(203366,1);	--Adroha_Jezith (203366)
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end



-- $qglobals{pop_pon_hedge_jezith}=undef;
-- $qglobals{pop_pon_construct}=undef;
-- $qglobals{pop_ponb_terris}=undef;
-- $qglobals{pop_ponb_poxbourne}=undef;
-- $qglobals{pop_poi_dragon}=undef;
-- $qglobals{pop_poi_behometh_preflag}=undef;
-- $qglobals{pop_poi_behometh_flag}=undef;
-- $qglobals{pop_pod_alder_fuirstel}=undef;
-- $qglobals{pop_pod_grimmus_planar_projection}=undef;
-- $qglobals{pop_pod_elder_fuirstel}=undef;
-- $qglobals{pop_poj_mavuin}=undef;
-- $qglobals{pop_poj_tribunal}=undef;
-- $qglobals{pop_poj_valor_storms}=undef;
-- $qglobals{pop_poj_execution}=undef;
-- $qglobals{pop_poj_flame}=undef;
-- $qglobals{pop_poj_hanging}=undef;
-- $qglobals{pop_poj_lashing}=undef;
-- $qglobals{pop_poj_stoning}=undef;
-- $qglobals{pop_poj_torture}=undef;
-- $qglobals{pop_pov_aerin_dar}=undef;
-- $qglobals{pop_pos_askr_the_lost}=undef;
-- $qglobals{pop_pos_askr_the_lost_final}=undef;
-- $qglobals{pop_cod_preflag }=undef;
-- $qglobals{pop_cod_bertox}=undef;
-- $qglobals{pop_cod_final}=undef;
-- $qglobals{pop_pot_shadyglade}=undef;
-- $qglobals{pop_pot_newleaf}=undef;
-- $qglobals{pop_pot_saryrn}=undef;
-- $qglobals{pop_pot_saryn_final}=undef;
-- $qglobals{pop_hoh_faye}=undef;
-- $qglobals{pop_hoh_trell}=undef;
-- $qglobals{pop_hoh_garn}=undef;
-- $qglobals{pop_hohb_marr}=undef;
-- $qglobals{pop_bot_agnarr}=undef;
-- $qglobals{pop_bot_karana}=undef;
-- $qglobals{pop_tactics_tallon }=undef;
-- $qglobals{pop_tactics_vallon}=undef;
-- $qglobals{pop_tactics_ralloz}=undef;
-- $qglobals{pop_elemental_grand_librarian}=undef;
-- $qglobals{pop_sol_ro_arlyxir}=undef;
-- $qglobals{pop_sol_ro_dresolik}=undef;
-- $qglobals{pop_sol_ro_jiva}=undef;
-- $qglobals{pop_sol_ro_rizlona}=undef;
-- $qglobals{pop_sol_ro_xuzl}=undef;
-- $qglobals{pop_sol_ro_solusk}=undef;
-- $qglobals{pop_fire_fennin_projection}=undef;
-- $qglobals{pop_wind_xegony_projection}=undef;
-- $qglobals{pop_water_coirnav_projection}=undef;
-- $qglobals{pop_eartha_arbitor_projection}=undef;
-- $qglobals{pop_earthb_rathe}=undef;
-- $qglobals{pop_time_maelin}=undef;
-- }
-- }