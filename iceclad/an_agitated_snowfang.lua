-- The Grammar Manual
function event_spawn(e)
	eq.set_timer("depop", 300000); -- set timer for 5 minute
end

function event_timer(e)
	eq.depop();
	eq.stop_timer("depop");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("shivers and growls to itself.");
		e.self:Say("Much thanks must I give. Furless one still wants magic thing, after all the troubles? Say quickly. Much pain from attack. Must go, shaman help.");
	elseif(e.message:findi("magic thing")) then
		e.other:QuestReward(e.self,0,0,0,0,30042); -- Chapter P
		eq.depop();
	    eq.stop_timer("depop");
	end
end