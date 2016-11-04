function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Who dares disturb my rest? If ye be a friend of the mighty Coldain, then show me proof and I shall tell you of my plight. If not, then be on your way.");
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30268})) then
		e.other:SummonItem(30268);
		if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(116534) == true) then 
		--check if Icefang is up
			eq.get_entity_list():GetMobByNpcTypeID(116534):CastToNPC();
			eq.signal(116534, 1161101); --resets Icefangs path
		else
			eq.spawn2(116534, 0, 0, 3244, -8102, 147, 0); --spawn Icefang
			eq.get_entity_list():GetMobByNpcTypeID(116534):CastToNPC();
			eq.signal(116534, 1161101); --resets Icefangs path
		end	
	
	e.self:Say("Many seasons ago I stood here in life with my comrades, the best warriors Thurgadin had to offer. Along with our faithful wolven army we were poised to eliminate the Kromrif presence in the region. Somehow, the enemy was made aware of our plans and just before our attack, a group of Ry'Gorr oracles charmed our wolves, forcing them to tear down their own masters. We were caught by surprise and died a savage death.");
	end

end

function event_signal(e)
	if (e.signal == 116567) then
		e.self:Say("All that remains from that battle is my loyal Icefang. He will not rest until I am avenged. Follow and watch after him. He alone knows where our attackers lie and he cannot overcome them by himself. May Brell bless you with success, farewell.");
		eq.signal(116534, 1161102, 100);
		eq.depop_all(116594);
	end

end
