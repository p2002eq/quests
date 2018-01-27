--Fahlia_Shadyglade (203372)
--potranquility

--	Pre-req flags required:
--	qglobals.pop_cod_final (1) --Hailed Elder Fuirstel after Bertoxx Killed (CoDecay Questline Complete)
-- 	qglobals.pop_pod_grimmus_planar_projection -- Killed Grummus and hailed Planar Projection (PoD Flags Finished)

-- Flagging Steps:
-- (1) qglobals.pop_pot_shadyglade (1) -- Pre-Flag Fahlia Shadyglade
-- (2) qglobals.pop_pot_newleaf (1) -- Killed Keeper of Sorrows (requires pre-req flag from Fahlia Shadyglade)
-- (3) qglobals.pop_pot_saryrn (1) -- Killed Saryrn and Hailed PP
-- (4) qglobals.pop_pot_saryrn_final (1) -- Spoke to Shadyglade for final flag (Completed PoTorment)


function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if (tonumber(qglobals.pop_cod_final) == 1 and tonumber(qglobals.pop_ponb_poxbourne) == 1) then
		if (tonumber(qglobals.pop_pot_saryrn) == 1 and tonumber(qglobals.pop_pot_newleaf) == 1 and tonumber(qglobals.pop_pot_shadyglade) == 1) then
			if (e.message:findi("Hail")) then
				e.self:Say("This is wonderful! I am so happy that you could help to free Tylis from Saryrn's grasp!  Please try not to bother him too much. He will need time to recover.");
				if qglobals.pop_pot_saryrn_final == nil then
					eq.set_global("pop_pot_saryrn_final","1",5,"F");
					e.other:Message(15,"You've received a character flag!");
				end
			end
		else
			if e.message:findi("hail") then
				e.self:Say("Greetings travelers. Please excuse me but I must attend to Tylis for his [" .. eq.say_link("condition") .. "] does not improve.'");
			elseif (e.message:findi("condition")) then
				e.self:Say("It all goes back to when I found him. I had just purchased a new fishing pole in the hopes of finding some time to relax on the shores of the island. As I was walking out of the shop, I heard a distant moan. I walked toward the source and found Tylis lying by the reflecting pool. The pool was different, though. It now had a small [" .. eq.say_link("black cube") .. "] floating over it. I tried to wake Tylis but was not successful. I then brought him here and have been caring for him since.'");
			elseif (e.message:findi("black cube")) then
				e.self:Say("I do not like that cube at all. Just thinking of it brings pain to my mind. Gazing upon it gives the sensation of being slowly rent apart at each limb. I believe that whatever has fallen over Tylis is related to this cursed cube. Other elders claim that it is a portal that will lead into the [" .. eq.say_link("Plane of Torment") .. "].");
			elseif (e.message:findi("Plane of Torment")) then
				e.self:Say("It is not a plane that was originally sought to be reached by our elders. It is their belief though that Saryrn, the Mistress of Torment, intends to breed her suffering even into this protected plane of Quellious. I wish I had the strength to [" .. eq.say_link("I will go",false,"go") .. "] into the Plane of Torment and find out exactly the nature of the current circumstances to have afflicted Tylis, but I cannot leave his side in good conscience.'");
			elseif (e.message:findi("I will go")) then
				e.self:Say("Wonderful. I did not think that an outsider was one that I could trust to aid me in this. One name that Tylis has mentioned in agony is that of Maareq. I do not know whom this is, but he must be instrumental in Tylis' suffering. You must find Maareq and do what you must to release Tylis from this torture.'");
				if qglobals.pop_pot_shadyglade == nil then
					eq.set_global("pop_pot_shadyglade","1",5,"F");
					e.other:Message(15,"You've received a character flag!");
				end
			end
		end
	elseif e.message:findi("hail") then
		e.self:Say("Greetings travelers. Please excuse me but I must attend to Tylis for his [" .. eq.say_link("condition") .. "] does not improve.'");
	elseif e.message:findi("condition") then
		e.self:Say("I can see that you may be passionate to help others but now I must ask you to be about your own business. I sense that if you were to try to help you may befall the same fate as poor Tyllis. Perhaps you should become more experienced in travelling through the planes before you learn more about his condition.");
	end
end




-- {
-- qglobals.pop_pon_hedge_jezith=undef;
-- qglobals.pop_pon_construct=undef;
-- qglobals.pop_ponb_terris=undef;
-- qglobals.pop_ponb_poxbourne=undef;
-- qglobals.pop_poi_dragon=undef;
-- qglobals.pop_poi_behometh_preflag=undef;
-- qglobals.pop_poi_behometh_flag=undef;
-- qglobals.pop_pod_alder_fuirstel=undef;
-- qglobals.pop_pod_grimmus_planar_projection=undef;
-- qglobals.pop_pod_elder_fuirstel=undef;
-- qglobals.pop_poj_mavuin=undef;
-- qglobals.pop_poj_tribunal=undef;
-- qglobals.pop_poj_valor_storms=undef;
-- qglobals.pop_poj_execution=undef;
-- qglobals.pop_poj_flame=undef;
-- qglobals.pop_poj_hanging=undef;
-- qglobals.pop_poj_lashing=undef;
-- qglobals.pop_poj_stoning=undef;
-- qglobals.pop_poj_torture=undef;
-- qglobals.pop_pov_aerin_dar=undef;
-- qglobals.pop_pos_askr_the_lost=undef;
-- qglobals.pop_pos_askr_the_lost_final=undef;
-- qglobals.pop_cod_preflag =undef;
-- qglobals.pop_cod_bertox=undef;
-- qglobals.pop_cod_final=undef;
-- qglobals.pop_pot_shadyglade=undef;
-- qglobals.pop_pot_newleaf=undef;
-- qglobals.pop_pot_saryrn=undef;
-- qglobals.pop_pot_saryrn_final=undef;
-- qglobals.pop_hoh_faye=undef;
-- qglobals.pop_hoh_trell=undef;
-- qglobals.pop_hoh_garn=undef;
-- qglobals.pop_hohb_marr=undef;
-- qglobals.pop_bot_agnarr=undef;
-- qglobals.pop_bot_karana=undef;
-- qglobals.pop_tactics_tallon =undef;
-- qglobals.pop_tactics_vallon=undef;
-- qglobals.pop_tactics_ralloz=undef;
-- qglobals.pop_elemental_grand_librarian=undef;
-- qglobals.pop_sol_ro_arlyxir=undef;
-- qglobals.pop_sol_ro_dresolik=undef;
-- qglobals.pop_sol_ro_jiva=undef;
-- qglobals.pop_sol_ro_rizlona=undef;
-- qglobals.pop_sol_ro_xuzl=undef;
-- qglobals.pop_sol_ro_solusk=undef;
-- qglobals.pop_fire_fennin_projection=undef;
-- qglobals.pop_wind_xegony_projection=undef;
-- qglobals.pop_water_coirnav_projection=undef;
-- qglobals.pop_eartha_arbitor_projection=undef;
-- qglobals.pop_earthb_rathe=undef;
-- qglobals.pop_time_maelin=undef;
-- }
-- }
