--player.lua for Plane of Justice


function event_click_door(e)
	local door = e.door:GetDoorID();
	--e.self:Message(14,"Door ID is: [" .. door .. "] Open Type: [" .. e.door:GetOpenType() .. "] Lock Pick: [" .. e.door:GetLockPick() .. "] Key Item: [" .. e.door:GetKeyItem() .. "] Item Held: [" ..  e.self:GetItemIDAt(30) .. "]");   --debug to easily check door IDs
	

	if ( door >= 8 and door <= 13 ) then 	--doors in 7th hammer area that lead back to trial area
		e.self:MovePC(201, 456, 825, 9, 254);
	elseif ( door >= 1 and door <= 6 ) then	--doors can lead either to 7th hammer if holding mark of justice or back to inner PoJustice if not holding mark
		if ( e.self:GetItemIDAt(30) == 31599 ) then -- The Mark of Justice
			local trial_group = e.self:GetGroup();
			if trial_group.valid then
				MoveGroup(e.self:GetGroup(), e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 65, 1308, 7, 255);
			else
				e.self:MovePC(201, 65, 1308, 7, 255)
			end
		else
 			e.self:MovePC(201, 156, 470, -48, 384); -- needs_heading_validation
		end
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

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_enter_zone(e)
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end

-----------------------------------
--POP ALPHA TESTING MODULE
function event_say(e)
	local pop_flags = require("pop_flags");
	pop_flags.options(e)
end

-----------------------------------

