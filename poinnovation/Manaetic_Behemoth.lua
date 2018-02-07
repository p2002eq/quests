--Manaetic_Behemoth (NPCID 26046)  Untargetable Version
--PoInnovation

local counter;
local first_signal;
local activated;

function event_spawn(e)
	counter = 0;
	first_signal = false;
	eq.signal(206206,1); 	--AOE_Trigger (206206)
end

function event_signal(e)
	if e.signal == 1 and not first_signal then
		counter = 0;
		first_signal = true;
		eq.set_timer("activate_timer", 1 * 1000)  --increment every 1 seconds
	elseif e.signal == 1 and first_signal then
		first_signal = false;
	end
end

function event_timer(e)
	if e.timer == "activate_timer" then
		counter = counter + 1;  --increment up to 180 seconds (3 minutes to activate)
		if counter == 180 then 
			eq.unique_spawn(206205,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading())
			eq.depop_with_timer();
		end
	end
end
			

