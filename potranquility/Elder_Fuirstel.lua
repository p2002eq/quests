--Elder_Fuirstel (203375)
--Grummus/Crypt of Decay Planar Progression
--potranquility

--	Pre-req flags required:
-- 	qglobals.pop_pod_alder_fuirstel -- PoDisease Pre-Flag (said "what ward" to Adler Fuirstel)
--  qglobals.pop_ponb_poxbourne -- Spoken to Poxbourne after killing Terris (Completed PoNightmares)

--	Flagging Steps:
-- 	(1)	qglobals.pop_pod_elder_fuirstel (1) -- Hail Elder for Pre-Flag (Start CoDecay Questline)
-- 	(2)	qglobals.pop_cod_bertox (1)	--Bertoxx Event Complete (Note: Carprin Deatharn flag not required for progression)
--	(3)	qglobals.pop_cod_final (1) --Hailed Elder Fuirstel after Bertoxx Killed (CoDecay Questline Complete)

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	--Quest dialogue if hailed without Adler Fuirstel pre-flag or Grummus not killed
	if(e.message:findi("hail") and (qglobals.pop_pod_alder_fuirstel == nil or qglobals.pop_pod_grimmus_planar_projection == nil)) then
		e.self:Emote("groans in agony.  His tainted breath surrounds your face.");
		
	--Starting CoDecay Quest dialogue with completed Pre-flags done
	elseif(e.message:findi("hail") and qglobals.pop_pod_alder_fuirstel ~= nil and qglobals.pop_pod_grimmus_planar_projection ~= nil and qglobals.pop_pod_elder_fuirstel == nil) then
		e.self:Emote("slowly turns towards you. You can feel the heat radiating from his face. The warding that envelopes your body reaches out and begins to surround him. You immediately see improvement in his condition. The pus filled sores covering his face and his burning fever start to vanish.");
		e.self:Say("Thank you friend. I no longer feel the touch of death on my soul. However I do feel the grasp on Bertoxxulous, his plague is still upon me but not spreading throughout my body. I fear the only way to remove this pox would be to weaken Bertoxxulous enough that his curse would be lifted. I now renounce my faith in Bertoxxulous, please fell this god so that I may continue and learn from my mistakes.");
		eq.set_global("pop_pod_elder_fuirstel", "1", 5, "F");
		e.other:Message(15,"You've received a character flag!");
	
	--Quest Dialogue after Bertoxx is dead and have all pre-flags
	elseif (e.message:findi("hail") and qglobals.pop_pod_elder_fuirstel ~= nil and qglobals.pop_cod_bertox ~= nil) then
		e.self:Say("Welcome back friend.  I must tell you that my brother and I shall never forget what you have done for us.  We have since renounced our following of Bertoxxulous, for in him we only found suffering.  We have joined a new following, learning from the gods without their direct influence over us.  I shall not keep you though, thank you once again!");
		if qglobals.pop_cod_final == nil then
			eq.set_global("pop_cod_final","1",5,"F");
			e.other:Message(15,"You've received a character flag!");
		end
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end



-- {
-- pop_pon_hedge_jezith=nil;
-- pop_pon_construct=nil;
-- pop_ponb_terris=nil;
-- pop_ponb_poxbourne=nil;
-- pop_poi_dragon=nil;
-- pop_poi_behometh_preflag=nil;
-- pop_poi_behometh_flag=nil;
-- pop_pod_alder_fuirstel=nil;
-- pop_pod_grimmus_planar_projection=nil;
-- pop_pod_elder_fuirstel=nil;
-- pop_poj_mavuin=nil;
-- pop_poj_tribunal=nil;
-- pop_poj_valor_storms=nil;
-- pop_poj_execution=nil;
-- pop_poj_flame=nil;
-- pop_poj_hanging=nil;
-- pop_poj_lashing=nil;
-- pop_poj_stoning=nil;
-- pop_poj_torture=nil;
-- pop_pov_aerin_dar=nil;
-- pop_pos_askr_the_lost=nil;
-- pop_pos_askr_the_lost_final=nil;
-- pop_cod_preflag =nil;
-- pop_cod_bertox=nil;
-- pop_cod_final=nil;
-- pop_pot_shadyglade=nil;
-- pop_pot_newleaf=nil;
-- pop_pot_saryrn=nil;
-- pop_pot_saryn_final=nil;
-- pop_hoh_faye=nil;
-- pop_hoh_trell=nil;
-- pop_hoh_garn=nil;
-- pop_hohb_marr=nil;
-- pop_bot_agnarr=nil;
-- pop_bot_karana=nil;
-- pop_tactics_tallon =nil;
-- pop_tactics_vallon=nil;
-- pop_tactics_ralloz=nil;
-- pop_elemental_grand_librarian=nil;
-- pop_sol_ro_arlyxir=nil;
-- pop_sol_ro_dresolik=nil;
-- pop_sol_ro_jiva=nil;
-- pop_sol_ro_rizlona=nil;
-- pop_sol_ro_xuzl=nil;
-- pop_sol_ro_solusk=nil;
-- pop_fire_fennin_projection=nil;
-- pop_wind_xegony_projection=nil;
-- pop_water_coirnav_projection=nil;
-- pop_eartha_arbitor_projection=nil;
-- pop_earthb_rathe=nil;
-- pop_time_maelin=nil;
-- }
-- }