-- RINGWAR
-- TODO thurg depop/giants at entrance

-- TODO TESTING

local ThreadManager = require("thread_manager");

-- paths for giants
local PathInfo = {};
-- Recruit, Captain, Warrior, Priest of Zek, General, Veteran, High Priest of Zek, Warlord
local Giants = { 118340, 118338, 118344, 118346, 118339, 118342, 118335, 118343 };
-- Soldier, Cleric, Axeman, Zrelik
local Dwarves = { 118350, 118349, 118348, 118354 };
-- Aldikar, Dobbin, Garadain, Churn, Corbin, Kargin 
local Heroes = { 118351, 118332, 118334, 118329, 118331, 118337 };
-- Spearmen, Archers, Kargin
local Statics = { 118341, 118347, 118337 };
local Narandi = { 118345 };

-- stages: -1 is pre-war conversation, 0 is war trigger, 1 is first siege, 2 is second siege, 3 is third siege, 4 is Narandi, 5 is loot
local stage = -1;

-- tracks entity specific data (e.g. which path is this giant on? What group does this dwarf belong to? What waypoint are we at?)
local entity_data = {};

-- tracks data for next spawn round
local next_spawn = {};
local boss_count = 0;
local miss_count = 0;

function event_encounter_load(e)
	-- spawn event trigger (decision points in function)
	eq.register_npc_event("RingTen", Event.spawn, -1, AllSpawn);
	-- signal 99 is for move-only events, other signals set specific paths
	eq.register_npc_event("RingTen", Event.signal, -1, AllSignal);
	-- recalculates waypoint every time mob loses aggro - e.g. if it has been kited closer to the end of its path, it'll pick a later waypoint rathen than walk all the way back
	eq.register_npc_event("RingTen", Event.combat, -1, AllCombat);
	-- waypoint arrive sets next waypoint in entity data for the triggering entity
	eq.register_npc_event("RingTen", Event.waypoint_arrive, -1, AllWaypoint);
	
	-- triggers for the NPC coordinating the event
	eq.register_npc_event("RingTen", Event.timer, 118351, WarTimers);
	eq.register_npc_event("RingTen", Event.trade, 118351, WarTrade);
	eq.register_npc_event("RingTen", Event.death_complete, 118351, WarDeath);
	
	-- Zrelik the Scout coordination
	eq.register_npc_event("RingTen", Event.trade, 118354, ScoutTrade);
	eq.register_npc_event("RingTen", Event.say, 118354, ScoutMove);
	
	-- Conversation coordination
	eq.register_npc_event("RingTen", Event.waypoint_arrive, 118352, ConversationStart);
	eq.register_npc_event("RingTen", Event.waypoint_arrive, 118351, ConversationStart);
	
	-- War win monitor & rewards
	eq.register_npc_event("RingTen", Event.death_complete, 118345, FinalStage);
	eq.register_npc_event("RingTen", Event.trade, 118334, Trades);
	eq.register_npc_event("RingTen", Event.trade, 118332, Trades);
	eq.register_npc_event("RingTen", Event.trade, 118331, Trades);
	eq.register_npc_event("RingTen", Event.trade, 118337, Trades);
	eq.register_npc_event("RingTen", Event.trade, 118329, Trades);
	
	-- set up paths as soon as encounter loads
	PathInfo = load_paths();
	-- spawns circle of dwarves to start war
	depop_except({ 118352 });
	PreSetup();
	-- note that NPCs that require a path need to be created by a trigger (timer, say, etc)
end

function Trades(e)
	local item_lib = require("items");
	
	if stage > 4 then
		if e.self:GetNPCTypeID() == 118334 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}) then -- Shorn Head of Narandi
			e.self:Emote(string.format("removes a choker from the severed head and returns both items to you, 'Congratulations on your victory, %s. I couldn't have done a better job myself. May Brell protect and watch over you and your friends. Farewell.'",e.other:GetCleanName()));
			quest_reward(e.self, e.other, 1742, 1, 1);
		elseif e.self:GetNPCTypeID() == 118332 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}) then -- Shorn Head of Narandi
			e.self:Emote("takes a facemask from the head of the giant, 'We shall always be in your debt, outlander. Take this mask, may it protect you from those who would seek to do you harm.'");
			quest_reward(e.self, e.other, 1743, 1, 1);
		elseif e.self:GetNPCTypeID() == 118331 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}) then -- Shorn Head of Narandi
			e.self:Emote(string.format("unhooks a glowing earring from Narandi's shorn head, 'Hmm, this looks like something special. Take it, %s, you've earned it! Be well.'",e.other:GetCleanName()));
			quest_reward(e.self, e.other, 1744, 1, 1);
		elseif e.self:GetNPCTypeID() == 118337 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}) then -- Shorn Head of Narandi
			e.self:Emote("picks up a stick and hits the back of the dismembered head with all his might, knocking one of it's eyes out of the socket, 'Bastard killed my brother! Hope his ghost felt that one!'");
			quest_reward(e.self, e.other, 1745, 1, 1);
		elseif e.self:GetNPCTypeID() == 118329 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}) then -- Shorn Head of Narandi
			e.self:Emote("pries a crown from the head of Narandi, 'The halls of Thurgadin will echo with praises to you for as long as we grace the face of this land. May this crown serve you well. Honor through battle!'");
			quest_reward(e.self, e.other, 1746, 1, 1);
		end
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function quest_reward(e_self, e_other, item, xp_mult, fac_mult)
	local fhit = fac_mult * 25;
	e_other:Faction(49, fhit); --Coldain
	e_other:Faction(67, fhit); --Dain
	e_other:Faction(188, -fhit); --Kromrif
	e_other:Faction(189, -fhit); --Kromzek
	e_other:SummonItem(1741); -- Shorn head
	e_other:QuestReward(e_self, 0, 0, 0, 0, item, 400000 * xp_mult); -- reward item
