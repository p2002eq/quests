function event_say(e)
	local qglobals = eq.get_qglobals(e.other);

	if(
	tonumber(qglobals.pop_poj_mavuin)						== 1 and tonumber(qglobals.pop_tactics_ralloz)			== 1 and tonumber(qglobals.pop_hoh_faye)			== 1 and
	tonumber(qglobals.pop_poj_tribunal)						== 1 and tonumber(qglobals.pop_pos_askr_the_lost)		== 3 and tonumber(qglobals.pop_hoh_trell)			== 1 and
	tonumber(qglobals.pop_pon_hedge_jezith)					== 1 and tonumber(qglobals.pop_pos_askr_the_lost_final)	== 1 and tonumber(qglobals.pop_hoh_garn)			== 1 and
	tonumber(qglobals.pop_pon_construct)					== 1 and tonumber(qglobals.pop_pov_aerin_dar)			== 1 and tonumber(qglobals.pop_hohb_marr)			== 1 and
	tonumber(qglobals.pop_ponb_terris)						== 1 and tonumber(qglobals.pop_poj_valor_storms)		== 1 and tonumber(qglobals.pop_pot_shadyglade)		== 1 and
	tonumber(qglobals.pop_ponb_poxbourne)					== 1 and tonumber(qglobals.pop_cod_preflag)				== 1 and tonumber(qglobals.pop_pot_saryrn)			== 1 and
	tonumber(qglobals.pop_pod_grimmus_planar_projection)	== 1 and tonumber(qglobals.pop_cod_bertox)				== 1 and tonumber(qglobals.pop_pot_saryrn_final)	== 1 and
	tonumber(qglobals.pop_pod_elder_fuirstel)				== 1 and tonumber(qglobals.pop_cod_final)				== 1 and tonumber(qglobals.pop_bot_agnarr)			== 1)then -- Elemental Pre-Flagging

		if(e.message:findi("Hail")) then
			e.self:Say("'Welcome back my friends. I assure you that I have been studying the Cipher of Druzzil very diligently. Did you happen to find any lore or information that I could look at?'");
		elseif(e.message:findi("lore")) then
			e.self:Say("'A parchment of Rallos'? Let me read it, it says that Rallos was not alone in his feelings about mortals. Solusek Ro also holds stake in the war to be led on Norrath. Not only this but he is channeling power from his father's plane into his own. He is taking that power and intensifying it through an artifact of great power, and then focusing it onto one point. It is a detailed as a crystal that burns with all the powers of the plane of fire. It is said to have the ability to turn the face of Norrath into a charred wasteland. They plan for a manaetic behemoth to carry and deposit it upon Norrath. You must stop these plans, you must stop Solusek!'");
		elseif(e.message:findi("information")) then
			e.self:Say("'There is no way to escape from the prison that is The Plane of Time. I am sorry but your quest for information ends here. Time is something that none of us can escape. That is however.. back when my explorations of the Planes were more common, I would travel searching for knowledge and lore to bring back to Tanaan. I stumbled into the Plane of Innovation. It was a great marvel to see indeed. I found the creator of all things mechanical. Meldrath the Marvelous was a kind and just gnome. We spent many weeks together discussing all of his devices. This included a machine that would allow you to open a tear into a period of time and enter into that time. The machine was more of a flight of whimsy though as the power necessary to power such a machine was enormous. He jokingly equated needing the very essence of the elements to power it.'");
			e.self:Emote("Maelin takes a deep breath and continues, 'I can see now that he was not joking at all. Let us suppose that you travelers could venture into the Elemental Planes and retrieve this essence; and form it into one powerful conglomeration. You could open a tear into the period of time before Zebuxoruk was imprisoned. There is no way you can free him from his stasis now, but if you were to halt the Pantheon at the time of imprisonment. Hah! It could work I do believe. Forgive me, but my old gnomish heart is alive with the excitement of possibilities. Gather up your strength friends, travel into the deep elements. You will need all of your wits about you. Find the very essence of the elementals, and fuse them into one. How to combine them I do not know, and can only wish you luck on finding that information. If you can accomplish this please come get me. I would like to record the events as they take place!'");
			eq.set_global("pop_elemental_grand_librarian","1",5,"F");
			e.other:Message(4,"You receive a character flag!");
		end
	end
	if(e.other:HasItem(29165)) then -- Issues with the server code dealing with this call.
		if(e.message:findi("Hail")) then
			e.self:Say("The Quintessence! Oh my this is amazing! I have come into contact with Chronographer Muon in the realm of innovation. Go to him, show him you have the power to activate machine. I shall meet you there, this I must see!");
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

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
