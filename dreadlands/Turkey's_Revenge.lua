function event_combat(e)
  e.self:Shout("Gobble! Gobble! Gobble!");
end


function event_slay(e)
  e.self:Shout("Better luck next time " .. e.other:GetName() .. "!");
end


function event_feign_death(e)
  e.self:Shout("Playing dead aint gona work " .. e.other:GetName() .. "Better luck next time! LOL");
end


function event_death(e)
  e.self:Emote("The turkey dies exploding into a thousand gibblets");
  e.self:SpellFinished(2167, e.other);
  make_gibblit(e)
  make_gibblit(e)
  make_gibblit(e)
  make_gibblit(e)
  make_gibblit(e)
end

-- 86271
function make_gibblit(e)
  eq.spawn2(86271,0,0,e.self:GetX() + math.random(10,25),e.self:GetY() + math.random(10,25),e.self:GetZ(),e.self:GetHeading());
end
