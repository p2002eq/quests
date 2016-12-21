local started;

function event_spawn(e)
    started = false;
    eq.set_timer("yell", 60000); -- 60 seconds
end

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("The bloody Kromrif ambushed me! I escaped, but I am near death. They'll be tracking me down to finish me off at any moment. Without [help], I'm as good as dead.");

    elseif e.message:findi("help") and not started then
        started = true;
        e.self:Say("Thank Brell! I hear them approaching from just over that hill! Slay the leader, Ghrek, and give me his elixir.");
		eq.stop_timer("yell");

		eq.spawn2(116604, 0, 0, -2991, -4837, 229, 65):AddToHateList(e.self, 1);
		eq.spawn2(116532, 0, 0, -2991, -4815, 229, 65):AddToHateList(e.self, 1);
		eq.spawn2(116532, 0, 0, -2991, -4793, 229, 65):AddToHateList(e.self, 1);
		eq.spawn2(116532, 0, 0, -2991, -4859, 229, 65):AddToHateList(e.self, 1);
		eq.spawn2(116532, 0, 0, -2991, -4881, 229, 65):AddToHateList(e.self, 1);

    end
end

function event_trade(e)

	local item_lib = require('items');

	if item_lib.check_turn_in(e.self, e.trade, {item1 = 30139}) then
		e.self:Say("The bloody Kromrif ambushed me! I escaped, but I am near death. They'll be tracking me down to finish me off at any moment. Without [help], I'm as good as dead.");
	
	elseif item_lib.check_turn_in(e.self, e.trade, {item1 =  30138}) then
		e.self:SetAppearance(0);
		e.self:Say("I will report your selfless actions when I return to Thurgadin. Take this for your troubles, friend. I hope you find it useful. Fare thee well.");
		e.other:Faction(49, 25); -- Coldain
		e.other:Faction(67, 6); -- Dain
		e.other:Faction(188, -12); -- Kromrif
		e.other:Faction(189, -2); -- Kromzek
		e.other:QuestReward(e.self, 0,0,0,0, 30140, 80000);
		eq.depop_with_timer();
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_timer(e)
	if e.timer == "yell" then
		e.self:SetAppearance(3);
		e.self:Say("Ohhhh, someone... help, please...");
	end
end

function event_signal(e)
	if e.signal == 99 then
		started = false;
	end
end
