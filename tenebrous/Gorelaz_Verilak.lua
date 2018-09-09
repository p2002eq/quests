function event_death_complete(e)
  local random_result = math.random(100);
  if(random_result <= 25) then
    eq.unique_spawn(172183,0,0,-1425,576,317,64); -- Heratius Grolden
  end
end