end

function FinalStage(e)
	stage = 5;
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(118351):CastToNPC();
	Aldikar:Shout("Outlander! You've done it! The Kromrif invasion has been frustrated! Bring me the head of Narandi and your Hero's ring.");
end

function ScoutTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18511})) and stage == 0 then -- Orders of Engagement
		eq.signal(118351, 61, 1000);
		stage = 1;
		e.self:Say(string.format("At yer service, %s. Remember now, before issuing me an order ya must disengage from any combat and be sure yer speakin to me. I advise yo to avoid combat at all costs, your leadership is crucial.",e.other:GetCleanName()));
	end
end

function WarTrade(e)
	local item_lib = require("items");
	
	if stage == 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30369}) then -- 9th ring
		e.other:AddEXP(20000);
		e.other:SummonItem(18511);
		e.other:SummonItem(30369);
		e.self:Say(string.format("Commit these orders to memory, %s, have them ready to speak at a moment's notice. Tell your soldiers to prepare themselves. When the orders are handed to Zrelik we will take up our positions.",e.other:GetCleanName()));
		eq.set_timer("handin1", 300000);
	elseif stage > 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30369, item2 = 1739}) then -- Narandi's Head and 9th ring
		e.self:Emote("unsheathes a knife and shaves the beard from Narandi's face and returns the head to you, 'The Dain will require the beard for his trophy room, please accept this ring on his behalf. May it's effect aid you as you have aided us. Be certain to present the ring to the Dain when you're in town. If you remain an ally he will be most gracious, but be warned, if you fall from his good graces he will keep the ring.'");
		quest_reward(e.self, e.other, 30385, 10, 2);
		e.self:Say("Show the head to the surviving heroes quickly, we must report to the Dain and tend to the wounded.");
		eq.set_timer("WarEnd", 300000);
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

function Conversation()
	local Badain = eq.get_entity_list():GetMobByNpcTypeID(118352):CastToNPC();
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(118351):CastToNPC();
	local Garadain = eq.get_entity_list():GetMobByNpcTypeID(118334):CastToNPC();
	local Dobbin = eq.get_entity_list():GetMobByNpcTypeID(118332):CastToNPC();
	local Kargin = eq.get_entity_list():GetMobByNpcTypeID(118337):CastToNPC();
	local Churn = eq.get_entity_list():GetMobByNpcTypeID(118329):CastToNPC();
	local Corbin = eq.get_entity_list():GetMobByNpcTypeID(118331):CastToNPC();
	Kargin:Emote("'s stomach growls loudly.");
	ThreadManager:Wait(1);
	Garadain:Say("With all due respect, Seneschal, I feel my men are best suited for the eastern post. If the outlander has rounded up enough soldiers to hold 'em off from the south then they'll definitely test us in the gorge. We'll be needin' a solid defense there.");
	ThreadManager:Wait(1);
	Aldikar:Say("Very well, Garadain, the eastern post is yours. I'll place Kargin and his bowmen on the hill to the west, and Churn, you'll station your troops up near the caves just past them.");
	ThreadManager:Wait(1);
	Garadain:Emote("bows and departs to the east.");
	Garadain:Depop();
	eq.signal(118351, 57, 1000);
	ThreadManager:Wait(1);
	Churn:Say("Understood sir.");
	Churn:Emote("turns to walk west.");
	Churn:Depop();
	eq.signal(118351, 58, 1000);
	ThreadManager:Wait(1);
	Kargin:Emote("nods quietly and slinks away.");
	Kargin:Depop();
	eq.signal(118351, 60, 1000);
	ThreadManager:Wait(1);
	Badain:Say("Excuse me, Seneschal Aldikar, you instructed me to report to you when the outlander returned.");
	ThreadManager:Wait(1);
	Aldikar:Say("Perfect timing outlander, please be seated and listen carefully. Badain, yer dismissed.");
	ThreadManager:Wait(1);
	Badain:Say("Sir, yessir!");
	Badain:Depop(true);
	ThreadManager:Wait(1);
	Aldikar:Say("We knew the day might come when the Kromrif would discover the location of our beloved city. It was only prudent for there to be a plan for such a circumstance. In light of recent developments, however, our plans have been adjusted. Outlander, the Dain has appointed you to lead our armies in defense of Thurgadin.");
	ThreadManager:Wait(1);
	Aldikar:Say("I will stand here with a handful of men as a final line of defense. Should I fall, all will be lost. You will have these men and their soldiers to command. Use them wisely, you will be richly rewarded if your forces are able to keep them alive.");
	ThreadManager:Wait(1);
	Aldikar:Say("Garadain will post his men in the gorge to the east. Churn and his men will await your command in the caves to the west. Dobbin will have his forces at the ready in the clearing directly south of here near the towers. If any Kromrif make it to his vicinity he and his men will attack with or without your command.");
	ThreadManager:Wait(1);
	Dobbin:Emote("salutes and marches southward.");
	Dobbin:Depop();
	eq.signal(118351, 56, 1000);
	ThreadManager:Wait(1);
	Aldikar:Say("Lastly, Corbin will hide his men in the worm caves to the south, call on him for a surprise attack. Remember where these men are stationed, outlander. Should they call out for help you may wish to send some of your people to aid them.");
	ThreadManager:Wait(1);
	Corbin:Emote("runs off unceremoniously.");
	Corbin:Depop();
	eq.signal(118351, 59, 1000);
	ThreadManager:Wait(1);
	Aldikar:Say("The leader of this invasion is a powerful Kromrif named Narandi. Rumor has it that he is more powerful than any ten of his peers. He must fall. When he is slain you must show his head and your ring to me.");
	ThreadManager:Wait(1);
	Aldikar:Say("Scout Zrelik here will follow you and serve as your herald. He will relay your orders to the troops. Show me your ring now to verify your identity and I will give you the orders to memorize.");
	-- spawn Zrelik and advance stage
	eq.unique_spawn(118354, 0, 0, -110, -545, 77, 223);
	stage = 0
