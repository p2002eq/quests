--#Manaetic_Behemoth (206205)  Targetable Version
--PoInnovation

local aggro = false;

function event_spawn(e)
	eq.set_timer("depop", 20*60*1000)  --20 min depop
	eq.set_timer("leash", 1);
	aggro = false;
end

function event_death_complete(e)
	e.self:Emote("'s corpse grinds to a halt, corrosive liquids leaking from its wrecked body.");
	eq.signal(206038,1);  --signal gnome that event was a success - starts flagging timer
end

function event_combat(e)
	if e.joined then
		aggro = true;
	end
end

function event_timer(e)
	if e.timer == "leash" then
		if e.self:GetX() < 1010 or e.self:GetX() > 1240 then
			e.self:GotoBind();
			eq.signal(206038,2,1);	--signal gnome to shout
		end
	elseif e.timer == "depop" then
		if not aggro then
			eq.update_spawn_timer(345273,5*1000); --repop untargetable version in 5 seconds since could have been accidental activation
		else
			eq.update_spawn_timer(345273, 86400);	--24 hr respawn on failed attempt
		end
		eq.depop();
	end
end
		
	
