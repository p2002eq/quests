--Relv_the_Mysterious (210090)
--Starts event for Falto, Lord_of_Thunder (210468)
--postorms

local event_id;
local group_counter = 0;
local raid_id_by_event = nil;
local player_list = {};
local player_counter = 0;

function event_spawn(e)
	eq.set_timer("monitor", 1 * 1000); --30 seconds typical interval
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local group = e.other:GetGroup();
	local raid = e.other:GetRaid();
	local zone_id = eq.get_zone_id();
	local trigger_mob = eq.get_entity_list():IsMobSpawnedByNpcTypeID(210484); --#Falto_trigger (210484)

	if e.message:findi("hail") and qglobals.relv_hail == nil then	--preflag not done
		e.self:Say("Greetings to you, small one. I see you have made great progress through our fair planar dwelling. Were it not for the dubious undertakings by someone... or something, I would be more than glad to welcome you here. Unfortunately, there have been dangerous tidings afoot. Just look at the trees around you. This [" .. eq.say_link("destruction") .. "] is the work of something altogether unseen, at least by me.");
		eq.set_global("relv_hail","1",5,"M30");
	elseif e.message:findi("destruction") then
		eq.delete_global("relv_dialogue");
		e.self:Say("There was a time when all the trees were green and alive, though as you can see, that time is no more. I am unsure what it is that has caused the damage, but I do know that whatever it is has caused a great deal of damage and will continue to do so unless someone like yourself has the courage to rid us of it. [" .. eq.say_link("continue") .. "]");
	elseif e.message:findi("continue") and qglobals.relv_dialogue == nil then
		e.self:Emote("looks about him at the charred trees and sighs. 'If this destruction is not stopped, we may soon not have any forest left, which would cause a great disturbance in the balance of this land. If it were in my power, I would go forth through the brush here to try and stop whatever it is that is causing this. Unfortunately, I cannot leave, as I must protect the rest of the trees here from any beasts that may try to defile these lands further. This is why I must ask for an outsider to help, so that I may send them forth through the brush into the clearing beyond to find the menace and destroy it at the source. [" .. eq.say_link("continue") .. "]");
		eq.set_global("relv_dialogue","1",5,"M30");
	elseif e.message:findi("continue") and tonumber(qglobals.relv_dialogue) == 1 then
		e.self:Say("I have waited patiently for someone to come along to defeat this scourge on the land, and you may just be the one. If you feel you are [" .. eq.say_link("courageous") .. "] enough to go forth, please let me know and I will make preparations to assist you through the brush to end whatever suffering the forest is feeling beyond.");
	elseif e.message:findi("courageous") then
		e.self:Say("As I had hoped. I regret that I have only enough strength to send four parties through the brush to the other side, and only one party at a time. When each party is ready to move forth, tell me that [" .. eq.say_link("We are ready", false, "you are ready") .. "] and I will make a clearing for you to go through. Be wary, as my magic will only last for three hours before you are pulled back to me, so do whatever you can before that time is up!");

	elseif e.message:findi("we are ready") and raid:IsGroupLeader(e.other:GetName()) then
		eq.set_timer("monitor", 5 * 1000); 	--restart incase somehow got stopped
		raid_id = raid:GetID();
		raid_group = raid:GetGroup(e.other:GetName());
	
		--Check first for rejoining players
		if raid_id_by_event == raid_id and player_check(e.other:CharacterID()) then
			event_id = 1;
		--Check next for maze_ids already established by another raid but not yet started and below 4 group max
		elseif raid_id_by_event == raid_id and group_counter < 4 then
			event_id = 1;
		--Next will assign new maze if available since not a rejoining character and 
		elseif qglobals["pop_relv_event"] == nil and group_counter < 4 and raid_id_by_event == nil and trigger_mob then
			raid_id_by_event = raid_id;	--assign new raid id
			event_id = 1;	
		else	
			event_id = -1;	--no event available
		end
		
		if event_id > 0 and (group_counter < 4 or (raid_id_by_event == raid:GetID() and player_check(e.other:CharacterID())))  then
			eq.set_global("pop_relv_event","1",3,"H3");	
			--handle group counter increments	
			if not player_check(e.other:CharacterID()) then	--not incrementing counter if group is rejoining (player check done separately to still monitor 24 limit)
				group_counter = group_counter + 1;	--group counter
			end			

			--Raid Member handling
			local client_list = eq.get_entity_list():GetClientList();
			if client_list ~= nil then
				for client in client_list.entries do
					if client:IsRaidGrouped() and client:GetRaid():GetID() == raid_id and client:GetRaid():GetGroup(client:GetName()) == raid_group then
						client_qglobal = eq.get_qglobals(client);
						if client:CastToMob():CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
							if player_check(client:CharacterID()) then 	--rejoining character to raid
								client:Message(7,"A powerfully green aura surrounds Relv as he opens a small rift in the brushes beyond, then sends you and your party forth into the burning forest beyond.");
								client:MovePC(zone_id,-1047,6076,-480,220);
								GM_Message(13,client:GetName() .. " is rejoining Event (Raid ID #: " .. client:GetRaid():GetID() .. ") Char ID: [" .. client:CharacterID() .. "]");
								GM_Message(14,"Total player count for Maze  is [" .. player_counter .. "]");
							elseif player_counter < 24 then				--new raid addition
								client:Message(7,"A powerfully green aura surrounds Relv as he opens a small rift in the brushes beyond, then sends you and your party forth into the burning forest beyond.");
								client:MovePC(zone_id,-1047,6076,-480,220);
								player_counter = player_counter + 1;
								player_list[player_counter] = client:CharacterID();	--store character ID in table
								GM_Message(4,client:GetName() .. " is a new addition for Event (Raid ID #: " .. client:GetRaid():GetID() .. ") Char ID: [" .. client:CharacterID() .. "]");
								GM_Message(14,"Total player count for Event is [" .. player_counter .. "]");
							end
						end
					end
				end
			end		
		elseif event_id == -1 then
			e.self:Say("I have exhausted my magic and do not possess enough power to bring more of you to the other side.");
		else
			e.self:Say("You are very brave to offer your assistance, but you should establish a raiding party before we embark on this task.")
		end
	elseif e.message:findi("hail") and tonumber(qglobals.relv_hail) == 1 then
		e.self:Emote("looks at you with a slight hint of hindrance. 'You are an odd individual, truly. What manner of speaking is it to hail me once more, after I have already begun conversing with you? Hmm, considerably odd. May I continue?'");
		eq.set_global("relv_hail","2",5,"M30");
	elseif e.message:findi("hail") and tonumber(qglobals.relv_hail) == 2 then
		e.self:Emote("sighs. 'I suppose that you are not here to help as I had once hoped. Certainly someone that was here to help would have a deeper vocabulary than that of just 'hail'. In any case friend, if you would like to help or hear my plight, please come back. For now I can see that you are far too busy to assist.'");
		eq.set_global("relv_hail","3",5,"M30");
	elseif e.message:findi("hail") and tonumber(qglobals.relv_hail) == 3 then
		e.self:Say("I tire of this endless babble! Please remove yourself from my presence if all you plan on doing is repeating the same thing over and over again! I have no need of this kind of harassment, you foul affront to intelligent folk!");
		eq.set_global("relv_hail","4",5,"M30");
	elseif e.message:findi("hail") and tonumber(qglobals.relv_hail) == 4 then
		e.self:Emote("merely sighs and ignores you.");
	end
