--#Essence_of_Earth (222148)
--Rathe Council/Avatar of Earth Encounter
--Plane of Earth B

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000) -- 10 min depop
	e.self:Say("sup bitches")
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if e.message:findi("hail") and not e.other:HasItem(29146) and counter < 72 then
		if qglobals.pop_earthb_rathe == nil then
			eq.set_global("pop_earthb_rathe", "1", 5, "F");
			e.other:Message(15,"You've received a character flag!");
		end
		e.other:Message(7,"The ground begins to shake and crack at your feet.  The quakes are powerful but you are not haltered by them.  Suddenly a formation of earth begins to coalesce in your hand.");
		e.other:SummonItem(29146); 	--Mound of Living Stone
		counter = counter + 1;
	end
end