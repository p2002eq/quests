--Seer_Mal_Nae`Shi (202006)
--Planes of Power Flag Checklist by Daeron
--zone:  Plane of Knowledge


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("snaps from her meditation,  'Greetings traveler, I am Mal Nae`Shi.  I have come here to heighten my awareness through meditation, much can be learned through a brief exploration of one's self... Assuming there is something there to learn.  While reaching inner peace is a journey each spirit must undertake on its own, I can begin your voyage with [" .. eq.say_link("guided meditation") .. "] which will aid your memory, once you are seated.'");
	elseif(e.message:findi("guided meditation") and not e.other:IsSitting()) then
		e.other:Message(15,"Seer Mal Nae`Shi tells you, 'You will never be able to focus unless you are relaxed.  Please, sit down for a moment and allow me to [" .. eq.say_link("guide my meditation",false,"guide your meditation") .. "].'")
	elseif(e.message:findi("meditation") and e.other:IsSitting()) then
		local qglobals = eq.get_qglobals(e.other);
		local flag_order = {	PoTime(e,qglobals), BoT(e,qglobals), HoHb(e,qglobals), HoH(e,qglobals), PoV(e,qglobals), PoJ(e,qglobals), PoTorment(e,qglobals), PoN(e,qglobals), 
								CoD(e,qglobals), PoD(e,qglobals), SolroTower(e,qglobals), PoS(e,qglobals), PoTactics(e,qglobals), PoI(e,qglobals)};
		
		for k,v in pairs(flag_order) do
			local flag_list = v;
		end
	end
end

--Plane of Justice flags (VERIFIED)
function PoJ(e,qglobals)
	if qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal ~= nil then
		e.other:Message(5,"Mavuin is grateful to you for taking his case before the Tribunal. The information provided to you, that Mithaniel Marr and Karana carry information you should seek, could be quite useful.");
	elseif qglobals.pop_poj_mavuin ~= nil then
		e.other:Message(5,"The evidence of Mavuin is the only thing that can save him now.");
	end
end

--Plane of Disease flags (VERIFIED)
function PoD(e,qglobals)
	if qglobals.pop_pod_alder_fuirstel ~= nil and qglobals.pop_pod_grimmus_planar_projection ~= nil and qglobals.pop_pod_elder_fuirstel ~= nil then
		e.other:Message(5,"Now that Grummus has been destroyed, the entrance to the Crypt of Bertoxxulous should open before your might.");
	elseif qglobals.pop_pod_alder_fuirstel ~= nil and qglobals.pop_pod_grimmus_planar_projection ~= nil and qglobals.pop_pod_elder_fuirstel == nil then
		e.other:Message(5,"Grummus has been destroyed, about his corpse you found a small ward to protect from disease.");
	elseif qglobals.pop_pod_alder_fuirstel == nil and qglobals.pop_pod_grimmus_planar_projection ~= nil then
		e.other:Message(5,"For a moment you pause, sticking your hand into your pocket. Inside you find the small ward that was lying near Grummus' body, perhaps you should bring it to Milyk.");
	elseif qglobals.pop_pod_alder_fuirstel ~= nil  then
		e.other:Message(5,"Alder Fuirstel wishes you to obtain the Ward from the Plane of Disease and take it to his ill brother Milyk.");
	end
end

--Plane of Nightmare flags (VERIFIED)
function PoN(e,qglobals)
	if qglobals.pop_pon_hedge_jezith ~= nil and qglobals.pop_pon_construct ~= nil and qglobals.pop_ponb_terris ~= nil and qglobals.pop_ponb_poxbourne ~= nil then
		e.other:Message(5,"Saved from a world of eternal nightmares, Thelin is forever in your debt.");
	elseif qglobals.pop_pon_hedge_jezith ~= nil and qglobals.pop_pon_construct ~= nil and qglobals.pop_ponb_terris ~= nil and qglobals.pop_ponb_poxbourne == nil then
		e.other:Message(5,"Terris Thule's grasp over Thelin has been released");
	-- elseif qglobals.pop_pon_hedge_jezith == nil and qglobals.pop_pon_construct == nil and qglobals.pop_ponb_terris ~= nil then		--only applicable to 85/15 rule not in era for p2002
		-- e.other:Message(5,"Terris still haunts your nightmares whenever you attempt to recall your battle with her.");
	elseif qglobals.pop_pon_hedge_jezith ~= nil and qglobals.pop_pon_construct ~= nil then
		e.other:Message(5,"Thelin has completed his pact with Terris Thule, but has been refused. The only way to escape his torment now is to destroy Terris Thule.");
	elseif qglobals.pop_pon_hedge_jezith ~= nil then
		e.other:Message(5,"Thelin being tormented by the imagery of Terris Thule needs assistance escaping from the Plane of Nightmares.");	
	end
