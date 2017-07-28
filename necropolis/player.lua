--LUA for Spirit of Garzicor event

local ThreadManager = require("thread_manager");

local myX = nil;
local myY = nil;
local myZ = nil;	


function event_say(e)
	local qglobals = eq.get_qglobals(e.self);

	if(e.message:findi("Remember, Garzicor")) then	-- trigger phrase
		if ((qglobals["garzicor_spirit"] == nil) and (qglobals["garzicor"] == "4")) then
			myX = e.self:GetX();
			myY = e.self:GetY();
			myZ = e.self:GetZ();
			if(between(myX, 1070, 1095) and between(myY, 1500, 1535)) then -- check for proximity (z axis not relevant)
				ThreadManager:Create("Seance", Seance, e);
				eq.set_timer("TMHB", 1000);
				eq.set_global("garzicor_spirit","1",3,"H1");
				
			end
		end
	elseif(e.message:findi("You are one but two") and e.message:findi("Your vengeance shall find a home")) then	-- trigger phrase
		if (qglobals["garzicor_battle"] == nil and qglobals["garzicor"] == "7") then
			myX = e.self:GetX();
			myY = e.self:GetY();
			if(between(myX, 1070, 1095) and between(myY, 1500, 1535)) then -- check for proximity (z axis not relevant)
				eq.unique_spawn(123256,0,0,1095,1511,-135,195);		--spawns a ghostly presence
				eq.set_global("garzicor_battle","1",3,"H1");
				
			end
		end
	end
	
	--GM Testing commands/reset controls.  Sometimes requires qglobal commands to be entered twice to take effect
	if(e.message:findi("event reset") and e.self:GetGM() == true) then		
		eq.delete_global("garzicor_spirit");
		eq.delete_global("garzicor_battle");
		e.self:Message(5,"Event qglobals have been reset.");
	elseif(e.message:findi("event test seance") and e.self:GetGM() == true) then	-- command to trigger temporary qglobal flags
		eq.set_global("garzicor","4",5,"M30");	
		e.self:Message(14,"Seance event ready.  say [" .. eq.say_link("Remember, Garzicor") .. "] to begin");
	elseif(e.message:findi("event test battle") and e.self:GetGM() == true) then	-- command to trigger temporary qglobal flags
		eq.set_global("garzicor","7",5,"M30");
		e.self:Message(15,"Battle event ready.  say [" .. eq.say_link("You are one but two.  Your vengeance shall find a home") .. "]");
	end
end

function event_timer(e)
	if (e.timer == "TMHB") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("Seance");
	end
end

function Seance(e)
	ThreadManager:Wait(5);
	event_emote(e,"Help");
	ThreadManager:Wait(5);
	event_emote(e,"Must go home");
	ThreadManager:Wait(5);
	event_emote(e,"Need vengeance");
	ThreadManager:Wait(5);
	event_emote(e,"Veeshan awaits");
	ThreadManager:Wait(5);
	event_emote(e,"Kromzek must be made to pay");
	ThreadManager:Wait(5);
	event_emote(e,"So tired");
	ThreadManager:Wait(5);	
	event_emote(e,"Time to go");
	ThreadManager:Wait(5);		
	event_emote(e,"Blood must be shed");
	ThreadManager:Wait(5);
	event_emote(e,"Home!");
	ThreadManager:Wait(5);
	event_emote(e,"Vengeance!");
	ThreadManager:Wait(5);
	event_emote(e,"Home!");
	ThreadManager:Wait(5);
	event_emote(e,"Vengeance!");
	ThreadManager:Wait(5);
	event_emote(e,"I am one but two");
	ThreadManager:Wait(5);
	event_emote(e,"I am sorry");
	eq.create_ground_object(1888, 1068.24, 1516.23, -136.19, 177, 60*1000);	-- Dragonwing Skin
	eq.create_ground_object(1889, 1068.24, 1513.18, -136.19, 177, 60*1000);	--  Dragonbone Dust
	eq.stop_timer("TMHB");
end

function event_emote(e,message)
    local player_list = eq.get_entity_list():GetClientList();
    if(player_list ~= nil) then
        for player in player_list.entries do
            if(player:CalculateDistance(myX, myY, myZ) <= 100) then
                player:Message(6,message)
            end
        end
    end
end

function between(loc, limit_low, limit_high) -- helper function to check that values are between targets
	if(loc <= limit_high and loc >= limit_low) then
		return true
	else
		return false
	end
end