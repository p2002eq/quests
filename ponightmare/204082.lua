--Servent of Mujaki (Knight Rider Version)
--Mujaki_the_Devourer Event
--ponightmare

function event_spawn(e)
	deactivate(e.self);
end

function event_signal(e)
	if e.signal == 1 then
		if e.self:GetX() > 100 and e.self:GetX() < 1200 and e.self:GetY() > -3050 and e.self:GetY() < -2000 then	--instance #1 boundaries
			activate(e.self);
		end
	end
end

function deactivate(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
end

function activate(mob)
	mob:SetBodyType(3, true);	--undead
	mob:SetSpecialAbility(24, 0);
end
