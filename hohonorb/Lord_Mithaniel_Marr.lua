--Lord_Mithaniel_Marr (220020)
--Activated on death of Ralthazor,_Champion_of_Marr (220012)
--hohonorb


function event_death_complete(e)
	eq.spawn2(205157,0,0,2382,0,445,384);	--A_Planar_Projection
end


function event_spawn(e)
  -- incase zone crashes this should make mm targetable
  eq.set_timer("frog_check", 300);
end

--function event_signal(e)
	--if e.signal == 1 then
		--activate(e.self);
     --eq.set_timer("deactivate", 2 * 60 * 60 * 1000);	--2 hrs to deactivate if not killed
  end
--end

function event_timer(e)
  if e.timer == 'frog_check' then
    list = eq.get_entity_list();
    if (list:GetNPCByID(220012) == nil) then
      activate(e.self)
			eq.stop_timer(e.timer)
    end
  end
end
			
function deactivate(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
	mob:GotoBind();
end

function activate(mob)
	mob:SetBodyType(1, true);		--humanoid
	mob:SetSpecialAbility(24, 0);
end
