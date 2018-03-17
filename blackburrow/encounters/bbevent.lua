local baseCnt = 0;
local enragedCnt = 0;
local chiefCnt = 0;
local warlordCnt = 0;
local instance_id = nil;
local king_spawned = false;
local potions = {100001,100002,100003,100004,100005,100006,100007};
local king = 17113;	--21106
local chunky = 17112;
local instanceId = 71;
local zoneNpc = 214104;  --113269

local spawns = {[17013] = {"Base",2},[17008] = {"Base",3},[17014] = {"Base",1},[17007] = {"Base",3},[17015] = {"Base",2},
[17011] = {"Enraged",2},[17033] = {"Enraged",3},[17004] = {"Enraged",3},
[17036] = {"Chief",3},[17111] = {"Chief",2},[17038] = {"Chief",3},[17002] = {"Chief",2},
[17030] = {"Depop",1},[17000] = {"Depop",1},[17028] = {"Depop",1},[17029] = {"Depop",1},[17109] = {"Depop",1},[17051] = {"Depop",5},[17001] = {"Depop",3},[17016] = {"Depop",2},
[17022] = {"Warlord",2},[17037] = {"Warlord",3},[17049] = {"Warlord",4},[17023] = {"Warlord",4},[17048] = {"Warlord",3},[17035] = {"Warlord",5},[17042] = {"Warlord",4},
[king] = {"King",1},
[zoneNpc] = {"ZoneLine",1},
[chunky] = {"Chunky",1}};

local classItems = {["Warrior"] = {104177,104178,104180,104173,104176,104179,104174,125500,135500},
["Paladin"] = {103153,103154,103156,103150,103152,103155,103151,109310,105403},
["Shadow Knight"] = {103143,103144,103146,103140,103142,103145,103141,109310,114367},
["Bard"] = {104156,104157,104159,104153,104155,104158,104154,105364,105364},
["Monk"] = {125724,101192,125726,125716,125723,125725,125719,106615,106615},
["Rogue"] = {103169,103170,103172,103161,103168,103171,103164,107407,107407},
["Ranger"] = {103189,103190,103192,103181,103188,103191,103184,105500,115500},
["Shaman"] = {104945,104942,104941,104947,104943,104944,104946,109311,107223},
["Cleric"] = {104925,104922,104921,101408,104923,104924,104926,109311,105228},
["Druid"] = {110105,102280,101368,101408,110336,102461,102405,109311,115228},
["Necromancer"] = {110360,102336,101368,101408,102458,101366,101320,113400,127318},
["Enchanter"] = {110360,102336,101368,101408,102458,101366,125603,113400,107318},
["Magician"] = {110360,102336,101368,101408,102458,101366,101360,113400,117318},
["Wizard"] = {110360,102336,101368,101408,102458,101366,101354,113400,137318},
["Beastlord"] = {125724,111192,125726,125716,125723,125725,125719,116615,126615}};
local wall;

function event_encounter_load(e)
	instanceId = eq.get_zone_instance_id();
	if(instance_id ~= 0) then
		eq.register_npc_event("bbevent", Event.spawn, -1, AllSpawn);
		eq.register_npc_event("bbevent", Event.death_complete, -1, AllDeath);
		eq.register_npc_event("bbevent", Event.say, chunky, QuestSay);
		eq.register_player_event("bbevent", Event.level_up, LevelUp);
		eq.register_npc_event("bbevent", Event.timer, -1, Timers);
		eq.register_npc_event("bbevent", Event.slay, -1, KingSlay);
		eq.register_player_event("bbevent", Event.enter_zone, EnterZone);
		eq.register_player_event("bbevent", Event.death, PlayerDeath);
		eq.register_npc_event("bbevent", Event.enter, zoneNpc, ZoneLine);
		eq.repop_zone();
		eq.spawn2(zoneNpc, 0, 0, 25, -163, 25, 126);	-- wall for zone outs
		eq.spawn2(chunky, 0, 0, -30,128, 3, 378);
		eq.spawn2(zoneNpc, 0, 0, -340, 48, 3, 126);
	end
end

function ZoneLine(e)
	e.other:MovePCInstance(17,instanceId,-55,127,3,100);
	e.other:Message(15,"You will never leave this place!");
end


function PlayerDeath(e)
	e.other:MovePCInstance(17, instanceId, -55,127,3, 100);
	wipeAggro(e.self);
	e.self:SpellFinished(756,e.self);
	return -1
end

