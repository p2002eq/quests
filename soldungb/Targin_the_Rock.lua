function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("You have much to learn.' and 'Your actions and history are a personal affront to all I stand for.");
	end
end

function event_combat(e)
	e.self:Say("You have much to learn.' and 'Your actions and history are a personal affront to all I stand for.");
end