-- Lord Inquisitor Seru in Sanctus Seru

function event_combat(e)
	if e.joined then
		eq.set_timer("room", 1000);
	else
		eq.stop_timer("room");
	end
end

function event_timer(e)
	if e.timer == "room" and (e.self:GetX() < -354 or e.self:GetX() > -110 or e.self:GetY() < -554 or e.self:GetY() > -310) then
		e.self:Shout("No! I will not leave the time chamber!");
		e.self:GMMove(-232, -431, 224,0.0, true)
	end
end

function event_death_complete(e)
	eq.stop_timer("room");
end
