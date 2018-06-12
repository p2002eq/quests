--Tylis_Newleaf (207014)
--Plane of Torment (Saryrn's Tower)

function event_signal(e)
	--Signal from KoS on death event
	activate(e.self);
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);

	if e.message:findi("Hail") then
		e.self:Emote("doesn't move, but struggles to whisper, '... help... end this torment... will you come?  I can show you the pain... it moves in the shadows of my mind... will you [" .. eq.say_link("assist") .. "] me?");
	elseif e.message:findi("assist") and tonumber(qglobals.pop_pot_shadyglade) == nil then
		e.self:Say("I sense the desire in you to help, but I don't know if you possess the kind of power needed to release me from my anguish.  Please seek out my companion Fahlia and see if she can offer you a way to better yourself before undertaking this task.");
	elseif tonumber(qglobals.pop_pot_shadyglade) == 1 then
		if e.message:findi("assist") then
			e.self:Say("Please tell me when you are ready.  I do not know if I have enough energy to channel all of you, but I can try.  When you are [" .. eq.say_link("ready") .. "], I will channel you into my pain.");
		elseif e.message:findi("ready") then
			--port up players within range
			local client_list = eq.get_entity_list():GetClientList();
			if client_list ~= nil then
				for client in client_list.entries do
					if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
						client:MovePCInstance(207,eq.get_zone_instance_id(),-175,804,-956,0);
					end
				end
			end
		end
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer(e.timer);
		deactivate(e.self);
	end
end

function deactivate(mob)
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
end

function activate(mob)
	mob:SetBodyType(1, true);		--humanoid
	mob:SetSpecialAbility(24, 0);	
	eq.set_timer("reset", 60 * 60 * 1000);	--1hr reset
end
