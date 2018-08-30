-- #Thelin_Poxbourne (204479)
--Hedge Event - spawned after hand-in from construct
--ponightmare

local TM = require("thread_manager");
local counter;

function event_spawn(e)
	counter = 0;
	
	--select final destination for thelin and terris spawn location based on maze 1-3
	maze_locs = {[1] = {-4543,3981,4.5}, [2] = {-4543,4981,4.5}, [3] = {-4543,5981,4.5} };
	terris_locs = {[1] = {-4544,3943,30}, [2] = {-4544,4943,30}, [3] = {-4544,5943,30}}
	maze_id = checkMaze(e);
	
	--spawn Terris Thule
	eq.spawn2(204065,0,0,terris_locs[maze_id][1],terris_locs[maze_id][2],terris_locs[maze_id][3],508);	
	
	e.self:SetRunning(true);
	e.self:MoveTo(maze_locs[maze_id][1],maze_locs[maze_id][2],maze_locs[maze_id][3],260,true);
	eq.set_timer("monitor", 1000);
	eq.set_timer("TMHB", 500);
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if e.message:findi("hail") and not checkTerris(e) then
		e.other:Message(7,"Thelin Poxbourne tells you, 'Please destroy her for subjecting me to her hideous visions.'  Thelin closes his eyes and is swept away from his nightmare.  The land of pure thought begins to vanish from around you.");
		if qglobals.pop_pon_construct == nil and counter < 18 then
			e.other:Message(15,"You've received a character flag!");
			eq.set_global("pop_pon_construct","1",5,"F");
			counter = counter + 1;
		end
		e.other:SendSpellEffect(78,0,100,false,0);	--simulate spell effect
		e.other:MovePC(204,-1580,1020,126,261);	--port out player 		
	end
end

function Finale()
	thelin:Say("Terris, hear me now!  I have done as you asked.  My beloved dagger is whole once again!  Now keep up your part of the bargain.")
	TM:Wait(7);
	thelin:Say("Vile wench, I knew in the end it would come to this.  You shall pay dearly for your injustice here.");
	TM:Wait(6);
	thelin:Say("So then my hope is nearly lost.  Take my dagger with you and plunge it deep into her soulless heart.  If I cannot escape from this forsaken plane under her rules, I shall make my own!");
	eq.set_timer("depop", 10 * 60 * 1000);
end

function event_timer(e)
	if e.timer == "monitor" then 
		if e.self:GetX() == maze_locs[maze_id][1] and e.self:GetY() == maze_locs[maze_id][2] then
			eq.stop_timer(e.timer);
			eq.signal(204065,1);
			TM:Create("Thelin",Finale);
		end
	elseif e.timer == "TMHB" then
		thelin = e.self;
		entity_list = eq.get_entity_list();
		TM:GarbageCollect();
		TM:Resume("Thelin");
	elseif e.timer == "depop" then 
		eq.delete_global("pop_pon_maze_event_" .. maze_id);
		eq.signal(204070,maze_id); --signal controller event is over to reset group counter
		eq.depop();
	end
end

function checkMaze(e)
	if e.self:GetY() >= 3700 and e.self:GetY() <= 4500 then
		loc = 1;
	elseif e.self:GetY() >= 4600 and e.self:GetY() <= 5500 then
		loc = 2;
	elseif e.self:GetY() >= 5600 and e.self:GetY() <= 6500 then
		loc = 3;
	end
	return loc;
end

function checkTerris(e)
	local mob_list = eq.get_entity_list():GetMobList();
	if mob_list ~= nil then
		for mob in mob_list.entries do
			if mob:GetNPCTypeID() == 204065 and mob:CalculateDistance(e.self:GetX(),e.self:GetY(),e.self:GetZ()) < 600 then
				return true;
			end
		end
	end
	return false;
end

function event_death_complete(e)
	eq.signal(204070,maze_id); --signal controller event is over to reset group counter
end