end

function ConversationStart()
	if stage == -1 then
		ThreadManager:Create("Conversation", Conversation);
	elseif stage == 1 then
		ThreadManager:Create("Conversation", ShoutingMatch1);
	elseif stage == 2 then
		ThreadManager:Create("Conversation", ShoutingMatch2);
	elseif stage == 3 then
		ThreadManager:Create("Conversation", ShoutingMatch3);
	end
	
end

function ShoutingMatch2()
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(118351):CastToNPC();
	eq.unique_spawn(118345, 0, 0, -5000, -5000, 0, 0);
	local Narandi = eq.get_entity_list():GetMobByNpcTypeID(118345):CastToNPC();
	Narandi:SetInvul(true);
	
	Aldikar:Shout("Outlander, our scouts report no more Kromrif units on the way - for the time being. Resurrect your fallen and heal your wounded. I have a feeling we haven't seen the last of them. ");
	ThreadManager:Wait(1);
	Narandi:Shout("Interlopers! You've chosen the wrong side in this war. My warriors will succeed where the young recruits have failed. You shall suffer the same fate as the pathetic vermin you serve. Your heads shall be perched upon our spears along with those of your Coldain friends!");
	ThreadManager:Wait(1);
	Aldikar:Shout("Pay no attention to his babbling, outlander. It is our destiny to emerge victorious. Prepare your army for glorious battle!");
	ThreadManager:Wait(1);
	Narandi:Shout("My warriors approach, I offer you one final opportunity to bow before the might of Rallos Zek. Throw down your weapons and surrender. You will live out your lives in relative peace, rightfully serving your Kromrif masters.");
	ThreadManager:Wait(1);
	Aldikar:Shout("Enough! Show yourself coward! Your blasphemous words shall be etched upon your spacious brow. All will mock you for generations to come. Your own god will forsake you when he witnesses your defeat here today!");
	ThreadManager:Wait(1);
	Narandi:Shout("Warriors! Charge through these pompous fools. Any you manage to capture shall become your personal slaves. The outlanders and the Seneschal must die! Bring me their heads!");
	Narandi:Depop();
end

function ShoutingMatch3()
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(118351):CastToNPC();
	eq.unique_spawn(118345, 0, 0, -5000, -5000, 0, 0);
	local Narandi = eq.get_entity_list():GetMobByNpcTypeID(118345):CastToNPC();
	Narandi:SetInvul(true);
	
	Aldikar:Shout("Well fought, friends! May the piles of Kromrif corpses strike fear in the hearts of our overgrown enemies.");
	ThreadManager:Wait(1);
	Narandi:Shout("Silence fool! Speak not of our fallen. They who die honorably in combat earn an eternal rest in the company of our greatest heroes... even Rallos Zek himself!");
	ThreadManager:Wait(1);
	Aldikar:Shout("It is your misguided beliefs that made this war necessary. Now you feel the sting of your errors. Return to Kael and preach the doctrine of Brell Serilis in hopes that your people may someday be spared.");
	ThreadManager:Wait(1);
	Narandi:Shout("Enough chatter. Our veterans approach now to finish you. You have been tested and your weaknesses have been assessed. Bid farewell to your dear Thurgadin, those of you who are fortunate enough to survive the slaughter shall make a new home in the Kromrif slave pens!");
	ThreadManager:Wait(1);
	Narandi:Shout("Veterans! Be sure that this time we allow none of the stumpymen to escape to create yet another city. This shall be our final war with these unworthy beings.");
	Narandi:Depop();
