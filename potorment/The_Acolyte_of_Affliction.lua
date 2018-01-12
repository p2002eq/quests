--The_Acolyte_of_Affliction (207003)
--Plane of Torment (Saryrn's Tower)

function event_spawn(e)
	eq.depop_all(207292);	--A_construct_seedling (207292)
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
		eq.set_timer("adds", 15 * 1000);
	else
		eq.stop_timer("adds");
		eq.set_timer("reset", 20 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "adds" and e.self:IsEngaged() then
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 7, 300, "The bizarre pool begins to splash and churn with activity!");
		eq.stop_timer(e.timer);
		eq.set_timer("adds",30 * 1000);
		rand = math.random(4,7);
		for n = 1,rand do
			construct = eq.spawn2(207292,0,0, math.random(-25,25), -164,197,0);	--A_construct_seedling (207292)
			construct:CastToNPC():MoveTo(e.self:GetX() + math.random(-20,20), e.self:GetY() + math.random(-20,20), e.self:GetZ(),e.self:GetHeading(),false);
		end
	elseif e.timer == "reset" then 
		eq.stop_timer(e.timer);
		if not e.self:IsEngaged() then
			eq.depop_all(207292);	--A_construct_seedling (207292)
		else
			eq.set_timer("reset", 15 * 1000);  --check again for not being in combat
		end
	end
end

