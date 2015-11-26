--Living Dragons Quests

function event_say(e)
	if (e.other:GetFaction(e.self) <= 3) then --kindly or better
		if (e.message:findi("hail")) then	
			e.self:Say("My, it is the great $name who stands before me! Rumors of your greatness have spread even to the court of King Tormax. I am Kyenka, Duke of Kael Drakkel. I advise King Tormax on matters concerning the nefarious dragons.");
		elseif (e.message:findi("dragons")) then	
			e.self:Say("The living dragons of this realm are the bane of Kael Drakkel and its people. Eventually they will be gone and only we Kromzek will remain. We will purge this land of their menace.");
		elseif (e.message:findi("purge")) then	
			e.self:Say("The beasts must be slain. They only bring strife to this world. You are a powerful mercenary, and are sympathetic to my cause, I would assume. You could become rich beyond your wildest dreams by assisting King Tormax and me.");
		elseif (e.message:findi("assist")) then	
			e.self:Say("Rally together a band of adventurers and track down and slay the elder dragons of this continent. For each head you return to me I will impart a gift to you.");
		end

	else
		e.self:Say("Your loyalty to our ideals has yet to be proven.");
	end
end

function event_trade(e)

	local item_lib = require('items');

	if (e.other:GetFaction(e.self) <= 3) then --Kindly or better
		if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25119})) then
			e.self:Say("This beast must have taken quite a force to slay. These boots have been crafted to reward your kind for such great efforts. Take them and wear them with pride. They will be a warning to other dragons that you are a great slayer of their kind.");
			e.other:SummonItem(25029);
			e.other:Faction(189, 20); --kromzek
			e.other:Faction(188, 20); --kromrif
			e.other:Faction(179, 20); --KT
			e.other:Faction(42, -60); --CoV
			e.other:AddEXP(100);
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25118})) then		
			e.self:Say("You serve the crown well, $name. This is one less beast to ruin our lands. Take these pauldrons which I have fashioned from the first dragon scales brought to King Tormax's court.");
			e.other:SummonItem(25028);
			e.other:Faction(189, 20); --kromzek
			e.other:Faction(188, 20); --kromrif
			e.other:Faction(179, 20); --KT
			e.other:Faction(42, -60); --CoV
			e.other:AddEXP(100);
		end
	
	else
		e.self:Say("I will do nothing to aid the likes of you.");
	end
end
