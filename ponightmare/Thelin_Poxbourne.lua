local maze_locs = {[1] = {-4480, 3650, 4, 180}, [2] = {-4480, 4650, 4, 180}, [3] = {-4480, 5650, 4, 180} };
local controllers = {204055, 204056, 204057};
local maze_id;
local maze_counter = {0,0,0};
local raid_id_by_maze = {};
local player_list_by_maze = { [1] = {}, [2] = {}, [3] = {} };
local player_counter = {0,0,0};

function event_spawn(e)
	eq.set_timer("monitor", 1 * 1000); --30 seconds typical interval
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local group = e.other:GetGroup();
	local raid = e.other:GetRaid();
	local zone_id = eq.get_zone_id();
	local thelin1 = eq.get_entity_list():GetMobByNpcTypeID(controllers[1]);
	local thelin2 = eq.get_entity_list():GetMobByNpcTypeID(controllers[2]);
	local thelin3 = eq.get_entity_list():GetMobByNpcTypeID(controllers[3]);	
	
	if e.message:findi("hail") and qglobals.pop_pon_hedge_jezith == nil then	--preflag not done
		e.self:Emote("screams loudly, and then falls asleep once again.");
	elseif e.message:findi("hail") and qglobals.pop_pon_hedge_jezith ~= nil then
		e.self:Say("Who is it?  Are you... really there?  You are!  Please, I beg of you to help me escape from this horrid place.  Terris-Thule is holding me here. She delights in the nightmares she sends me.  To further torture me, she has offered me a pact.  She has said that if I can retrieve my [" .. eq.say_link("dagger") .. "], then I am free to go.  She does this only because she knows that I cannot retrieve it on my own.");
	elseif e.message:findi("dagger") and qglobals.pop_pon_hedge_jezith ~= nil then
		e.self:Say("She has taken the only thing that has brought me any joy in my life.  She took it and broke it into seven pieces.  She placed them deep within the labyrinth of my nightmare.  I must retrieve the pieces. Will you [" .. eq.say_link("help") .. "] me?  Please, I beg for your mercy.")
	elseif e.message:findi("help") and qglobals.pop_pon_hedge_jezith ~= nil then
		e.self:Say("I don't know who you are, but I'm thankful that you have stumbled upon me.  I can bring you into my dream state, but my powers are limited so I can only handle eighteen at once.  Please, when you are prepared have the leader of each of your band of adventurers tell me they are [" .. eq.say_link("ready") .. "].")
	elseif e.message:findi("ready") and raid:IsGroupLeader(e.other:GetName()) and qglobals.pop_pon_hedge_jezith ~= nil then --and maze_id > 0 and (maze_counter[maze_id] < 3 or (raid_id_by_maze[maze_id] == raid:GetID() and player_check(maze_id, e.other:CharacterID())))  then
		eq.set_timer("monitor", 5 * 1000); 	--restart incase somehow got stopped
		raid_id = raid:GetID();
		raid_group = raid:GetGroup(e.other:GetName());
	
		--Maze availability checking routine
		--Check first for rejoining players
		if raid_id_by_maze[1] == raid_id and player_check(1, e.other:CharacterID()) then
			maze_id = 1;
		elseif raid_id_by_maze[2] == raid_id and player_check(2, e.other:CharacterID()) then
			maze_id = 2;
		elseif raid_id_by_maze[3] == raid_id and player_check(3, e.other:CharacterID()) then
			maze_id = 3;
		--Check next for maze_ids already established by another raid but not yet started and below 3 group max
		elseif raid_id_by_maze[1] == raid_id and qglobals["pop_pon_maze_event_1"] == nil and maze_counter[1] < 3 and thelin1:GetY() == 3604 then
			maze_id = 1;
		elseif raid_id_by_maze[2] == raid_id and qglobals["pop_pon_maze_event_2"] == nil and maze_counter[2] < 3 and thelin1:GetY() == 4604 then
			maze_id = 2;
		elseif raid_id_by_maze[3] == raid_id and qglobals["pop_pon_maze_event_3"] == nil and maze_counter[3] < 3 and thelin1:GetY() == 5604 then
			maze_id = 3;
		--Next will assign new maze if available since not a rejoining character and 
		elseif qglobals["pop_pon_maze_event_1"] == nil and maze_counter[1] < 3 and thelin1:GetY() == 3604 and raid_id_by_maze[1] == nil then
			raid_id_by_maze[1] = raid_id;	--assign new raid id
			maze_id = 1;	--maze 1 open
		elseif qglobals["pop_pon_maze_event_2"] == nil and maze_counter[2] < 3 and thelin2:GetY() == 4604 and raid_id_by_maze[2] == nil then
			raid_id_by_maze[2] = raid_id;	--assign new raid id
			maze_id = 2;	-- maze_id 2 available
		elseif qglobals["pop_pon_maze_event_3"] == nil and maze_counter[3] < 3 and thelin3:GetY() == 5604 and raid_id_by_maze[3] == nil then
			raid_id_by_maze[3] = raid_id;	--assign new raid id
			maze_id = 3;	-- maze_id 3 available
		else	
			maze_id = -1;	--no maze_ids available
		end
		
		if maze_id > 0 and (maze_counter[maze_id] < 3 or (raid_id_by_maze[maze_id] == raid:GetID() and player_check(maze_id, e.other:CharacterID())))  then
			e.self:Emote("closes his eyes and falls asleep immediately.  He looks peaceful for a moment and then screams in agony!");	
				
			--handle group counter increments	
			if not player_check(maze_id, e.other:CharacterID()) then	--not incrementing counter if group is rejoining (player check done separately to still monitor 18 limit)
				maze_counter[maze_id] = maze_counter[maze_id] + 1;	--group counter
			end			

			--Raid Member handling
			local client_list = eq.get_entity_list():GetClientList();
			if client_list ~= nil then
				for client in client_list.entries do
					if client:IsRaidGrouped() and client:GetRaid():GetID() == raid_id and client:GetRaid():GetGroup(client:GetName()) == raid_group then
						client_qglobal = eq.get_qglobals(client);
						if client_qglobal.pop_pon_hedge_jezith ~= nil and client:CastToMob():CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
							if player_check(maze_id, client:CharacterID()) then 	--rejoining character to raid
								client:MovePC(zone_id,unpack(maze_locs[maze_id]));
								GM_Message(13,client:GetName() .. " is rejoining Maze " .. maze_id .. " (Raid ID #: " .. client:GetRaid():GetID() .. ") Char ID: [" .. client:CharacterID() .. "]");
								GM_Message(14,"Total player count for Maze " .. maze_id .. " is [" .. player_counter[maze_id] .. "]");
							elseif player_counter[maze_id] < 18 then				--new raid addition
								client:MovePC(zone_id,unpack(maze_locs[maze_id]));
								player_counter[maze_id] = player_counter[maze_id] + 1;
								player_list_by_maze[maze_id][player_counter[maze_id]] = client:CharacterID();	--store character ID in table
								GM_Message(4,client:GetName() .. " is a new addition for Maze " .. maze_id .. " (Raid ID #: " .. client:GetRaid():GetID() .. ") Char ID: [" .. client:CharacterID() .. "]");
								GM_Message(14,"Total player count for Maze " .. maze_id .. " is [" .. player_counter[maze_id] .. "]");
							end
						end
					end
				end
			end		
		elseif maze_id == -1 then
			e.self:Say("I have already brought eighteen of you into my dream world. I do not possess the power to bring any more through the portal.");
		end
	elseif e.message:findi("ready") then	--player not in raid
			e.self:Say("You are very brave to offer your assistance, but you should establish a raiding party before I bring you into the land of nightmares.")
	end
