--A_Planar_Projection
--Rallos_Zek
--potactics

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000);	--10 min depop
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_tactics_ralloz == nil and counter < 72 then
		e.other:Message(7,"Maelin Starpyre's thoughts enter into your own. 'The singed parchment of Rallos lies in his dead hand. Bring it back to me I will translate them using the Cipher of Druzzil.'");  --missing text
		e.other:Message(15,"You receive a character flag!");
		eq.set_global("pop_tactics_ralloz", "1", 5, "F");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
