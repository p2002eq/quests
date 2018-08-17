--#A_Rathe_Councilman (222141)  (MEZZABLE VERSION)
--signals #rathe_controller (222156) to load encounter
--poearthb

local signal;

function event_spawn(e)
	signal = false;
end

function event_combat(e)
	if e.joined then
		eq.signal(222156,1);	--#rathe_controller (222156)
		eq.set_timer("banish",math.random(1,12) * 1000);
		if not signal then 
			eq.signal(222140,e.self:GetID());
			eq.signal(222141,e.self:GetID());
		end
	else
		signal = false;
		e.self:CastToNPC():MoveTo(e.self:GetSpawnPointX(),e.self:GetSpawnPointY(),e.self:GetSpawnPointZ(),e.self:GetSpawnPointH(),true);	--mobs will instantly path back to spawn if no one on hate list
	end
end

function event_signal(e) 	--call out for assist from nearby council members
	mob = eq.get_entity_list():GetMobID(e.signal);
	if mob ~= nil and e.signal ~= e.self:GetID() and e.self:CalculateDistance(mob:GetX(), mob:GetY(), mob:GetZ()) <= 150 then
		signal = true;
		e.self:AddToHateList(mob:GetHateTop());
	end
end
