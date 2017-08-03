----------------------------------------------------------------------
-- Arc: Justice Flagging
-- Zone: Plane of Justice
-- NPC: Mavuin
-- Flags Used: pop_poj_mavuin, pop_poj_tribunal, pop_poj_valor_storms
----------------------------------------------------------------------

function event_say(e)
    local qglobals = eq.get_qglobals(e.other);

    if(e.message:findi("Hail") and (qglobals["pop_poj_mavuin"] ~= "1")) then
        e.self:Say("I have been locked away, shamed for a reason that is not my own! Take [" .. eq.say_link("what information",false,"this information") .. "], I beg of you! It may be the only chance to prove that I am truly innocent!");
    elseif(e.message:findi("what information") and (qglobals["pop_poj_mavuin"] ~= "1")) then
        e.self:Say("Oh, excuse me... The Tribunal is not a being who deals with parchment and quills, he will test you to allow me to [" .. eq.say_link("plea your case",false,"plea my case") .. "].  When you tell him of my request, be prepared, ".. e.other:GetName() .. ".");
    elseif(e.message:findi("plea your case") and (qglobals["pop_poj_mavuin"] ~= "1")) then
        e.self:Say("Thank you! Oh I wish you luck.");
        eq.set_global("pop_poj_mavuin","1",5,"F");
        e.other:Message(7,"You receive a character flag!");
    elseif(e.message:findi("plea your case") and (qglobals["pop_poj_mavuin"] == "1") and (qglobals["pop_poj_tribunal"] == "1")) then
        e.self:Say("So you have pleaded my case to the Tribunal, I am most thankful. I hope that they will listen to my case soon and release me. The knowledge that I promised you is this. The followers in the Plane of Tranquility are trying to find information on what has happened to Zebuxoruk. What I know is that he has been captured for a second time. If you want to find out more information I believe you should seek an audience with Karana and Mithaniel Marr. I can only assume that they were present at the time of his capture and know why this has taken place. Also seek from Marr a way to translate the divine language. Only with it can you understand the writing of the gods. There is no more that I can tell you, but thank you once again for your attempt in returning my freedom.");
        eq.set_global("pop_poj_valor_storms","1",5,"F");
        e.other:Message(7,"You receive a character flag!");
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