end

function PreSetup()
	local Badain = eq.get_entity_list():GetMobByNpcTypeID(118352):CastToNPC();
	Badain:Say("Excellent! All of your commanders have reported to the Dain, and none too soon mind you. We are getting reports of Kromrif troop movement in the area and final preparations must be made. Follow me and the Seneschal will brief you.");
	Badain:MoveTo(-110, -545, 77, 223, true);
	-- Seneschal Aldikar pop
	eq.unique_spawn(118351, 0, 0, -125, -530, 77, 90);
	-- 5 dwarf hero spawns
	eq.signal(118351, 51);
	eq.signal(118351, 52);
	eq.signal(118351, 53);
	eq.signal(118351, 54);
	eq.signal(118351, 55);
end

function PostSetup()
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(118351):CastToNPC();
	Aldikar:MoveTo(-125, -530, 77, 90, true);
	
	-- repop surviving heroes at thurg valley
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(118334) then
		eq.depop(118334);
		eq.signal(118351, 51);
	end	
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(118332) then
		eq.depop(118332);
		eq.signal(118351, 52);
	end	
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(118331) then
		eq.depop(118331);
		eq.signal(118351, 53);
	end	
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(118337) then
		eq.depop(118337);
		eq.signal(118351, 54);
	end	
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(118329) then
		eq.depop(118329);
		eq.signal(118351, 55);
	end
end

function ShoutingMatch1()
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(118351):CastToNPC();
	eq.unique_spawn(118345, 0, 0, -5000, -5000, 0, 0);
	local Narandi = eq.get_entity_list():GetMobByNpcTypeID(118345):CastToNPC();
	Narandi:SetInvul(true);
	
	Aldikar:Shout("Good citizens of Thurgadin, hear me! Our city, our people, our very lives are in danger this day. The Kromrif are at this very moment marching towards us in an offensive they hope will bring about our demise... ");
	ThreadManager:Wait(1);
	Aldikar:Shout("I hereby command, by authority of Dain Frostreaver the Fourth, that all able bodied Coldain fight to the death in defense of our land. Children, disabled citzens, and unseasoned travellers are advised to evacuate immediately!");
	ThreadManager:Wait(1);
	Aldikar:Shout("My fellow soldiers, take heart! For we are not alone in this endeavor. One among us, an outlander, has earned the title Hero of the Dain for valiant service to our people. This newcomer has brought with him allies that will fight alongside you to help bring about our victory.");
	ThreadManager:Wait(1);
	Aldikar:Shout("My friends... Brell did not place us here so many centuries ago to be slaughtered by these heathens. Nor did our forefather, Colin Dain, sacrifice himself simply to have us fail here now. Through these events we were brought to this day to test our strength and our faith.");
	ThreadManager:Wait(1);
	Aldikar:Shout("Will we be shackled together to slave away in Kromrif mines or will we stand united and feed these beasts Coldain blades? By Brell I promise you, 'It is better to die on our feet than to live on our knees!'");
	ThreadManager:Wait(1);
	Aldikar:Shout("TROOPS, TAKE YOUR POSITIONS!!");
	ThreadManager:Wait(1);
	Narandi:Shout("No need to pray to your little God stumpymen, you'll be meeting him in person soon enough!");
	ThreadManager:Wait(1);
	Aldikar:Shout("You'll be begging Brell for forgiveness by the day's end, vile beast!");
	ThreadManager:Wait(1);
	Narandi:Shout("Kromrif! Form up! Dispatch these tiny fools and destroy Thurgadin. Theres a keg of ice mead waiting for every man back at home.");
	Narandi:Depop();
	GiantSpawn();
end

