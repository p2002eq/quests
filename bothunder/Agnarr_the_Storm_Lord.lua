--Agnarr_the_Storm_Lord (209026)
--zone: bothunder

local bosses = {209152,209137,209143,209141}

function event_spawn(e)
	eq.set_next_hp_event(99); --spawn first giant at 98%
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
		eq.set_timer("storms", 30 * 1000);
	else
		eq.set_timer("reset", 20 * 60 * 1000);
	end
end

function event_hp(e)
	if (e.hp_event == 99) then
		boss = eq.spawn2(bosses[1],0,0,-1074,-1738,2250,128); --first giant Jolur_Sandstorm (209152)
		boss:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(),e.self:GetHeading(),true);
		eq.set_next_hp_event(76); --spawn next giant at 75		
	elseif (e.hp_event == 76) then
		boss = eq.spawn2(bosses[2],0,0,-1074,-1738,2250,128); --second giant Ekil_Thundercall (209137)
		boss:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(),e.self:GetHeading(),true);
		eq.set_next_hp_event(51); --spawn next giant at 50
	elseif (e.hp_event == 51) then
		boss = eq.spawn2(bosses[3],0,0,-1074,-1738,2250,128); --third giant	Oljin_Stormtide (209143)
		boss:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(),e.self:GetHeading(),true);
		eq.set_next_hp_event(26); --spawn next giant at 25
	elseif (e.hp_event == 26) then
		boss = 	eq.spawn2(bosses[4],0,0,-1074,-1738,2250,128); --fourth giant Hibdin_Cyclone (209141)
		boss:CastToNPC():MoveTo(e.self:GetX() + math.random(-20,20), e.self:GetY() + math.random(-20,20), e.self:GetZ(),e.self:GetHeading(),true);
	end
end

function event_timer(e)
	if e.timer == "reset" then 
		eq.stop_timer(e.timer);
		eq.set_next_hp_event(99);	--reset hp events
		--depop trash if up
		local mob_list = {209129,209130,209158,209159}
		for k,v in pairs(mob_list) do
			eq.depop_all(v);	--depop adds
		end
		--depop bosses if up
		for k,v in pairs(bosses) do
			eq.depop_all(v);	--depop adds
		end
		
	elseif e.timer == "storms" then
		if e.self:IsEngaged() then
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,500,"Agnarr strikes his staff to the ground, causing great ripples of energy to rage across the room.");
			eq.signal(209034,1); --A_storm_portal (209034) -signal adds to spawn
			eq.stop_timer(e.timer);
			eq.set_timer("storms",2*60*1000);
		else
			eq.stop_timer(e.timer);
		end
	end
end

function event_death_complete(e)
	eq.spawn2(209151,110,0,-767,-1735,2251,130);	--#Askr_the_Lost (209151)
	eq.spawn2(209142,0,0,-469,-1754,2351.2,395.2); --#Karana (209142)
end
