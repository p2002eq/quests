function event_spawn(e)
	eq.set_timer("depop",1200000);
end

function event_timer(e)
	eq.depop();
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end