end

--Plane of Innovation flags (VERIFIED)
function PoI(e,qglobals)
	if qglobals.pop_poi_dragon ~= nil then
		e.other:Message(5,"You remember Nitram's words - 'three small turns to the right on the bottommost rivet should open the door'.");
	end
	
	if qglobals.pop_poi_behometh_flag ~= nil and (qglobals.pop_tactics_tallon == nil and qglobals.pop_tactics_vallon == nil and qglobals.pop_tactics_ralloz == nil) then	
		e.other:Message(5,"	Giwin would like you to find him in Drunder so he can present you to Rallos Zek.");
	end
end

--Plane of Valor flags (VERIFIED)
function PoV(e,qglobals)
	if qglobals.pop_poj_valor_storms ~= nil and qglobals.pop_pov_aerin_dar ~= nil then
		e.other:Message(5,"You have bested Aerin`Dar and proven yourself honorable enough to pass into Mithaniel's Halls.");
	-- elseif qglobals.pop_poj_valor_storms == nil and qglobals.pop_pov_aerin_dar ~= nil then	--only applicable to 85/15 rule not in era for p2002
		-- e.other:Message(5,"You have defeated Aerin`Dar but have yet to learn the true meaning of Justice");
	end
end

--Plane of Storms (VERIFIED)
function PoS(e,qglobals)
	if qglobals.pop_poj_valor_storms ~= nil and tonumber(qglobals.pop_pos_askr_the_lost) == 3 and qglobals.pop_pos_askr_the_lost_final ~= nil then
		e.other:Message(5,"You have obtained the Talisman of Thunderous Foyer from Askr, he seeks further assistance in the Bastion of Thunder.");
	elseif qglobals.pop_poj_valor_storms ~= nil and tonumber(qglobals.pop_pos_askr_the_lost) == 3 and qglobals.pop_pos_askr_the_lost_final == nil then
		e.other:Message(5,"You have shown your prowess in battle to Askr, now you must make strides to get to the Bastion of Thunder.");
	end
end

--Crypt of Decay (VERIFIED)
function CoD(e,qglobals)
	if qglobals.pop_pod_elder_fuirstel ~= nil and qglobals.pop_cod_bertox ~= nil and qglobals.pop_cod_final ~= nil then
		e.other:Message(5,"Saved from certain doom, Milyk and Adler are forever in your debt.");
	elseif qglobals.pop_pod_elder_fuirstel ~= nil and qglobals.pop_cod_bertox ~= nil and qglobals.pop_cod_final == nil then
		e.other:Message(5,"Bertoxxulous has been slain. The curse from Milyk has been lifted.");
	elseif qglobals.pop_pod_elder_fuirstel == nil and qglobals.pop_cod_bertox ~= nil and qglobals.pop_cod_final == nil then
		e.other:Message(5,"As you recall your memory of your battle against the Plaguebringer, an image of the Fuirstel brothers flashes through your mind.");
	elseif qglobals.pop_pod_elder_fuirstel ~= nil and qglobals.pop_cod_bertox == nil and qglobals.pop_cod_final == nil then
		e.other:Message(5,"Milyk has been saved from certain death, but is not recovering. Only by destroying the ruler of all things pestilant will his curse be lifted.");
	end
end

--Plane of Torment (VERIFIED)
function PoTorment(e,qglobals)
	if qglobals.pop_pot_saryrn_final ~= nil and qglobals.pop_maelin_lore_saryrn ~= nil then	--Saryrn Killed and Librarian hailed (Flag complete)
		e.other:Message(5,"Tylis has been removed from his agony.");
	elseif qglobals.pop_pot_saryrn_final ~= nil and qglobals.pop_maelin_lore_saryrn == nil then	--Saryrn killed and Fahlia Shadyglade hailed but librarian not hailed
		e.other:Message(5,"Saryrn has been bested. An aura surrounds the mystical symbols that have appeared on your arm.");
	elseif qglobals.pop_pot_saryrn_final == nil and qglobals.pop_pot_saryrn ~= nil and qglobals.pop_pot_newleaf ~= nil and qglobals.pop_pot_shadyglade ~= nil then	--Saryrn killed and Fahlia Shadyglade hailed but librarian not hailed
		e.other:Message(5,"You have defeated Saryrn as Tylis requested.  You should check with Fahlia to see how he is recovering.");
	elseif qglobals.pop_pot_saryrn ~= nil and (qglobals.pop_ponb_poxbourne == nil or qglobals.pop_cod_final == nil or qglobals.pop_pot_newleaf == nil or qglobals.pop_pot_shadyglade == nil) then	--Saryrn killed but issue with a pre-flag (KoS only since no 85/15)
		e.other:Message(5,"You attempt to recall your defeat of Saryrn, but whenever you try to focus you feel a searing pain on your arm.");
	elseif qglobals.pop_ponb_poxbourne ~= nil and qglobals.pop_cod_final ~= nil and qglobals.pop_pot_shadyglade ~= nil and qglobals.pop_pot_newleaf ~= nil then	--Keeper of Sorrows killed only
		e.other:Message(5,"Although it was kind of you to help him, Tylis still seems to have no idea who you are.");
	elseif qglobals.pop_ponb_poxbourne ~= nil and qglobals.pop_cod_final ~= nil and qglobals.pop_pot_shadyglade ~= nil then	--Saryrn Pre-flag done
		e.other:Message(5,"Tylis is being tortured by Saryrn. The only way for him to get away from his misery is to escape from the Plane of Torment.");	
	end