end

function player_check(char_id)
	if player_counter ~= nil then
		num = player_counter;
		for n = 1,num do
			if player_list[n] == char_id then
				return true;
			end
		end
	end
	return false;
end

function client_check(player)
	for x = 1,player_counter do 
		if player:CharacterID() == player_list[x] then
			return true;
		end
	end
	return false;
end

function event_timer(e)
	if e.timer == "monitor" then
		local qglobals = eq.get_qglobals(e.self);
		eq.stop_timer(e.timer);
		eq.set_timer("monitor", 30 * 1000);	--reset to 30 sec interval checks
		--check if lockout expired and reset if so
		if qglobals.pop_relv_event == nil and raid_id_by_event ~= nil then
			if not eq.get_entity_list():IsMobSpawnedByNPCTypeID(210484) then
				falto_tigger = eq.get_entity_list():GetSpawnByID(369023):Repop(5);	--repop trigger for next event
			else
				eq.signal(210484,99); --signal event reset
			end			
			EventReset();
		end
		
		
		local client_list = eq.get_entity_list():GetClientList();
		if client_list ~= nil then
			for client in client_list.entries do
				if not client_check(client) and client:GetX() < 500 and client:GetY() > 4000 and not client:GetGM() then
					local zone_id = eq.get_zone_id();
					client:Message(7,"Relv the Mysterious has moved you back to safety.");
					client:MovePC(zone_id,1580,2130,-446,350);
				end
			end
		end
	end
end

function event_signal(e)	--debugging
	if e.signal == 1 then	--reset event signal on event success
		eq.delete_global("pop_relv_event");
		EventReset();
	elseif e.signal == 99 then
		for n = 1,3 do 
			GM_Message(13,"Maze " .. n .. " group # is: " .. group_counter .. " -- Raid ID: " .. tostring(raid_id_by_event) .. " -- Player Count: " .. tostring(player_counter));	--debug
		end
	elseif e.signal == 98 then
		if player_counter[1] ~= nil then
			num = player_counter[1];
			for n = 1,num do
				GM_Message(13,tostring(player_list[n]));
			end
		end
	end
end

function EventReset()
	group_counter = 0;
	raid_id_by_event = nil;
	player_list = {};
	player_counter = 0;
	GM_Message(14,"Relv Event has been reset!");	--debug
end
	

function event_trade(e)
	local item_lib = require("items");

	if item_lib.check_turn_in(e.self, e.trade, {item1 = 34141}) then  --Lightning Crystals
		e.self:Say("So it was a maniacal Lord of Thunder who was terrorizing our fair forests? What would move a being such as he to do something so awful? It matters not any more; all that matters is that you have returned and helped restore our forest to the safe and serene place that it was, at least for now. Let us hope that this type of thing does not occur in the future. Thank you again, friend. Please take this as a token of gratitude from the forest, as well as myself.");
		e.other:QuestReward(e.other,0,0,0,0,7755,100000);	--Ruby Pendant with a Gold Chain
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end

function GM_Message(color,text)			--DEBUGGING/MONITORING
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:GetGM() then
				client:Message(color,text);
			end
		end
	end
end
