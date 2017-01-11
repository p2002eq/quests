-- Lord Inquisitor Seru in Sanctus Seru

function event_combat(e)
	if e.joined then
		eq.set_timer("room", 1000);
	else
		eq.stop_timer("room", 1000);
	end
end

function event_timer(e)
	if e.timer == "room" and (e.self:GetX() < -353 or e.self:GetX() > -109 or e.self:GetY() < -549 or e.self:GetY() > -310) then
		e.self:Shout("No! I will not leave the time chamber!");
		e.self:GMMove(e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading(), true)
		end
end

function event_death_complete(e)
	eq.stop_timer("room", 1000);
end