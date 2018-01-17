--A_Planar_Projection (212070)
--Spawns on death of Solusek Ro
--solrotower

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000); --10 min
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and counter < 72 and qglobals.pop_sol_ro_solusk == nil then
		if (qglobals.pop_poi_behometh_preflag ~= nil and qglobals.pop_poi_behometh_flag ~= nil and qglobals.pop_tactics_tallon ~= nil and qglobals.pop_tactics_vallon ~= nil and qglobals.pop_tactics_ralloz ~= nil and qglobals.pop_sol_ro_arlyxir ~= nil and qglobals.pop_sol_ro_jiva ~= nil and qglobals.pop_sol_ro_rizlona ~= nil and  qglobals.pop_sol_ro_dresolik ~= nil and qglobals.pop_sol_ro_xuzl ~= nil and qglobals.pop_pot_saryrn_final ~= nil and qglobals.pop_pot_saryrn ~= nil and qglobals.pop_hohb_marr ~= nil) then
			e.other:Message(7,"You recognize the voice of Miak the Searedsoul in your mind, 'Well done mortal. The true path to the Plane of Fire lies just below your feet.  Enter the portal when you are ready and I will channel you through safely to the correct destination.'");	--not confirmed
			e.other:Message(15,"You've received a character flag!");
		else
			e.other:Message(7,"The Planar Projection flickers in and out of existence.  It seems to be impressed by the defeat of Solusek Ro.");
			e.other:Message(4,"You've received a character flag!");
		end
		eq.set_global("pop_sol_ro_solusk", "1", 5, "F");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

