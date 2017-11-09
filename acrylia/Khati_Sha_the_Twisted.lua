-- Khati Sha Event
-- Created by Gonner
-- Converted to .lua by Speedz

local activated = false;

function event_spawn(e)
	activated = false;
	deactivate(e.self);
	SpawnMinions();
end

function event_timer(e)
	if e.timer == "deactivate" then
		deactivate(e.self);
	elseif e.timer == "leash" then		
		if not e.self:IsEngaged() then 
			eq.stop_timer(e.timer)
		end;			
		if e.self:GetY() >= -435 then
			leash_counter = leash_counter + 1;
			
			e.self:Shout("You will not remove me from my chambers!")
			if leash_counter == 5 then		--5 leashes till Khati and his guards will reset
				e.self:WipeHateList();
				SpawnMinions();
			end
			e.self:GotoBind();
		end
	elseif e.timer == "guard_repop" then
		if not e.self:IsEngaged() then	--guards should not repop when engaged with Khati if already popped
			SpawnMinions();
			eq.stop_timer(e.timer);
		end
	end
end

function event_signal(e)
	if e.signal == 30 then
		e.self:Shout("Active!");		--debug
		activate(e.self);
		eq.set_timer("deactivate", 120 * 60 * 1000); -- 2hrs till deactivation
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
		eq.signal(154054,1,2*1000);  --signals Guards to activate and attack
		--e.self:Say("You will perish!") --debug - fix this crap with actual text
		eq.set_timer("leash", 1);		
		leash_counter = 0;
	else
		eq.set_timer("guard_repop", 15 * 1000);
	end
end

function SpawnMinions()
	eq.depop_all(154054);
	local guard_locs = { [1] = {972,-556,-41,165}, [2] = {970,-602,-41,221}, [3] = {910,-602,-41,35}, [4] = {905,-556,-41,91} };
	
	for n = 1,4 do
		eq.spawn2(154054,0,0,unpack(guard_locs[n])); -- Defiled Minion
	end
end



