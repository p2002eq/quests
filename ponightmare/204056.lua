local maze_id;  

function event_spawn(e)
	EventReset();
	eq.set_timer("monitor", 1 * 1000);
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and not started then
		e.self:Say("Has everyone made it here safely?  When you are [" .. eq.say_link("ready") .. "] I will seal off my dream and we can begin.  We must be careful here, as visions lurk around every corner.  Are you ready to follow?  I know where all the pieces of the dagger are, but I cannot collect them all on my own.");
	elseif e.message:findi("ready") and not started then
		e.self:Say("Please stay close. I know not what horrors Terris will unleash upon us.")
		EventReset();
		eq.start(161);	--pathing grid Maze #2
		started = true;
		eq.stop_all_timers();
		eq.set_global("pop_pon_maze_event_" .. maze_id, "1",3,"H1");	--1hr lockout
	end
end

function event_waypoint_arrive(e)
	if e.wp == 27 and not hilt then			--dagger hilt (Encounter #1)
		hilt = true;
		e.self:Emote("kneels down and picks up a dagger hilt.");
		spawn_mobs(1,2);					--(location, # of mobs)
	elseif e.wp == 47 and not shard then	--dagger shard (Encounter #2)
		shard = true;
		e.self:Emote("slowly picks up a shard of a dagger blade.");
		spawn_mobs(2,3);
	elseif e.wp == 58 and not blade then	--dagger blade (Encounter #3)
		blade = true;
		e.self:Emote("picks up the top half of a dagger blade.");
		spawn_mobs(3,4);
	elseif e.wp == 72 and not handle then	--dagger handle (Encounter #4)
		handle = true;
		e.self:Emote("picks up a dagger handle with a small hole in it.");
		spawn_mobs(4,5);
	elseif e.wp == 88 and not gem then		--dagger gem (Encounter #5)
		gem = true;
		e.self:Emote("picks up a small gem to place inside the handle.");
		spawn_mobs(5,6);
	elseif e.wp == 98 and not tip then		--dagger tip (Encounter #6)
		tip = true
		e.self:Emote("kneels down and picks up a dagger blade tip.");
		spawn_mobs(6,7);
	elseif e.wp == 106 and not construct then
		construct = true;		
		eq.spawn2(204460,0,0,-4550,5118,-5,256) 	-- #a_construct_of_nightmares (Final Encounter)
	end
end

function event_signal(e)
	if e.signal == 99 then
		construct_dead = true;	--signal from construct on death
	end
end

function EventReset()
	maze_id = 2;	--for qglobal description
	counter = 0;
	started = false;
	hilt = false;
	shard = false;
	blade = false;
	handle = false;
	gem = false;
	tip = false;
	construct = false;
	construct_dead = false;
end

function spawn_mobs(loc,num)
	local spawn_locs = { [1] = {-4719,5246,4,130}, [2] = {-4758,5086,4,29}, [3] = {-4920,4710,4,100}, [4] = {-4136, 4645, 4,100}, [5] = {-4276,4909,4,100}, [6] = {-4436,5379,4,93} };
	for n = 1,num do
		local mob = eq.ChooseRandom(204459,204462,204463,204465,204063);	--mobs:  a_bloodthirsty_raven, a_sinister_nightstalker, a_thulian_nightstalker, an_abhorrent_nightstalker, an_agressor_arachnid
		eq.spawn2(mob,0,0,spawn_locs[loc][1] + math.random(-5,5), spawn_locs[loc][2] + math.random(-5,5), spawn_locs[loc][3], spawn_locs[loc][4]);	
	end
end



function event_trade(e)
    local item_lib = require("items");	
	
    if construct_dead and item_lib.check_turn_in(e.self, e.trade, {item1 = 9258}) then  
		e.self:Emote("takes the final shard from you and places all of the pieces on the ground. The pieces reassemble and fuse back together into a completed dagger.  Thelin picks the dagger up and hands it to you.")

		--spawn flag version of Thelin
		eq.spawn2(204479,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	
		eq.depop_with_timer();
	end	
	
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer == "monitor" then
		if not started and player_check(e) then
			eq.stop_timer(e.timer);
			eq.set_timer("reset", 20 * 60 * 1000) -- 20 min to reset if event not started but player ports in
		end
	elseif e.timer == "reset" then
		eq.stop_timer(e.timer);
		eq.signal(204070, maze_id); --signal controller to reset counters
		EventReset();
	end
end

function player_check(e)
	local client_list = eq.get_entity_list():GetClientList();
	if client_list ~= nil then
		for client in client_list.entries do
			if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
				return true;
			end
		end
		return false
	end
end

function event_death_complete(e)
	--banish nearby players
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
				client:CastToMob():SpellFinished(3073, client:CastToMob());		--Banishment of Nightmares
			end
		end
	end
	
	eq.signal(204070, maze_id); --signal controller to reset counters
	eq.delete_global("pop_pon_maze_event_" .. maze_id);
end

