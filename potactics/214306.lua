--A_Planar_Projection (214305)
--Rallos Zek the Warlord Event
--Plane of Tactics

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000) -- 10 min depop
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if e.message:findi("hail") and  qglobals.pop_tactics_ralloz == nil and counter < 72 then
		if tonumber(qglobals.pop_poi_behometh_flag) == 1 and tonumber(qglobals.pop_tactics_vallon) == 1 and tonumber(qglobals.pop_tactics_tallon) == 1 then
			e.other:Message(7,"Maelin Starpyre's thoughts enter into your own. 'The singed parchment of Rallos lies in his dead hand. Bring it back to me I will translate them using the Cipher of Druzzil.'");
			e.other:Message(15,"You've received a character flag!");
		else
			e.other:Message(7,"The Planar Projection seems to flicker in and out of existence.  It seems to be impressed by the defeat of Rallos Zek.");
			e.other:Message(4,"You've received a character flag!");
		end
		eq.set_global("pop_tactics_ralloz", "1", 5, "F");
		counter = counter + 1;
	end
end