function GiantSpawn()
	-- local spawn_time = 300000 - math.random(300000); -- base time till next wave
	local spawn_time = 10000 - math.random(10000);

	if stage == 1 and boss_count == 0 and miss_count == 0 then -- checks for first execution
		eq.signal(118351, 50, 1000);
		spawn_time = 1000; -- shorter time for first wave
	end
	
	local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(118351);
	if boss_count >= 4 then
		if stage < 3 then
			-- spawn_time = 420000; -- longer pause before new stage
			spawn_time = 20000;
			boss_count = 0;
			miss_count = 0;
			stage = stage + 1;
			ConversationStart();
		elseif stage == 3 then
			stage = 4
			next_spawn = { [118345] = 1 };
			-- eq.set_timer("Narandi", 300000, Aldikar);
			eq.set_timer("Narandi", 3000, Aldikar);
			return
		end
	end
	
	local boss;
	local prc = 25; -- pseudorandom constant (25 is ~50% chance)
	local boss_chance = math.random(100);
	if boss_chance < prc * (miss_count + 1) then
		boss = 1;
		boss_count = boss_count + 1;
		miss_count = 0;
	else
		boss = 0;
		miss_count = miss_count + 1;
	end
	
	if stage == 1 then
		-- next_spawn = { [118340] = 10, [118338] = boss };
		next_spawn = { [118340] = 2, [118338] = boss };
	elseif stage == 2 then
		-- spawn_time = spawn_time + 120000;
		spawn_time = spawn_time + 2000;
		-- next_spawn = { [118344] = 8, [118346] = 2, [118339] = boss };
		next_spawn = { [118344] = 2, [118346] = 1, [118339] = boss };
	elseif stage == 3 then
		-- spawn_time = spawn_time + 240000;
		spawn_time = spawn_time + 4000;
		-- next_spawn = { [118342] = 8, [118335] = 2, [118343] = boss };
		next_spawn = { [118342] = 2, [118335] = 1, [118343] = boss };
	end
	
	local spawn_loc = eq.ChooseRandom(1,2,3,4,5);
	eq.set_timer("Spawn" .. spawn_loc, spawn_time, Aldikar);
	
	eq.zone_emote(1, "Timer launched: Spawn" .. spawn_loc);
	eq.zone_emote(1, "Timer length is " .. spawn_time);
	eq.zone_emote(1, "Boss count is " .. boss_count);
	
	
end

function ScoutMove(e)
	local pos = { e.other:GetX(), e.other:GetY(), e.other:GetZ(), 0.5 };
	if stage > 0 then
		if(e.message:findi("Dobbin assist me!")) then
			call_dwarves(pos, 6);
			e.self:Say("Dobbin is on his way!");
		elseif(e.message:findi("Garadain to my side!")) then
			call_dwarves(pos, 7);
			e.self:Say("Garadain is on his way!");
		elseif(e.message:findi("Churn protect me!")) then
			call_dwarves(pos, 8);
			e.self:Say("Churn is on his way!");	
		elseif(e.message:findi("Corbin, attack!")) then
			call_dwarves(pos, 9);
			e.self:Say("Corbin is on his way!");
		elseif(e.message:findi("For the Dain, attack!")) then
			call_dwarves({ pos[1], pos[2], pos[3], pos[4] }, 6);
			call_dwarves({ pos[1] - 22.5, pos[2] + 20, pos[3], pos[4] }, 7);
			call_dwarves({ pos[1] + 22.5, pos[2] + 20, pos[3], pos[4] }, 8);
			call_dwarves({ pos[1], pos[2] - 20, pos[3], pos[4] }, 9);
			e.self:Say("The commanders are on their way!");
		end
	end
end

function call_dwarves(position, group)
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			local status, groupID = pcall(get_group_ID, entity_data[npc:GetID()]) -- can probabaly be anonymous function
			if status then
				if (npc.valid and groupID == group) then
					table.insert(entity_data[npc:GetID()]['path'], position);
				end
			end
		end
	end
end

function get_group_ID(entity_entry)
	return entity_entry['groupID']
end

function GroupSpawn(num)
	local npcs = {};
	
	if num == 0 then
		-- west spears
		spawn_Mobs(118341, 569, -2447, -86.4, 841, -1776, -33, 194, 12, 0);
		-- east spears
		spawn_Mobs(118341, -668, -2062, -60, -775, -2347, -75, 59, 6, 0);
		-- assign static 'path'
		eq.signal(118341, 0);
	elseif num == 1 then
		-- Garadain
		eq.unique_spawn(118334, 0, 0, -125, -563, 75, 5);
	elseif num == 2 then
		-- Dobbin
		eq.unique_spawn(118332, 0, 0, -110, -558, 75, 240);
	elseif num == 3 then
		-- Corbin
		eq.unique_spawn(118331, 0, 0, -98, -545, 75, 215);
	elseif num == 4 then
		-- Kargin
		eq.unique_spawn(118337, 0, 0, -90, -530, 75, 193);
	elseif num == 5 then
		-- Churn
		eq.unique_spawn(118329, 0, 0, -90, -515, 75, 170);
	elseif num == 6 then
		-- Dobbin soldiers by towers
		npcs = { [118350] = 12 };
		spawn_helper(npcs, 6, 1, 12, 15, 128);
		-- archers on top of towers
		spawn_Mobs(118347, -155, -1080, 70, -195, -1080, 70, 128, 3, 0);
		spawn_Mobs(118347, 120, -1080, 70, 160, -1080, 70, 128, 3, 0);
		eq.signal(118347, 0);
		-- Dobbin - REPLACE WITH WALK TO POSITION!!!
		eq.unique_spawn(118332, 0, 0, -10, -1070, 25, 128);
		eq.signal(118332, 6);
	elseif num == 7 then
		-- Garadain soldiers by spire
		npcs = { [118350] = 6, [118349] = 6 };
		spawn_helper(npcs, 7, 2, 6, 15, 128);
		-- archers behind Garadain's troops
		spawn_Mobs(118347, -1770, -525, 80, -1845, -525, 80, 128, 6, 0);
		eq.signal(118347, 0);
		-- Garadain - REPLACE WITH WALK TO POSITION!!!
		eq.unique_spawn(118334, 0, 0, -1800, -570, 75, 128);
		eq.signal(118334, 7);
	elseif num == 8 then
		-- Churns troops by tizmak cave
		npcs = { [118348] = 12 };
		spawn_helper(npcs, 8, 2, 6, 15, 128);
		-- Churn - REPLACE WITH WALK TO POSITION!!!
		eq.unique_spawn(118329, 0, 0, 1600, -1030, 330, 128);
		eq.signal(118329, 8);
	elseif num == 9 then
		-- Corbin troops near wurms
		npcs = { [118350] = 6, [118349] = 6 };
		spawn_helper(npcs, 9, 2, 6, 15, 0);
		-- Corbin - REPLACE WITH WALK TO POSITION!!!
		eq.unique_spawn(118331, 0, 0, 200, -2885, -150, 0);
		eq.signal(118331, 9);
	elseif num == 10 then
		-- Archers with Kargin
		spawn_Mobs(118347, 950, -1250, 170, 950, -1450, 170, 190, 12, 0);
		-- Kargin
		eq.unique_spawn(118337, 0, 0, 935, -1350, 160, 190);
		-- assign static 'path'
		eq.signal(118337, 0);
		eq.signal(118347, 0);
	elseif num == 11 then
		-- Seneschal Aldikar move
		eq.move_to(-113, 0, 100, 128, true);
		-- eq.unique_spawn(118351, 0, 0, -113, 0, 100, 128);
		-- Aldikar archers
		spawn_Mobs(118347, -156, -34, 95, -156, -115, 95, 80, 6, 0);
		spawn_Mobs(118347, -56, -34, 95, -56, -115, 95, 160, 6, 0);
		-- assign static 'path'
		eq.signal(118347, 0);
		eq.signal(118351, 0);
	end
