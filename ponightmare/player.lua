--player.lua for
--Plane of Nightmare
function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    --e.self:Message(1,string.format("[DEBUG], InstanceID = %i, Instance Version = %i",instance_id,instance_version));

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered a Instanced Version of the zone.");
    end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

--set zoneflag for entrance to PoNB
function event_click_door(e)
	local door = e.door:GetDoorID();
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs

	if door == 59 then
		if qglobals.pop_pon_construct ~= nil and qglobals.pop_pon_hedge_jezith ~= nil  then
			if not e.self:HasZoneFlag(221) then
				e.self:SetZoneFlag(221);
			end
		else
			e.self:Message(13,"You lack the will to pass through this portal safely.");
		end
	end
end

---DEBUG----
--zone flagging
function event_say(e)
	------------------------------------
	--POP ALPHA TESTING MODULE
	local pop_flags = require("pop_flags");
	pop_flags.options(e)
	-----------------------------------	
	
	--Hedge Maze Testing
	if e.self:GetGM() then
		if e.message:findi("help") then
			e.self:Message(300,"Hedge options available are: [" .. eq.say_link("maze reset 1",false,"Reset Maze 1") .. "], [" .. eq.say_link("maze reset 2",false,"Reset Maze 2") .. "], [" .. eq.say_link("maze reset 3", false, "Reset Maze 3") .. "]");
			e.self:Message(300,"CAUTION:  This will boot any players currently in the selected maze back to zone in.");
		elseif e.message:findi("maze reset 1") then
			eq.signal (204070, 1);
			e.self:Message(13,"Maze 1 reset!");
		elseif e.message:findi("maze reset 2") then
			eq.signal (204070, 2);
			e.self:Message(13,"Maze 2 reset!");
		elseif e.message:findi("maze reset 3") then
			eq.signal (204070, 3);
			e.self:Message(13,"Maze 3 reset!");
		end
	end
end









