--Wage War Upon the Coldain

function event_say(e)

	if (e.other:GetFaction(e.self) < 6) then --Indifferent or lower
		if (e.message:findi("hail")) then	
			e.self:Say("Greetings, little thing. You have entered into the great city of Kael Drakkel, home of the Kromzek as well as a few of my kind, the Kromrif. If you are to walk among my people as a peer you must prove yourself as a friend, not a foe.");
		elseif (e.message:findi("prove myself")) then	
			e.self:Say("Leave this place then and return when you have waged war upon the Coldain. Remove their heads from their bodies and return them to me. I will spread the word of your deeds amongst my people if you do so, "..e.other:GetName()..".");
		elseif (e.message:findi("coldain")) then	
			e.self:Say("The Coldain are the ice dwarves who dwell in the city of Thurgadin. They are a blight upon the land known as Velious, speaking the word of their god, Brell.");
		end
	else
		e.self:Say("I will do nothing to help beings like you!");
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (e.other:GetFaction(e.self) < 6) then --Indifferent or lower 
		if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30081})) then
			e.self:Say("Very good, "..e.other:GetName()..". Slay more of the beasts and your name will be known by all of the Kromrif!");
			e.other:AddEXP(500);
			e.other:Faction(188, 10); --kromrif
			e.other:Faction(189, 10); --kromzek
			e.other:Faction(42, -30); --CoV
			e.other:Faction(49, -30); --coldain	
		end
	end
	
	item_lib.return_items(e.self, e.other, e.trade);

end
