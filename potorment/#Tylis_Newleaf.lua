--#Tylis_Newleaf (207312)
--Plane of Torment (Saryrn's Tower)

local counter;

function event_spawn(e)
	eq.set_timer("depop", 30 * 60 * 1000) -- 30 min depop
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop_with_timer(207014);	----Tylis_Newleaf (207014)
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") then
		e.self:Say("I must thank you for your kind efforts, friends.  This place has claimed me for far too long.  I'll be leaving this terrible plane soon... and I suggest you do likewise.  Please tell me when you're [" .. eq.say_link("I'm ready to return",false,"ready to return") .. "] and if you get the chance, give the dark wench a taste of your blades!'");
		if qglobals.pop_pot_newleaf == nil and qglobals.pop_pot_shadyglade ~= nil and counter < 72 then
			eq.set_global("pop_pot_newleaf","1",5,"F");
			e.other:Message(4,"You've received a character flag!");
			counter = counter + 1;
		end
	elseif e.message:findi("ready to return") then
		--port up players within range
		local client_list = eq.get_entity_list():GetClientList();
		if client_list ~= nil then
			for client in client_list.entries do
				if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
					client:MovePCInstance(207,eq.get_zone_instance_id(),-31,-37,450,0);
				end
			end
		end
	end
end
