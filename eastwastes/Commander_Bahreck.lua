function event_spawn(e)
	local myX = e.self:GetX();
	local myY = e.self:GetY();
	local myZ = e.self:GetZ();
	local myH = e.self:GetHeading();

	e.self:Shout("For the honor of Rallos Zek! Attack!");
	eq.spawn2(116553, 0, 0, myX + 150, myY + 15, myZ, myH);
	eq.spawn2(116553, 0, 0, myX + 100, myY + 75, myZ, myH);
	eq.spawn2(116553, 0, 0, myX + 150, myY - 15, myZ, myH);
	eq.spawn2(116553, 0, 0, myX + 100, myY - 75, myZ, myH);
	eq.spawn2(116553, 0, 0, myX - 10, myY , myZ, myH);
end

function event_death_complete(e)
	eq.signal(116119, 0); --Corbin Blackwell
end
