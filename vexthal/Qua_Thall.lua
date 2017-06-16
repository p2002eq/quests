-- depop script for a trap mob in VT

function event_timer(e)
    if e.timer == 'depop' then
        eq.stop_timer(e.timer);
        eq.depop();
    end
end

function event_death(e)
   local ran = math.random(1, 5);
   local mob;
   local x, y, z , h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
   if ran == 1 then
      --qua 
      mob = 158024;
   elseif ran == 2 then
      --zov
      mob = 158026;
   elseif ran == 3 then
      --zun
      mob = 158023;
   elseif ran == 4 then
      --pli
      mob = 158005;
   elseif ran == 5 then
      -- eom
      mob = 158027;
   end

   local spawned = eq.spawn2(mob, 0, 0, x, y, z, h);
   eq.set_timer('depop', 30 * 60 * 1000, spawned);
    

end