end

function player_check(mz_id, char_id)
	if player_counter[mz_id] ~= nil then
		num = player_counter[mz_id];
		for n = 1,num do
			if player_list_by_maze[mz_id][n] == char_id then
				return true;
			end
		end
	end
	return false;
end

function client_check(player)
	for n = 1,3 do
		for x = 1,player_counter[n] do 
			if player:CharacterID() == player_list_by_maze[n][x] then
				return true;
			end
		end
	end
	return false;
end

function event_timer(e)
	if e.timer == "monitor" then
		eq.stop_timer(e.timer);
		eq.set_timer("monitor", 30 * 1000);	--reset to 30 sec interval checks
		client_list = eq.get_entity_list():GetClientList();
		if client_list ~= nil then
			for client in client_list.entries do
				if not client_check(client) and client:GetX() < -3000 and client:GetY() > 2000 and not client:GetGM() then
					client:Message(7,"You have been banished!");
					client:MovePC(204, 1668, 282, 212, 0);
				end
			end
		end
	end
end

function event_signal(e)	--debugging
	if e.signal == 1 then	--reset event signal from maze 1 Thelin
		maze_counter[e.signal] = 0;
		raid_id_by_maze[e.signal] = nil;
		player_list_by_maze[e.signal] = {};
		player_counter[e.signal] = 0;
		GM_Message(14,"Maze " .. e.signal .. " has been reset!");	--debug
	elseif e.signal == 2 then	--reset event signal from maze 3 Thelin
		maze_counter[e.signal] = 0;
		raid_id_by_maze[e.signal] = nil;
		player_list_by_maze[e.signal] = {};
		player_counter[e.signal] = 0;
		GM_Message(14,"Maze " .. e.signal .. " has been reset!");	--debug
	elseif e.signal == 3 then	--reset event signal from maze 3 Thelin
		maze_counter[e.signal] = 0;
		raid_id_by_maze[e.signal] = nil;
		player_list_by_maze[e.signal] = {};
		player_counter[e.signal] = 0;
		GM_Message(14,"Maze " .. e.signal .. " has been reset!");	--debug
	elseif e.signal == 99 then
		for n = 1,3 do 
			GM_Message(13,"Maze " .. n .. " group # is: " .. maze_counter[n] .. " -- Raid ID: " .. tostring(raid_id_by_maze[n]) .. " -- Player Count: " .. tostring(player_counter[n]));	--debug
		end
	elseif e.signal == 98 then
		if player_counter[1] ~= nil then
			num = player_counter[1];
			for n = 1,num do
				e.self:Shout(tostring(player_list_by_maze[1][n]));
			end
		end
	end
end
	

function event_trade(e)
	local item_lib = require("items");
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
