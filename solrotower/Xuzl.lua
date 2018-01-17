--Xuzl (212055)
--solrotower

function event_combat(e)
	if e.joined then
		eq.set_timer("adds", 45 * 1000);
		eq.stop_timer("reset");
	else
		eq.stop_timer("adds");
		eq.set_timer("reset", 30 * 1000);
	end
end

function event_timer(e)
	if e.timer == "adds" then
		eq.stop_timer(e.timer);
		eq.set_timer("adds", 30 * 1000);	--intial timer slower - set to 30 sec after first wave
		for n = 1,8 do 
			sword = eq.spawn2(212071,0,0,e.self:GetX() + math.random(-5,5), e.self:GetY() + math.random(-5,5), e.self:GetZ(),0);	--Xuzl`s pet (212071)
			sword:AddToHateList(e.self:GetHateRandom(),1);
		end
	elseif e.timer == "reset" then
		eq.depop_all(212071);	--Xuzl`s pet (212071)
	end
end

function event_death_complete(e)
	eq.depop_all(212071);	--Xuzl`s pet (212071)
	eq.spawn2(212069,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ() - 15, e.self:GetHeading());	--A_Planar_Projection
end