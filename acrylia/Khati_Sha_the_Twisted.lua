-- Khati Sha Event
-- Created by Gonner
-- Converted to .lua by Speedz

local activated = false;

function event_spawn(e)
	activated = false;
	deactivate(e.self);
	eq.set_next_hp_event(98);
	SpawnMinions();
end

function event_timer(e)
	if e.timer == "deactivate" then
		deactivate(e.self);
		eq.depop_all(154054);	--clears minions so it can repop all 4 incase any partially killed during a failed event encounter
		SpawnMinions();
	elseif e.timer == "leash" then
		if e.self:GetY() >= -435 then
			e.self:GotoBind();
			e.self:Shout("You will not remove me from my chambers!")
		end
	end
end

function event_signal(e)
	if e.signal == 30 then
		e.self:Shout("Active!");
		activate(e.self);
		eq.set_timer("deactivate", 120 * 60 * 1000); -- 2hr depop
	end
end

function event_hp(e)
	if e.hp_event == 98 then
		eq.signal(154054,1);  --signals Guards to activate and attack
	end
end

function deactivate(mob)
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
	mob:GotoBind();
end

function activate(mob)
	mob:SetBodyType(15, true);
	mob:SetSpecialAbility(24, 0);
end

function event_combat(e)
	if e.joined then
		e.self:Say("You will perish!") --debug - fix this crap with actual text
		eq.set_timer("leash", 1);
	end
end

function SpawnMinions()
	eq.spawn2(154054,0,0,972,-556,-41,165); -- Defiled Minion
	eq.spawn2(154054,0,0,970,-602,-41,221); -- Defiled Minion
	eq.spawn2(154054,0,0,910,-602,-41,35); -- Defiled Minion
	eq.spawn2(154054,0,0,905,-556,-41,91); -- Defiled Minion
end



