-- Trust_InMyReboots (202346) in PoK for anniversary quest!
local playerCount = 0;
local players = {};
local questions = {[1] = { "What year was everquest released?", "1999"},
[2] = {"Who is your favorite staff member?","TRUST"},
[3] = {"What is the name of this server?","P2002"},
[4] = {"What is the home city of Trolls?","GROBB"},
[5] = {"What is the largest guild on p2002?","DING"},
[6] = {"What is the maximum level for classic everquest?","50"},
[7] = {"What company developed and released classic everquest?","SONY"},
[8] = {"What is the BEST MMORPG?","EVERQUEST"},
[9] = {"What is the shortest playable race in everquest?","GNOME"},
[10] = {"How many years has P2002 been around?","3"},
[11] = {"Ruins of ...?","KUNARK"},
[12] = {"What was the 2nd expansion of everquest called?","SCARS OF VELIOUS"},
[13] = {"Shadows of ...?","LUCLIN"},
[14] = {"What was the 4th expansion of everquest called?","PLANES OF POWER"},
[15] = {"Besides Sky and Hate, what was the name of the other original plane from classic everquest?","FEAR"},
[16] = {"What staff member is known as The Database God","BORAGAR"},
[17] = {"Besides Freeport, what other starting city is home to Humans?","QEYNOS"},
[18] = {"Which newbie zone has a giant chess board?","BUTCHERBLOCK"},
[19] = {"How many coppers does it take to match a platinum?","1000"},
[20] = {"What zone would you go to if you were trying to obtain Baby Joseph Sayer ","BLACKBURROW"},
[21] = {"Who rules Karnor's Castle","VENRIL"},
[22] = {"Who is the final Boss of Planes of Power?","QUARM"},
[23] = {"What is the name of the gnome that you get journeyman boots from?","HASTEN"},
[24] = {"What staff member has banned the most people?","TAIAN"},
[25] = {"What does E`ci stand for?","ICE"},
[26] = {"What p2002 player is most OBSESSED with food?","GREENGROCER"},
[27] = {"What staff member gets a thrill out of illusioning others?","CHUNKY"},
[28] = {"What is the name of Venril Sathir's wife?","DRUSELLA"},
[29] = {"What is also commonly referred to as Ranger Gate?","DYING"},
[30] = {"How many playable Classes are there on P2002?","15"},
[31] = {"What is the true name of The Sleeper?","KERAFYRM"},
[32] = {"What is Cocains favorite food to share?","BREAD"},
[33] = {"Who is the Dragon Goddess?","VEESHAN"},
[34] = {"Who is Cazic Thule's Daughter?","TERRIS"},
[35] = {"What P2002 player has decimated the Oracle population?","HAZEL"},
[36] = {"Who is the King of Thurgadin?","DAIN"},
[37] = {"Who is the Boss of Temple of Veeshan?","VULAK"},
[38] = {"What gnoll has a death wish by the guards in Qeynos?","FIPPY"},
[39] = {"What God is known as The Warlord?","RALLOS"},
[40] = {"What does Xegony stand for?","OXYGEN"},
[41] = {"What player on p2002 had the first epic?","UTINEN"},
[42] = {"What God is known as The Plaguebringer","BERTOX"},
[43] = {"Who is The Mother of All?","TUNARE"},
[44] = {"Who is the King of Thieves?","BRISTLEBANE"},
[45] = {"Finish the Pattern.  Gorenaire, Trakonaon, Talendor...","SEVERILOUS"},
[46] = {"What staff member is the main quest writer for Planes of Power? HINT: starts with Dae","DAERON"},
[47] = {"Who was the first vampire according to Everquest Lore?","MAYONG"},
[48] = {"Who is freed upon the complettion of plane of time?","ZEB"},
[49] = {"Using only your legs and no boats, what is the least amount of zones to PASS through to get from North Qeynos to West Freeport?","8"},
[50] = {"In what zone can avacados be found on the ground in P2002?","KNOWLEDGE"}}

function event_spawn(e)
	e.self:GMMove(-221, 230, -156, 120);
end

function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Trust";
	if (qglobals[globalName] ~= nil) then
		e.self:Say("Hey, no double dipping!");
	elseif (e.message:findi("hail")) then
		e.self:Say("Hello friend!  I'm sure you are here seeking my [" .. eq.say_link("approval") .. "]?");
	elseif(e.message:findi("approval")) then
		e.self:Say("Well lets see here.  Perhaps you could answer some trivia [" .. eq.say_link("questions") .. "] for me to show you are truly deserving?");
	elseif(e.message:findi("questions")) then
		e.self:Say("You will have 30 seconds to answer each question, which will progressively get more difficult.  There will be 5 total questions, if you fail any of them, you will need to restart from the beginning.  Let me know when you are [" .. eq.say_link("ready") .. "]");
	elseif(e.message:findi("ready")) then
		local playerId = e.other:GetID();
		local questNum = math.random(1,10);
		e.other:Message(15,questions[questNum][1]);
		players[playerId] = { e.other, 1, questions[questNum][2] };		
		eq.set_timer(tostring(playerId),60000);
	else
		local playerId = e.other:GetID(); 
		if (players[playerId] ~= nil) then
			local correct = false;
			for k, v in pairs(questions) do
				if (string.find(e.message:upper(), v[2])) then
					if (string.find(e.message:upper(), players[playerId][3])) then
						correct = true;
						if (players[playerId][2] == 41) then
							e.other:Message(13,"Congratulations, you have beat the trivia game.");	
							e.other:Message(15,"You have earned Trusts approval");
							local global = e.other:CastToClient():GetForumName(e.other:CastToClient():AccountID()) .. "-Trust";
							eq.set_global(global ,"99",7,"F");
							eq.stop_timer(tostring(playerId));	
							e.self:Say("Good job, I guess you are smarter than you look!  Here you go, don't spend it all in one place.");
							e.other:SummonItem(100010, 1);
						else
							local newNum = players[playerId][2] + 10;
							local questNum = math.random(newNum,newNum + 9);
							e.other:Message(15,"Right you are, onto the next question! " .. questions[questNum][1]);
							players[playerId] = { e.other, newNum, questions[questNum][2] };
							eq.stop_timer(tostring(playerId));
							eq.set_timer(tostring(playerId),30000);						
						end
					end
				end			
			end
			if (correct == false) then
				e.other:Message(13,"Wrong answer!  You have failed the trivia game!");
				players[playerId] = nil;	
				eq.stop_timer(tostring(playerId));
			end
		end
	end
end

function event_timer(e)
	eq.stop_timer(e.timer);
	local player = players[tonumber(e.timer)][1];
	player:Message(13,"Too slow!  You will need to restart from the beginning!");
end