end

function WarDeath(e)
	e.self:Shout("I have fallen brothers! Retreat!");
	if stage > 4 then
		WarEnd(1)
	else
		WarEnd(0)
	end
end

function WarEnd(end_type)
	-- endtypes: 0 - Loss (thurg dies, giants pop), 1 - Win (simple zone repop)
	eq.depop_zone(false);
	eq.repop_zone();
	if end_type < 1 then
		eq.zone_emote(1, "WAR FAIL");
	end
	-- eq.unload_encounter("RingTen");
end

function WarTimers(e)
	if e.timer == "TMHB" then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("Conversation");
	elseif e.timer == "RingTenHB" then
		for _,v in pairs(Giants) do
			eq.signal(v, 99)
		end
		for _,v in pairs(Dwarves) do
			eq.signal(v, 99)
		end
		for _,v in pairs(Heroes) do
			eq.signal(v, 99)
		end
	elseif e.timer == "Spawn1" then
		eq.stop_timer("Spawn1");
		spawn_helper(next_spawn, 1, 1, 12, 40, 0);
		GiantSpawn()
	elseif e.timer == "Spawn2" then
		eq.stop_timer("Spawn2");
		spawn_helper(next_spawn, 2, 6, 2, 20, 0);
		GiantSpawn()
	elseif e.timer == "Spawn3" then
		eq.stop_timer("Spawn3");
		spawn_helper(next_spawn, 3, 6, 2, 15, 64);
		GiantSpawn()
	elseif e.timer == "Spawn4" then
		eq.stop_timer("Spawn4");
		spawn_helper(next_spawn, 4, 6, 2, 20, 0);
		GiantSpawn()
	elseif e.timer == "Spawn5" then
		eq.stop_timer("Spawn5");
		spawn_helper(next_spawn, 5, 6, 2, 20, 192);
		GiantSpawn()
	elseif e.timer == "Narandi" then
		eq.stop_timer("Narandi");
		local combo = table_concat(Heroes, Giants);
		depop_except(combo);
		PostSetup();
		spawn_helper(next_spawn, 10, 1, 1, 10, 192);
		e.self:Shout("Outlander! Narandi is plotting his retreat! Don't let him escape alive!");
		eq.set_timer("NarDepop", 600000);
	elseif e.timer == "handin1" then
		eq.stop_timer("handin1");
		if stage < 1 then
			e.self:Say("Outlander, the enemy approaches. If you do not hand Zrelik the orders you will not be able to command the Coldain armies. You have one minute remaining.");
			eq.set_timer("handin2", 60000);
		end
	elseif e.timer == "handin2" then
		eq.stop_timer("handin2");
		if stage < 1 then
			e.self:Say("We've waited too long! To your posts!");
			eq.depop(118354);
			eq.signal(118351, 61, 1000);
			stage = 1;
		end
	elseif e.timer == "NarDepop" then
		eq.stop_timer("NarDepop");
		if stage < 5 then
			local Narandi = eq.get_entity_list():GetMobByNpcTypeID(118345):CastToNPC();
			Narandi:Shout("Fools! I shall return and your pitiful city will fall!");
			WarEnd(1);
		end
	elseif e.timer == "WarEnd" then
		eq.stop_timer("WarEnd");
		WarEnd(1);
	elseif e.timer == "Door" then
		eq.stop_timer("Door");
		WarEnd(0);
	end
