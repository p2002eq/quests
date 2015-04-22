function event_spawn(e)
	eq.set_timer("wave",75000);
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_timer(e)
	e.self:DoAnim(29);
end
