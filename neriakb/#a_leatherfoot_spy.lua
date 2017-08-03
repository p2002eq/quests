--Part of Innoruuk Disciple
function event_spawn(e)
	e.self:Say("I have been discovered!!! You will never stop us from reclaiming the Nektulos for Karana, " .. e.other:GetName() .. "!!");
	eq.set_timer("depop", 3600000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end