end

--Tower of Solusek Ro (VERIFIED)
function SolroTower(e,qglobals)
	if qglobals.pop_tactics_ralloz ~= nil and qglobals.pop_sol_ro_solusk ~= nil then	--Solro and RZ killed (Access to PoFire)
		e.other:Message(5,"The true route to the Plane of Fire is now clear in your mind.");
	else
		if qglobals.pop_sol_ro_miak ~= nil then	--Checks for Miak pre-flag and then lists Solro minis that have been killed
			e.other:Message(5,"The portal into the Plane of Fire has been altered. Miak needs you to find the correct way to channel the portal.");
			
			if qglobals.pop_sol_ro_arlyxir ~= nil then
				e.other:Message(5,"Arlyxir's wealth of knowledge flows through your mind.");
			end
			
			if qglobals.pop_sol_ro_dresolik ~= nil then
				e.other:Message(5,"The power of Dresolik surges through you.");
			end
			
			if qglobals.pop_sol_ro_jiva ~= nil then
				e.other:Message(5,"Jiva's strength fills your body.");
			end
			
			if qglobals.pop_sol_ro_rizlona ~= nil then
				e.other:Message(5,"Rizlona's song slips through your thoughts.");
			end
			
			if qglobals.pop_sol_ro_xuzl ~= nil then
				e.other:Message(5,"Xuzl's arcane wisdom pulses in your mind.");
			end
		end
	end
end

--Halls of Honor (VERIFIED)
function HoH(e,qglobals)
	if qglobals.pop_hoh_faye ~= nil and qglobals.pop_hoh_trell ~= nil and qglobals.pop_hoh_garn ~= nil then	--All HoH trials completed
		e.other:Message(5,"You have completed all of Honor's Trials.");
	else	--lists individual trials completed if not all 3 are complete
		if qglobals.pop_hoh_faye ~= nil then	--Rydda`Dar trial defeated
			e.other:Message(5,"You have beaten Rydda`Dar in the first of Honor's trials.");
		end
		
		if qglobals.pop_hoh_trell ~= nil then	--Rhaliq Trell trial defeated (Villagers)
			e.other:Message(5,"You have saved the villagers in the second of Honor's Trials.");
		end
		
		if qglobals.pop_hoh_garn ~= nil then	--Alekson Garn trial defeated (Maidens/Nomads)
			e.other:Message(5,"You have defeated the nomads in the third of Honor's trials.");
		end
	end
end

--Lord Mith Marr Chain (VERIFIED)
function HoHb(e,qglobals)
	--MM and Agnarr defeated but haven't completed Maelin dialogue in library
	if (qglobals.pop_maelin_lore_karana == nil or qglobals.pop_maelin_lore_mithaniel == nil) and (qglobals.pop_hohb_marr ~= nil and qglobals.pop_bot_karana ~= nil) then	
		e.other:Message(5,"The information obtained from Mithaniel is written in a language that you cannot comprehend.");
	end
	
	--MM/Saryrn/TT/Bertox chains all complete and Maelin dialogue complete
	if qglobals.pop_maelin_lore_saryrn ~= nil and qglobals.pop_maelin_lore_mithaniel ~= nil then	
		e.other:Message(5,"The Cipher of the Divine Language appears on your arms for a brief moment then fades.");
	--MM and Saryrn defeated but haven't completed Maelin dialogue in library
	elseif (qglobals.pop_maelin_lore_saryrn == nil or qglobals.pop_maelin_lore_mithaniel == nil) and (qglobals.pop_hohb_marr ~= nil and qglobals.pop_pot_saryrn_final ~= nil) then	
		e.other:Message(5,"Mithaniel has been bested. An aura surrounds the mystical symbols that have appeared on your arm.");
	end
