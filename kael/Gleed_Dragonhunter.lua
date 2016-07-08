--Gleed's Bow

function event_say(e)
	
	if (e.other:GetFaction(e.self) <= 4) then --Kindly or lower
		if (e.message:findi("hail")) then	
			e.self:Say("sighs as he looks down at you. 'I grow tired of this city. I so long for the tundra and lands of the wild.'");
		elseif (e.message:findi("lands of the wild")) then	
			e.self:Say("I enjoy training these animals, don't get me wrong, but the open wastes, where the great animals and dragons roam free are what I crave. Before I came to serve King Tormax, I wandered those wastes, hunting young dragons and elder wurms. The whistle of an arrow from my bow was like sweet music - each slash of my sword a sweet song.");
		elseif (e.message:findi("young dragons")) then	
			e.self:Say("Yes, I hunted true dragons. The younger ones, at least. With my bow I could shoot them from such a distance they would never see what was coming.");
		elseif (e.message:findi("bow")) then	
			e.self:Emote("unslings an intricately carved bow from his back and shows it to you. 'I crafted this bow myself. It was to be a great slayer of wurms and dragons and it was, for a time. Now it goes to waste in the city, far from the beasts I long to slay. Far from the hunt and the excitement.'");
		elseif (e.message:findi("waste")) then	
			e.self:Say("It is such a shame, this bow deserves to be used. If only there were someone who would use it to hunt the beasts - someone to slay them and skin them like they should be.");
		elseif (e.message:findi("hunt the beasts")) then	
			e.self:Say("You will, little one? One such as yourself is a hunter? I did not know your kind had any skill in such things. In fact, I do not believe your kind could hunt a wurm, not without my wonderful bow. I will not simply hand it to a foolish "..e.other:Race().. ". Hunt down some big game before you bother talking to me again. Perhaps if you bring me the tail of the elusive Vluudeen.");
		end
 
	else
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25137})) then
		e.self:Say("My, you do have a hunters spirit! If you could track down Vluudeen and slay him without the aid of my bow, you must be worthy. Take the bow, huntsman. Use it to slay others of Vluudeen's kind.");
		e.other:Faction(188, 10); --kromrif
		e.other:Faction(189, 10); --kromzek
		e.other:Faction(42, -30); --CoV
		e.other:Faction(49, -30); --coldain
		e.other:SummonItem(25033);
	end
	item_lib.return_items(e.self, e.other, e.trade);

end
