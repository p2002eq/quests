----------------------------------------------------------------------
-- Arc: Justice Flagging - Trial of Flame
-- Zone: Plane of Justice
-- NPC: The Tribunal (201452)
-- Flags Used: pop_poj_mavuin, pop_poj_tribunal
--
-- Event NPCS:
-- #spirit_of_flame (201497)
-- #fiend_of_flame (201488)
-- #a_fiery_aggressor (201473)
-- #Punisher_of_Flame (201495)
-- #a_burning_nemesis (201503)
-- #Punisher_of_Flame_ (201504)  (casts AE spells)

----------------------------------------------------------------------

local flame_flag        = 0;
local trial_group       = nil;
local trial_count       = nil;
local client_e          = nil;
local fail				= false;
local trial_x           = 880;
local trial_y           = -660;
local trial_z           = 55;
local trial_h           = 254;
local trial_mobs		= {201497, 201488, 201473, 201503, 201495, 201504 };

local cooldown_timer		= 1800000; -- 30 Minutes
local eject_timer			= 900000; -- 15 Minutes
local fail_timer			= 360000; -- 6 Minutes


function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);

	if (e.message:findi("hail")) then 
		e.self:Emote("fixes you with a dark, piercing gaze.  'What do you [" .. eq.say_link("I want to prove myself",false,"want") .. "], mortal?'");
	elseif (e.message:findi("I want to prove myself")) then
		e.self:Say("The trials of the Tribunal will test the absolute limits of your might and skill.  Many have come before you, tried, and failed.  Are you [" .. eq.say_link("I am prepared", false, "prepared") .. "] for such an ordeal?'");
	elseif (e.message:findi("prepared")) then
		e.self:Emote("nods slightly.  'Very well. When you are ready, you may [" .. eq.say_link("I am ready to begin the trial of flame", false, "begin the trial of flame") .. "]. You must endure the heat of the fire and be sure not to let its creatures reach the center.  We shall judge the mark of your success.'");
	elseif (e.message:findi("ready to begin the trial of flame")) then
		if ( flame_flag == 0 ) then 
			e.self:Say("Then begin.");

			-- Move the Player and their Group to the trial room.
			trial_group = e.other:GetGroup();
			if ( trial_group.valid ) then
				MoveGroup( trial_group, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, trial_x, trial_y, trial_z, trial_h); 
			else
				client_e = e;
				e.other:MovePC(201, trial_x, trial_y, trial_z, trial_h);
			end

			-- Spawn the Controller
			eq.spawn2(201502, 0, 0, 880,-729,55,254); -- #Event_Flame_Control (201502)

			-- Set the Proximity Check Timer; if everyone has left the trial (wipe); then reset things
			eq.set_timer("proximitycheck", 60000);

			-- Set a variable to indicate the Trial is unavailable.
			flame_flag = 1;
		else
			e.self:Say("That trial is already underway.  You must wait.");
		end
	elseif (e.message:findi("what evidence of mavuin") and qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal == nil ) then
		if ( e.other:HasItem(31796) or e.other:HasItem(31842) or e.other:HasItem(31845) or e.other:HasItem(31844) or e.other:HasItem(31846) or e.other:HasItem(31960) ) then	-- Flame, Execution, Stone, Torture, Suffocation, Lashing
			e.self:Say("You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.")
			eq.set_global("pop_poj_tribunal", "1", 5, "F");
			e.other:Message(4, "You've received a character flag!");
		end
	elseif (e.message:findi("i seek knowledge") ) then
		local marks = { 31796, 31842, 31845, 31844, 31846 , 31960 }  -- Flame, Execution, Stone, Torture, Suffocation, Lashing
		local has_six = 1;
		for k,v in pairs(marks) do
			if (not e.other:HasItem(v)) then
				has_six = 0;
			end
		end

		if (has_six == 1) then 
			if (not e.other:HasItem(31599)) then  -- The Mark of Justice
				-- give 31599 to e.other
				e.other:SummonItem(31599); -- The Mark of Justice
			end
		elseif (has_six == 0) then
			e.self:Emote("considers you for a long moment.  'The knowledge of the gods is not so easily given to an unproven mortal.'");
		end
	end
