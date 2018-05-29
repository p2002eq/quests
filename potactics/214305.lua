--A_Planar_Projection (214305)
--Tallon Zek
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
	if e.message:findi("hail") and  qglobals.pop_tactics_tallon == nil and counter < 72 then
		if tonumber(qglobals.pop_poi_behometh_flag) == 1 then
			e.other:Message(7,"You realize that the image is a projection of Maelin Starpyre's thoughts.  His thoughts enter into your own.  'The pack of notes you now possess from Tallon, bring them to me.  I would like to more closely study them'");
			e.other:Message(15,"You receive a character flag!");
		else
			e.other:Message(7,"The Planar Projection seems to flicker in and out of existence.  It seems to be impressed by the defeat of Tallon Zek.");
			e.other:Message(4,"You receive a character flag!");
		end
		eq.set_global("pop_tactics_tallon", "1", 5, "F");
		counter = counter + 1;
	end
end