end

function AllSpawn(e)
	
	local NpcID = e.self:GetNPCTypeID();
	
	if NpcID == 118351 then
		eq.set_timer("TMHB", 100);
		eq.set_timer("RingTenHB", 5000);
	-- check for NPCs that match list of giants and set their runspeed to SoW
	end
	
	if is_in(NpcID, Giants) or NpcID == 118345 then
		e.self:ModifyNPCStat("runspeed","1.875");
	-- permaroot the permarooted mobs
	elseif is_in(NpcID, Statics) then
		e.self:ModifyNPCStat("runspeed","0");
	-- check for NPCs that match list of Dwarves and heroes and set them to run
	elseif is_in(NpcID, Dwarves) then
		e.self:SetRunning(true);
	elseif is_in(NpcID, Heroes) then
		e.self:SetRunning(true);
	end
end

function AllSignal(e)
	if e.signal >= 0 and e.signal <= 20 and not entity_data[e.self:GetID()] then
		-- sets paths for any naive NPCs (NPCs with set paths are unaffected)
		entity_data[e.self:GetID()] = load_entity_data(PathInfo[e.signal], e.self:GetX(), e.self:GetY(), e.signal);
		-- e.self:Shout("My groupID is: " .. entity_data[e.self:GetID()]['groupID'])
	elseif e.signal >= 50 and e.signal <= 70 then
		group_num = e.signal - 50;
		GroupSpawn(group_num);
	end
	
	issue_move(e.self:GetID(), e.self:GetNPCTypeID());
end

function AllCombat(e)
	if not e.joined then
		local min_dist = 100000;  -- arbitrarily large value to start
		local new_wp = entity_data[e.self:GetID()]['wp'];
		
		for i, v in ipairs(entity_data[e.self:GetID()]['path']) do
			distance = dist(e.self:GetX(), e.self:GetY(), v[1], v[2]);
			if distance < min_dist and i >= new_wp then
				min_dist = distance;
				new_wp = i
			end
		end

		entity_data[e.self:GetID()]['wp'] = new_wp;
		-- ensures that mobs kited during walking phase get properly set to running when kited closer to end of path
		if new_wp > 1 and e.self:GetNPCTypeID() ~= 118345 then
			e.self:SetRunning(true);
		end
		
		issue_move(e.self:GetID(), e.self:GetNPCTypeID())
	end
end

function AllWaypoint(e)
	if is_in(e.self:GetNPCTypeID(), Giants) then
		e.self:SetRunning(true);
		if e.self:GetY() > 45 and e.self:GetX() > -1000 then
			local Aldikar = eq.get_entity_list():GetMobByNpcTypeID(118351):CastToNPC();
			Aldikar:Shout("The gates of Thurgadin are breached! Retreat!");
			WarEnd(1)
		end
	end
	
	entity_data[e.self:GetID()]['wp'] = entity_data[e.self:GetID()]['wp'] + 1;
	
	issue_move(e.self:GetID(), e.self:GetNPCTypeID())
end

function issue_move(id, npc)
	local heading;
	if is_in(npc, Giants) then
		heading = 0;
	else
		heading = 128;
	end

	local status, wp = pcall(waypoint_helper, entity_data[id]);
	if status then
		eq.move_to(wp['x'], wp['y'], wp['z'], heading, true);
	end
end

function waypoint_helper(data)
	return get_waypoint(data['path'][data['wp']], data['x'], data['y'])
end

function get_waypoint(locs, offX, offY)
	local way = {};

	way['x'] = locs[1] + offX * locs[4];
	way['y'] = locs[2] + offY * locs[4];
	way['z'] = locs[3];
	
	return way
end

function load_entity_data(path, myX, myY, group)
	local off = {};
	local start_loc = path[0];
	
	off['x'] = myX - start_loc[1];
	off['y'] = myY - start_loc[2];
	off['wp'] = 1;
	off['path'] = path;
	off['groupID'] = group;
	
	return off
end

function spawn_helper(npcs, path, col, row, spacing, heading)
	spawn_Mobs_tables(npcs, PathInfo[path][0], col, row, spacing, heading);
	for i in pairs(npcs) do
		if i ~= 118345 then
			eq.signal(i, path);
		else
			eq.signal(i, path, 60000);
		end
	end
end

function spawn_Mobs(npcId, startX, startY, startZ, endX, endY, endZ, heading, numMobs, grid)
	local xDiff = round((startX - endX) / numMobs, 2) * -1;
	local yDiff = round((startY - endY) / numMobs, 2) * -1;
	local zDiff = round((startZ - endZ) / numMobs, 2) * -1;
	
	for i = 0, numMobs-1 do
		eq.spawn2(npcId, grid, 0, startX + (xDiff*i), startY + (yDiff*i), startZ + (zDiff*i), heading);
	end
end