function AllSpawn(e)
	instanceId = eq.get_zone_instance_id();
	if(instance_id ~= 0) then
		local NpcID = e.self:GetNPCTypeID();
		local mod = spawns[NpcID][2];
		if (mod == nil)  then
			mod = 1;
		end
		addLoot(e);
		e.self:ModifyNPCStat("max_hp",tostring(e.self:GetMaxHP() * mod));
		if (spawns[NpcID][1] == "Base") then
			e.self:Heal();
		elseif (spawns[NpcID][1] == "Enraged") then
			e.self:SetRace(39);
			e.self:ChangeSize(6);
			e.self:ModifyNPCStat("max_hit",tostring(e.self:GetMaxDMG() * ((mod * 3 / 10) + 1)));
			e.self:ModifyNPCStat("runspeed","1.75");
			e.self:TempName("an_Enraged_Gnoll");
			e.self:SetTexture(3);
		elseif (spawns[NpcID][1] == "Chief") then
			e.self:Heal();
			e.self:ChangeSize(8);
			e.self:ModifyNPCStat("max_hit",tostring(e.self:GetMaxDMG() * ((mod / 10) + 1)));
			e.self:ModifyNPCStat("runspeed","1.25");
			e.self:TempName("a_Gnoll_Chieftain");
			e.self:SetSpecialAbility(3, 1);
			e.self:SetTexture(0);
		elseif (spawns[NpcID][1] == "Warlord") then
			e.self:Heal();
			e.self:ChangeSize(10);
			e.self:ModifyNPCStat("max_hit",tostring(e.self:GetMaxDMG() * ((mod / 10) + 1)));
			e.self:ModifyNPCStat("runspeed","1.50");
			e.self:TempName("a_Gnoll_Warlord");
			e.self:SetTexture(1);
			e.self:ModifyNPCStat("see_invis","1");
			e.self:SetSpecialAbility(2, 1);
			e.self:SetSpecialAbility(5, 1);
		elseif (spawns[NpcID][1] == "Depop") then
			eq.set_timer(tostring(NpcID),1000);
		elseif (spawns[NpcID][1] == "King") then	-- gnoll king npc
			e.self:SetLevel(20);
			e.self:SetRace(39);
			e.self:ModifyNPCStat("max_hp","10000");
			e.self:Heal();
			e.self:ChangeSize(20);
			e.self:ModifyNPCStat("max_hit","30");
			e.self:ModifyNPCStat("min_hit","10");
			e.self:ModifyNPCStat("runspeed","0");
			e.self:TempName("The_Gnoll_King");
			e.self:SetTexture(1);
			e.self:ModifyNPCStat("see_invis","1");
			e.self:ModifyNPCStat("see_hide","1");
			e.self:SetSpecialAbility(1, 1);
			e.self:AddItem(31951,1);
			e.self:AddItem(31951,1);
			e.self:ClearItemList();
		elseif (spawns[NpcID][1] == "Chunky") then
			e.self:SetRace(10);
			e.self:ChangeSize(8);
			e.self:ModifyNPCStat("runspeed","0");
			e.self:TempName("Chunky");
			e.self:SetTexture(0);
			e.self:AddItem(9629,1);
			e.self:AddItem(11138,1);
			e.self:AddItem(11429,1);
			e.self:AddItem(12595,1);
			e.self:AddItem(16693,1);
			e.self:AddItem(19440,1);
			e.self:AddItem(32129,1);
			e.self:AddItem(22999,1);
			e.self:AddItem(28854,1);
		elseif (spawns[NpcID][1] == "ZoneLine") then
			eq.set_proximity(e.self:GetX() - 30,e.self:GetX() + 30,e.self:GetY() - 30, e.self:GetY() + 30, e.self:GetZ() - 20,e.self:GetZ() + 20);
		else
			e.self:Shout(tostring(NpcID));
		end
	end
end

function addLoot(e)
	local getLoot = math.random(100);
	if (getLoot > 80) then
		local lootNum = math.random(0,6);
		e.self:AddItem(potions[lootNum],1)	
	end
end

function AllDeath(e)
	instanceId = eq.get_zone_instance_id();
	if(instance_id ~= 0) then
		local player_list = eq.get_entity_list():GetClientList();
		if(player_list ~= nil) then
			for player in player_list.entries do
				if (player:GetLevel() < 17) then
					player:AddLevelBasedExp(5);		-- modify this % based on type of mob.
				end
			end
		end
		local NpcID = e.self:GetNPCTypeID();
		if (spawns[NpcID][1] == "Base") then
			baseCnt = baseCnt + 1;
		elseif (spawns[NpcID][1] == "Enraged") then
			enragedCnt = enragedCnt + 1;
		elseif (spawns[NpcID][1] == "Chief") then
			chiefCnt = chiefCnt + 1;
		elseif (spawns[NpcID][1] == "Warlord") then
			warlordCnt = warlordCnt + 1;
		elseif (spawns[NpcID][1] == "King") then
			give_tokens();
		end
		if (enragedCnt > 49 and chiefCnt > 39 and warlordCnt > 19 and king_spawned == false) then