end

--Plane of Tactics (VERIFIED)
function PoTactics(e,qglobals)
	--Vallon Zek killed (Saryrn/MM/Agnarr/Maelin chain not completed)
	if qglobals.pop_tactics_vallon ~= nil and qglobals.pop_maelin_info_zek_bros == nil and qglobals.pop_poi_behometh_flag ~= nil then	
		e.other:Message(5,"The pack of notes from Vallon are scribbled in a language that you cannot comprehend.");
	--Killed VZ but missing MB pre-flag (tactics alt-access)
	elseif qglobals.pop_tactics_vallon ~= nil and qglobals.pop_poi_behometh_flag == nil then
		e.other:Message(5,"Vallon fell before you with great ease, you seem to remember some strange pouches around his body, but… well it’s probably nothing.");
	end
	
	--Tallon Zek killed (Saryrn/MM/Agnarr/Maelin chain not completed)
	if qglobals.pop_tactics_tallon ~= nil and qglobals.pop_maelin_info_zek_bros == nil and qglobals.pop_poi_behometh_flag ~= nil then	
		e.other:Message(5,"The pack of notes from Tallon are scribbled in a language that you cannot comprehend.");
	--Killed TZ but missing MB pre-flag (tactics alt-access)
	elseif qglobals.pop_tactics_tallon ~= nil and qglobals.pop_poi_behometh_flag == nil then
		e.other:Message(5,"Tallon fell before you with great ease, you seem to remember some strange pouches around his body, but… well it’s probably nothing.");
	end
	
	--Rallos Zek killed and flagged for elementals (Not yet completed SRT flag chain)
	if qglobals.pop_elemental_grand_librarian ~= nil and qglobals.pop_sol_ro_solusk == nil then
		e.other:Message(5,"The parchments of Rallos are scribed in a language that you cannot comprehend; they do however have detailed drawings of the manaetic behemoth that you have already destroyed.");
	--Saryrn/MM/VZ/TZ/Maelin chain complete - flagged for Solro but missing RZ
	elseif qglobals.pop_tactics_ralloz == nil and qglobals.pop_maelin_info_zek_bros ~= nil then
		e.other:Message(5,"The words of Maelin echo in your mind, 'The Zeks and Solusek are planning an invasion in Norrath, find out more from Rallos if you can.");
	--RZ killed but missing pre-flags (only result of tactics alt-access flag)
	elseif qglobals.pop_tactics_ralloz ~= nil and (qglobals.pop_tactics_vallon == nil or qglobals.pop_tactics_tallon == nil or qglobals.pop_poi_behometh_flag == nil or qglobals.pop_hohb_marr == nil or qglobals.pop_pot_saryrn_final == nil or qglobals.pop_bot_karana == nil ) then
		e.other:Message(5,"Your heart beat speeds as you recall the Warlord's flaming axe, behind the dark sockets of his helm you sense darker intentions.");
	end
end

--Bastion of Thunder (VERIFIED)
function BoT(e,qglobals)
	if qglobals.pop_elemental_grand_librarian ~= nil then
		e.other:Message(5,"Learning of Zebuxoruk's fate, the only way to save him is gather materials that will allow you to power up the machine to send you into the Plane of Time. Maelin has charged you with finding an elemental power source sufficient to activate Meldrath's time machine.");
	--Completed Agnarr/LMM/Saryrn pre-flagging but haven't killed RZ yet
	elseif qglobals.pop_maelin_lore_karana ~= nil and qglobals.pop_maelin_lore_mithaniel ~= nil and qglobals.pop_maelin_lore_saryrn ~= nil and qglobals.pop_tactics_ralloz == nil then
		e.other:Message(5,"The History translated for you reveals the fate of Zebuxoruk. Trapped in the Plane of Time you must gain the power of the elements to gain entrance.");
	--MM and Agnarr defeated but haven't completed Maelin dialogue in library
	elseif (qglobals.pop_maelin_lore_karana == nil or qglobals.pop_maelin_lore_mithaniel == nil) and (qglobals.pop_hohb_marr ~= nil and qglobals.pop_bot_karana ~= nil) then	
		e.other:Message(5,"The information obtained from Karana is written in a language that you cannot comprehend.");
	end
end

--Plane of Time (VERIFIED)
function PoTime(e,qglobals)
	if qglobals.pop_time_maelin ~= nil and qglobals.pop_elemental_grand_librarian ~= nil then
		e.other:Message(5,"Your soul has formed a bond with the Plane of Time. You can now pass through the portal in the Plane of Tranquility safely.");
	end
end


