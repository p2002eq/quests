--#Essence_of_Fire (217455)
--Fennin Ro, The Tyrant of Fire Encounter
--Plane of Fire

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000) -- 10 min depop
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if e.message:findi("hail") and not e.other:HasItem(29147) and counter < 72 then
		e.self:Say("wat")
		if qglobals.pop_fire_fennin_projection == nil then
			eq.set_global("pop_fire_fennin_projection", "1", 5, "F");
			e.other:Message(15,"You've received a character flag!");
		end
		e.other:Message(7,"Flames begin to surround your body.  You feel them moving around you, but your body does not burn.  Suddenly the flames begin to coalesce in your hands.");
		e.other:SummonItem(29147); 	--Globe of Dancing Flame
		counter = counter + 1;
	end
	e.other:Message(15,string.format("item [%s]  counter [%s]",tostring(e.other:HasItem(29147)),counter));
end