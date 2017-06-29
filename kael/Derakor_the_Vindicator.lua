--Derakor the Vindicator Script to call guards to his position on aggro

function event_combat(e)
	if (e.joined) then
		e.self:Shout("Your kind will not defile the temple of Rallos Zek!");
		eq.signal(113120,1); --signals for temple guardians to assist
	end
end
