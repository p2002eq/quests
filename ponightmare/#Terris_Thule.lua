--#Terris_Thule (204065)
--Projection as part of Hedge Event

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000)  --10 min depop
end

function event_signal(e)
	--Maze #1 signals
	if e.signal == 10 then
		e.self:Say("You fool!  You did not earn this prize on your own!  The contract that has been drawn is now invalid.  You will never leave my grasp, prepare your soul for eternal torment!");
		eq.signal(204055,10,5*1000);
	elseif e.signal == 11 then
		eq.signal(204055,11,3*1000);
		Finale(e);
	--Maze #2 signals
	elseif e.signal == 20 then
		e.self:Say("You fool!  You did not earn this prize on your own!  The contract that has been drawn is now invalid.  You will never leave my grasp, prepare your soul for eternal torment!");
		eq.signal(204056,10,5*1000);
	elseif e.signal == 21 then
		eq.signal(204056,11,2 * 1000);
		Finale(e);
	--Maze #3 signals
	elseif e.signal == 30 then
		e.self:Say("You fool!  You did not earn this prize on your own!  The contract that has been drawn is now invalid.  You will never leave my grasp, prepare your soul for eternal torment!");
		eq.signal(204057,10,5*1000);
	elseif e.signal == 31 then
		eq.signal(204057,11,2 * 1000);
		Finale(e);
	end
end

function Finale(e)
	e.self:SendSpellEffect(95, 3000,0,false,0);	--simulate Gate being cast
	eq.set_timer("depop", 3 * 1000);
end

function event_timer(e)
	if e.timer == "depop" then
		e.self:Emote("laughs heartily and then vanishes in a swirl of incorporeal mist.");
		eq.depop();
	end
end

