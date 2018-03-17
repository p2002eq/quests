function event_say(e)

	if (e.message:findi("hail")) then	
		e.self:Say("You have entered the sacred temple of Vallon Zek. This is the Temple of Strategy. We [" .. eq.say_link("teach") .. "] what must be done to be a great leader. Forethought is a powerful tool.");
	elseif (e.message:findi("teach")) then
		e.self:Say("I cannot teach one of your kind the arts of war at this time. I must teach the other Kromzek and Kromrif that proper strategy will allow us to win the war against the dragons. If you were to [" .. eq.say_link("serve") .. "] the temple of Vallon, I might consider giving you a few words of advice about strategy.");
	elseif (e.message:findi("serve")) then
		e.self:Say("The dragons of Velious are ancient and wise beyond belief. They have ageless strategies to destroy their foes. The Temple of Strategy must gain the knowledge they hold. I have heard rumors of a great dragon burial ground. If this tomb indeed exists, find it and seek out the knowledge of the dragons who are now dead. Bring whatever you believe will teach us their strategies and tactics of the past.");
	end	

end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 24986})) then --Golden Table of Draconic Strategy
		e.self:Say("These scrolls are ancient beyond belief. They describe the maneuvers dragons use to avoid being injured by mighty warriors. This will aid the cause of King Tormax greatly. Take this gift from the temple of Vallon and know that you are wise indeed.");
		e.other:Faction(188, 20); --Kromrif
		e.other:Faction(189, 20); --Kromzek
		e.other:Faction(179, 10); --KT
		e.other:Faction(42, -30); --CoV
		e.other:QuestReward(e.self, 0,0,0,0, eq.ChooseRandom(25036,25040,25034,25035), 1750000);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  24985})) then	
		e.self:Say("These scrolls are ancient beyond belief. They describe the maneuvers dragons use to avoid being injured by mighty warriors. This will aid the cause of King Tormax greatly. Take this gift from the temple of Vallon and know that you are wise indeed.");
		e.other:Faction(188, 20); --Kromrif
		e.other:Faction(189, 20); --Kromzek
		e.other:Faction(179, 10); --KT
		e.other:Faction(42, -30); --CoV
		e.other:QuestReward(e.self, 0,0,0,0, eq.ChooseRandom(25036,25040,25034,25035), 1750000);
	end

	item_lib.return_items(e.self, e.other, e.trade);	

end