--		if (enragedCnt > 10 and chiefCnt > 10 and warlordCnt > 10 and king_spawned == false) then
			eq.spawn2(king, 0, 0, 132, 200, -56, 380);	
			local player_list = eq.get_entity_list():GetClientList();
			if(player_list ~= nil) then
				for player in player_list.entries do
					player:CameraEffect(3000, 8);
					player:Message(15,"You tremble at the power of The Gnoll King");
				end
			end
			king_spawned = true;
		end
	end
end

function Timers(e)
	eq.depop_all(tonumber(e.timer));
	eq.stop_timer(e.timer);	
end

function QuestSay(e)
	if (e.message:findi("hail")) then
		e.self:Say("Hello Travelers, I am in need of an assistance, will you [" .. eq.say_link("aid") .. "] me?");
	elseif (e.message:findi("aid")) then
		e.self:Say("I was tasked with culling the blackburrow horde, but alas, I have proven too weak to finish the task on my own.  If you would be willing to [" .. eq.say_link("assist") .. "], I would be greatly in your debt.");
	elseif (e.message:findi("assist")) then
		e.self:Say("I need assistance in slaying fifty enraged gnolls, thirty of their chieftains and finally twenty of their warlords. If you happen to fall in battle, I can [" .. eq.say_link("summon") .. "] your body, you have only to ask. I will also keep count of the [" .. eq.say_link("slain") .. "] if you need a reminder.")
	elseif (e.message:findi("summon")) then
		eq.summon_all_player_corpses(e.other:CharacterID(), e.other:GetX(), e.other:GetY(), e.other:GetZ(), e.other:GetHeading());
	elseif (e.message:findi("slain")) then
		e.self:Say(" You have slain " .. tostring(enragedCnt) .. " enraged, " .. tostring(chiefCnt) .. " chieftains, and " .. tostring(warlordCnt) .. " warlords");
	end
end

function EnterZone(e)
	instanceId = eq.get_zone_instance_id();
	if(instance_id ~= 0) then
		e.self:BuffFadeAll();
		e.self:SpellFinished(2049,e.self);
		local race = e.self:GetRace();
		if (race == 2 or race == 9 or race == 10 or race == 128 or race == 130) then
			e.self:ChangeSize(e.self:GetSize() - 2);
		end
		if (e.self:GetLevel() == 1) then
			local class = e.self:Class();
			if (class == "Druid" or class == "Ranger") then
				e.self:SummonItem(10307);
			elseif (class == "Cleric") then
				e.self:SummonItem(10026,20);
				e.self:SummonItem(10026,20);
				e.self:SummonItem(10026,20);
			elseif (class == "Magician") then
				e.self:SummonItem(10015,20);
				e.self:SummonItem(10015,20);
				e.self:SummonItem(10015,20);
			elseif (class == "Necromancer" or class == "Shadow Knight") then
				e.self:SummonItem(13073,20);
				e.self:SummonItem(13073,20);
				e.self:SummonItem(13073,20);
			elseif (class == "Enchanter") then
				e.self:SummonItem(13080,20);
				e.self:SummonItem(13080,20);
				e.self:SummonItem(13080,20);
			end
		end
	end
end

function LevelUp(e)
	instanceId = eq.get_zone_instance_id();
	if(instance_id ~= 0) then
		local class = e.self:Class();
		local level = e.self:GetLevel();
		if (level < 18) then
			if (level < 11) then
				e.self:SummonItem(classItems[e.self:Class()][level-1],10);			-- give the new item for that level for that class
				if (level == 2) then
					e.self:SummonItem(classItems[e.self:Class()][level-1],10);		-- get both bracers at level 2
				end
			end
			for i = 0, 73 do		-- skill up
				if (i < 55 or i > 69) then
					if (e.self:CanHaveSkill(i)) then
						e.self:SetSkill(i,e.self:MaxSkill(i));
					end	
				end
			end
			eq.scribe_spells(e.self:GetLevel());
			local spellIds = {5011,3291,2740,2741,2742,3250,3251,3277,3278,3279,2759,5012,2750,3264,2758,5869,5870,5988,5881,5882,5883,5949};		-- spells that get memmed that shouldn't be.
			for _,v in pairs(spellIds) do
				local slot = e.self:FindSpellBookSlotBySpellID(v);
				e.self:UnscribeSpell(slot);
			end
			if (class == "Bard") then
				if (level == 5) then
					e.self:SummonItem(13157);
				elseif (level == 8) then
					e.self:SummonItem(13011);
				elseif (level == 11) then
					e.self:SummonItem(13012);
				elseif (level == 14) then
					e.self:SummonItem(13001);
				end
			end
			e.self:Heal();
			e.self:Mana();
		end
	end
end

function give_tokens()
	local player_list = eq.get_entity_list():GetClientList();
    if(player_list ~= nil) then
        for player in player_list.entries do
            player:SummonItem(100010,1);
		end
	end
end

function wipeAggro(e)
	local mob_list = eq.get_entity_list();
	mob_list:RemoveFromHateLists(e);
end
