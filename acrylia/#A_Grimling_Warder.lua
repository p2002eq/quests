-- #A_Grimling_Warder (154377) in Acrylia - event guardian for several events

function event_spawn(e)
	eq.set_proximity(e.self:GetX()-25,e.self:GetX()+25,e.self:GetY()-25,e.self:GetY()+25);
end

function event_enter(e)
	e.self:Say("A fine sacrifice you make! Say hello to the master!");
	e.other:SpellFinished(2857, e.other);
end

function event_signal(e)
	if (e.signal == 1) then
		e.self:Shout("Master! The sacred ring of fire has been cleansed of trespassers.");
		eq.depop();
	elseif (e.signal == 2) then
		eq.depop();
	end
end