function spawn_Mobs_tables(npcs, locs, columns, rows, spacing, heading)
	-- npcs is a table of format { [npcID] = number_to_spawn }
	-- eq.zone_emote(13, 'SPAWN ENTERED');
	local startX = locs[1] - (rows / 2) * spacing;
	local startY = locs[2] - (columns / 2) * spacing;
	local startZ = locs[3];
	-- eq.zone_emote(13, 'LOCS ACQUIRED');
	
	-- iterate over whole table to get all keys
	local keyset = {};
	for k, v in pairs(npcs) do
		if v > 0 then
			table.insert(keyset, k)
		end
	end
	-- eq.zone_emote(13, 'KEYSET GENERATED');
	
	local empty = false;
	for j = 0, rows-1 do
		if empty then
			break
		end
		for i = 0, columns-1 do
			if next(keyset) == nil then
				empty = true
				break
			end
			
			local k = math.random(#keyset);
			local new_npc = keyset[k];
			eq.spawn2(new_npc, 0, 0, startX + spacing*j, startY + spacing*i, startZ, heading);
			-- eq.zone_emote(13, 'SPAWNED:' .. new_npc);
			npcs[keyset[k]] = npcs[keyset[k]] - 1;
			if npcs[keyset[k]] == 0 then
				table.remove(keyset, k)
			end
		end
	end

end

function depop_except(except)
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	local npc_list = entity_list:GetNPCList();
	local exclude_npc_list = Set(except);
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (exclude_npc_list[npc:GetNPCTypeID()] == nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:Depop()
				end
			end
		end
	end
end

function load_paths()
	-- path format is X, Y, Z, spread multiplier (no spread multiplier for spawn location at this time)
	local wps = {};
	
	-- STATIC NPCS
	wps[0] = { [0] = {0, 0, 0} }; 
	
	-- GIANTS
	-- south spawn - line spawn
	wps[1] = { [0] = {250, -2300, -80}; [1] = {150, -1700, -10, .75}; [2] = {-50, -1000, 25, 0.35}; [3] = {-110, -20, 100, 0}; [4] = {-110, 50, 100, 0}};
	-- far east spawn (near spires) - clustered spawn
	wps[2] = { [0] = {-2400, -1900, -35}; [1] = {-2050, -850, 115, 1}; [2] = {-1900, -600, 75, 1}; [3] = {-600, -1200, 25, 0.5}; [4] = {-50, -1000, 25, 0.5}; [5] = {-110, -20, 100, 0}; [6] = {-110, 50, 100, 0} };
	-- near east spawn (behind spearmen) - clustered spawn
	wps[3] = { [0] = {-1100, -2100, -55}; [1] = {0, -2100, -55, 0.75}; [2] = {-50, -1000, 25, 0.35}; [3] = {-110, -20, 100, 0}; [4] = {-110, 50, 100, 0} };
	-- west spawn, north route - clustered spawn
	wps[4] = { [0] = {1200, -2100, -65}; [1] = {1400, -1500, 170, 1}; [2] = {1550, -1000, 330, 1}; [3] = {1000, -1000, 210, 0.75}; [4] = {-50, -1000, 25, 0.5}; [5] = {-110, -20, 100, 0}; [6] = {-110, 50, 100, 0}  };
	-- west spawn, river route - clustered spawn
	wps[5] = { [0] = {1200, -2100, -65}; [1] = {600, -2000, -40, 1}; [2] = {600, -1300, 10, 1}; [3] = {400, -1000, 25, 0.75}; [4] = {-50, -1000, 25, 0.5}; [5] = {-110, -20, 100, 0}; [6] = {-110, 50, 100, 0}  };
	
	-- DWARVES
	-- Dobbin group at towers
	wps[6] = { [0] = {-10, -1080, 25} };
	-- Garadain group at spire
	wps[7] = { [0] = {-1800, -540, 70} };
	-- Churn group at Tizmak cave
	wps[8] = { [0] = {1600, -1000, 330} };
	-- Corbin group at Tizmak cave
	wps[9] = { [0] = {200, -2900, -150} };
	
	-- NARANDI
	wps[10] = { [0] = {250, -2300, -80}; [1] = {-1100, -2100, -55, 1}; [2] = {-2400, -1900, -35, 1}; [3] = {-4750, -1800, 240, 1}};
	return wps
end

function round(num, dec)
	local temp = 10^dec;
	return math.floor(num * temp + .5) / temp;
end

function is_in(el, array)
	-- eq.zone_emote(12, 'Checking element: ' .. el);
	for i,v in pairs(array) do
		if v == el then
			return true
		end
	end

	return false
end

function dist(x1, y1, x2, y2)
	local dist = 0;
	dist = math.abs(x1 - x2) + math.abs(y1 - y2);
	
	return dist
end

-- Set function example from Programming In Lua
-- http://www.lua.org/pil/11.5.html
function Set(list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

function table_concat(table1, table2)
	local table_final = {};
	for k, v in pairs(table1) do
		table.insert(table_final, v)
	end
	for k, v in pairs(table2) do
		table.insert(table_final, v)
	end
	return table_final
end