end

function event_timer(e)
	if (e.timer == "ejecttimer") then
		eq.stop_timer(e.timer);
		despawn_trial_mobs()
		if (trial_group ~= nil and trial_group.valid) then
			MoveGroup( trial_group, trial_x, trial_y, trial_z, 250, 456, 825, 9, 180); 
		else
			if (client_e.other:CalculateDistance(trial_x, trial_y, trial_z) <= 180) then
				client_e.other:MovePC( 201, 456, 825, 9, 180 );
			end
		end
		HandleCorpses(trial_x, trial_y, trial_z, 200);
		eq.stop_timer("proximitycheck");
	elseif (e.timer == "cooldown") then
		eq.stop_timer(e.timer);
		if fail then
			eq.zone_emote(7,"An unnatural silence falls around you.  The justice of the Tribunal has been pronounced once again.  The defendants have been found... lacking.");
		end
		--reset variables
		flame_flag = 0;
		client_e = nil;
		trial_group = nil;
		trial_count = nil;
		fail = false;

		despawn_trial_mobs();
		eq.stop_timer("proximitycheck");
		
			
		--e.self:Shout("The Trial of flame is now Available.");
	elseif (e.timer == "proximitycheck") then
		-- The proximitycheck timer is primarily for when a trial has failed
		-- This check will allow the trial to be re-attempted as soon as
		-- everyone has left the trial room (or they are kicked out after
		-- 15minutes by the ejecttimer).

		-- Check to see if all the PCs have left the Trial area; if so
		-- Clean Corpses up and release thoe hold and stop the timer.
		if ( ProximityCheck(trial_x, trial_y, trial_z, 250) == false) then 
			eq.stop_timer(e.timer);
			eq.signal(201502,2);	--signal event fail to #Event_Flame_Control (201502)
			eq.stop_timer("cooldown");
			eq.stop_timer("ejecttimer");
			eq.set_timer("ejecttimer", 100);
			eq.set_timer("cooldown", 200);
		end
	end
end

function event_signal(e)
	if (e.signal == 1) then
		-- Trial was successful
		-- 30min till next Trial can start
		-- 15min Eject Timer to kick any PC out of the Trial Room
		eq.set_timer("ejecttimer", eject_timer);
		eq.set_timer("cooldown"  , cooldown_timer);
		eq.stop_timer("proximitycheck");
	elseif (e.signal == 2) then
		-- Trial Failed
		fail = true;
		eq.set_timer("ejecttimer", fail_timer);
		eq.set_timer("cooldown"  , fail_timer);
		eq.stop_timer("proximitycheck");
	end
end

function MoveGroup(trial_group, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h)
   if ( trial_group ~= nil) then
      local trial_count = trial_group:GroupCount();

      for i = 0, trial_count - 1, 1 do
         local client_v = trial_group:GetMember(i):CastToClient();

         if (client_v.valid) then
            -- check the distance and port them up if close enough
            if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
               -- port the player up
               client_v:MovePC(201, tgt_x, tgt_y, tgt_z, tgt_h);
            end
         end
      end
   end
end

function HandleCorpses(src_x, src_y, src_z, dist)

   -- Move Player Corpses from the Trial Area to the Grave Yard
   local clist = eq.get_entity_list():GetCorpseList();
   if ( clist ~= nil ) then
      for corpse in clist.entries do
         if ( corpse:IsPlayerCorpse() ) then
             if (corpse:CalculateDistance(src_x, src_y, src_z) < dist) then
               corpse:GMMove(58, -47, 2);      
             end
         elseif ( corpse:IsNPCCorpse() ) then
            if (corpse:CalculateDistance(src_x, src_y, src_z) < dist) then
               corpse:Delete();
            end
          end
      end
   end
end

function ProximityCheck(chk_x, chk_y, chk_z, dist)

   local players_in_prox = false;
   local clist = eq.get_entity_list():GetClientList();

   if ( clist ~= nil ) then
      for client in clist.entries do
         if (client:CalculateDistance(chk_x, chk_y, chk_z) < dist) then
            players_in_prox = true;
         end
      end
   end

   return players_in_prox;
end

function despawn_trial_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
