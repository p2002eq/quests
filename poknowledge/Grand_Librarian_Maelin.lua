--Maelin flag steps:

--Pre-elemental Flags used
--pop_maelin_lore_mithaniel  --Cipher of druzzil
--pop_maelin_lore_saryrn	--divine symbols from saryrn
--pop_maelin_lore_karana	--translated document with details on Zebuxoruk
--pop_maelin_info_zek_bros	--RZ invasion plans for Norrath (VZ/TZ/Saryrn/MM/Bert/TT progression lines completed)
--pop_maelin_info_rallos (not required for progression - hints to kill Solro after RZ is dead and pre-flags are in check)
--pop_elemental_grand_librarian (ELEMENTAL FLAGGED - not including Plane of Fire)

--PENDING POTIME ACCESS



function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	--all elemental pre-flags obtained and elemental flag received from librarian (may initially exclude PoFire if Solro has not been killed)
	if (e.message:findi("hail") or e.message:findi("lore") or (e.message:findi("information") and qglobals.pop_maelin_info_rallos ~= nil and qglobals.pop_sol_ro_solusk ~= nil)) and qglobals.pop_elemental_grand_librarian ~= nil then
		e.self:Say("As I have told you, you must retrieve the elemental essence from each elemental plane so that we can activate the machine in the Plane of Innovation that will open a portal into the shard of time that Zebuxoruk is held.");
	
	--other hail text responses
	elseif e.message:findi("hail") and qglobals.pop_maelin_lore_mithaniel ~= nil then  --already has received flag for Cipher of Druzzil from MM
		e.self:Say("Welcome back my friends.  I assure you that I have been studying the Cipher of Druzzil very diligently.  Did you happen to find any lore or information that I could look at?");

	--"what lore" responses for Maelin
		
	--Recieved all "what lore" flags from Maelin and killed RZ (Sol ro not dead)  --not required step
	elseif e.message:findi("information") and qglobals.pop_maelin_info_rallos == nil and qglobals.pop_maelin_info_zek_bros ~= nil and qglobals.pop_maelin_lore_karana ~= nil and qglobals.pop_tactics_ralloz ~= nil and  qglobals.pop_sol_ro_solusk == nil then
		e.self:Say("'A parchment of Rallos'?  Let me read it, it says that Rallos was not alone in his feelings about mortals.  Solusek Ro also holds stake in the war to be led on Norrath.  Not only this but he is channeling power from his father's plane into his own.  He is taking that power and intensifying it through an artifact of great power, and then focusing it onto one point.  It is a detailed as a crystal that burns with all the powers of the plane of fire.  It is said to have the ability to turn the face of Norrath into a charred wasteland.  They plan for a manaetic behemoth to carry and deposit it upon Norrath.  You must stop these plans, you must stop Solusek!");
		eq.set_global("pop_maelin_info_rallos","1",5,"F");
		e.other:Message(15,"You've received a character flag!");
	
	--Recieved all "what lore" flags from Maelin but haven't killed RZ (requires TZ/VZ kills and said "what information" to Maelin)
	elseif e.message:findi("lore") and qglobals.pop_maelin_info_zek_bros ~= nil and qglobals.pop_maelin_lore_karana ~= nil and qglobals.pop_tactics_ralloz == nil then	--flag already gotten but RZ still not dead
		e.self:Say("As I have already told you, Rallos must be stopped!  The war he plans to rage on Norrath could have devastating effects on not only that planet but all planes of existence!");
	
	--Karana Lore Flag (Librarian MM and Saryrn flags already received by saying "what lore" previously - must have killed Agnarr/recieved Karana flag)
	elseif e.message:findi("lore") and qglobals.pop_maelin_lore_karana == nil and qglobals.pop_bot_karana ~= nil and qglobals.pop_maelin_lore_mithaniel ~= nil and qglobals.pop_maelin_lore_saryrn ~= nil then
		e.self:Say("This is quite interesting friends.  It is a detailed document on what has become of Zebuxoruk.  It seems that he had been tampering with translating works of the gods for mortals.  This knowledge was leading them to enlightenment and finally to ascention into dietyhood.  This angered the gods, for they felt that any diety should be chosen by them.  Ascension of any mortal was not something they were prepared to deal with.");
		eq.set_global("pop_maelin_lore_karana","1",5,"F");
		e.other:Message(15,"You've received a character flag!");
	
	--Saryrn Lore Flag (Librarian MM flag received for Cipher of Druzzil by saying "what lore" previously)
	elseif e.message:findi("lore") and qglobals.pop_maelin_lore_saryrn == nil and qglobals.pop_maelin_lore_mithaniel ~= nil and qglobals.pop_pot_saryrn_final ~= nil then
		e.self:Say("What is this that you have found?  It appears to be written in the divine language.  Let me see, the writing on the front seems to indicate that it is some sort of journal of things already passed.  I cannot make heads or tails of the rest of it though, there must be another piece.");
		eq.set_global("pop_maelin_lore_saryrn","1",5,"F");
		e.other:Message(15,"You've received a character flag!");
	
	--Mith Marr Lore Flag (Mith Marr questline completed)
	elseif e.message:findi("lore") and qglobals.pop_maelin_lore_mithaniel == nil and qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal ~= nil and qglobals.pop_poj_valor_storms ~= nil and qglobals.pop_pov_aerin_dar ~= nil and qglobals.pop_hoh_faye ~= nil and qglobals.pop_hoh_trell ~= nil and qglobals.pop_hoh_garn ~= nil and qglobals.pop_hohb_marr ~= nil then	--LMM  quest line is complete
		e.self:Say("Astounding, this truly is the Cipher of Druzzil!  I shall take notes from your knowledge and try to learn from it.  If you happen upon any artifacts that have writings in the language of the gods bring them back to me and I will do my best to read them to you in common tongue.");
		eq.set_global("pop_maelin_lore_mithaniel","1",5,"F");
		e.other:Message(15,"You've received a character flag!");

	--what information response
	
	--pre-flagged for elementals, but need librarian elemental flag
	elseif e.message:findi("information") and qglobals.pop_tactics_ralloz ~= nil and qglobals.pop_bot_karana ~= nil and qglobals.pop_maelin_info_zek_bros ~= nil and qglobals.pop_maelin_lore_mithaniel ~= nil and qglobals.pop_maelin_lore_saryrn ~= nil and qglobals.pop_maelin_lore_karana ~= nil and qglobals.pop_elemental_grand_librarian == nil then	--grants elemental pre-flag
		e.self:Say("There is no way to escape from the prison that is The Plane of Time.  I am sorry but your quest for information ends here.  Time is something that none of us can escape.  That is however... back when my explorations of the Planes were more common, I would travel searching for knowledge and lore to bring back to Tanaan.  I stumbled into the Plane of Innovation.  It was a great marvel to see indeed.  I found the creator of all things mechanical.  Meldrath the Marvelous was a kind and just gnome.  We spent many weeks together discussing all of his devices.  This included a machine that would allow you to open a tear into a period of time and enter into that time.  The machine was more of a flight of whimsy though as the power necessary to power such a machine was enormous.  He jokingly equated needing the very essence of the elements to power it.");
		e.self:Emote("takes a deep breath and continues, 'I can see now that he was not joking at all.  Let us suppose that you travelers could venture into the Elemental Planes and retrieve this essence; and form it into one powerful conglomeration.  You could open a tear into the period of time before Zebuxoruk was imprisoned.  There is no way you can free him from his stasis now, but if you were to halt the Pantheon at the time of imprisonment.   Hah!  It could work I do believe.  Forgive me, but my old gnomish heart is alive with the excitement of possibilities.  Gather up your strength friends, travel into the deep elements.  You will need all of your wits about you.  Find the very essence of the elementals, and fuse them into one.  How to combine them I do not know, and can only wish you luck on finding that information.  If you can accomplish this please come get me.  I would like to record the events as they take place!'");
		eq.set_global("pop_elemental_grand_librarian","1",5,"F");
		e.other:Message(15,"You've received a character flag!");
	
	elseif e.message:findi("information") and qglobals.pop_maelin_info_zek_bros ~= nil and qglobals.pop_tactics_ralloz == nil then	--flag already gotten but RZ still not dead
		e.self:Say("As I have already told you, Rallos must be stopped!  The war he plans to rage on Norrath could have devastating effects on not only that planet but all planes of existence!");

	--Rallos Zek line (must have TZ,VZ,Saryrn and MM flags + pre-flags)
	elseif e.message:findi("information") and qglobals.pop_maelin_info_zek_bros == nil and qglobals.pop_pot_saryrn_final ~= nil and qglobals.pop_pov_aerin_dar ~= nil and qglobals.pop_hohb_marr ~= nil and qglobals.pop_poi_behometh_flag ~= nil and qglobals.pop_tactics_tallon ~= nil and qglobals.pop_tactics_vallon ~= nil then
		e.self:Say("This cannot be.  You must hurry!  Rallos Zek seems to be planing a massive raid on Norrath.  He is tired of mortals overstepping their boundaries!  You are the only hope!  Go challenge Rallos, hurry!");
		eq.set_global("pop_maelin_info_zek_bros","1",5,"F");
		e.other:Message(15,"You've received a character flag!");

	elseif e.message:findi("information") and qglobals.pop_maelin_info_zek_bros == nil and qglobals.pop_maelin_lore_karana ~= nil then
		e.self:Say("Now that we have learned what has been planned for Norrath, might I suggest that you try to obtain any lore that you can while traveling the planes?  I would like to learn from any history written in the divine language that you might come across.");
	
	--No flag responses
	elseif e.message:findi("hail") then	--no flags
		e.self:Say("Welcome to Myrist!  This is truly something for me to be proud of.  All of the knowledge you can find here in this library is because of many years of hard work gathering data.  If you happen to come across any especially interesting information come bring it to me and I will try to catalogue it for the library.");
	elseif e.message:findi("lore") then
		e.self:Say("Come now, I don't see any new lore about you.  There is no reason to be dishonest with me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13017})) then
		e.self:Say("Thank you traveler. I appreciate having pie this time of year. I can never get away to enjoy such things.");
		e.other:SummonItem(22291);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

