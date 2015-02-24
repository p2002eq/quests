-- Quests: Orc Hatchets and Orc Runner (Kelethin)

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the treetops and the home of Faydark's Champions. We are the skilled rangers of the Faydarks. You are safe in Kelethin. but watch yourself upon the forest floor. I hear the [blue meanies] have been on the rise.");
	elseif(e.message:findi("blue meanies")) then
		e.self:Say("That is a little name I have given the Crushbone orcs. It appears they have increased their numbers. The Emerald Warriors are charged with our defense against them. We rangers are to seek out the [orc saboteurs].");
	elseif(e.message:findi("orc saboteurs")) then
		e.self:Say("As others move to battle the orc armies. we have word that the orc pawns have been sent into the woods to damage the great trees which support Kelethin. We shall employ the talents of our young rangers to halt their efforts. I currently seek those who will [hunt the orc pawns].");
	elseif(e.message:findi("hunt the orc pawns")) then
		e.self:Say("Go to the forest floor and seek out the orc pawns. Within their ranks can sometimes be found orc hatchetmen. They carry orc hatchets which you must return and I shall reward you for every two orc hatchets and perhaps offer you a weapon in return. should we have any to spare at the time.");
	elseif(e.message:findi("crushbone allies")) then
		e.self:Say("It seems the orcs have allied themselves with the wicked Teir'Dal. We know of this through reports of a Teir'Dal presence within Crushbone. We must [intercept the Crushbone runners] and find a reason for their union.");
	elseif(e.message:findi("intercept the crushbone runners")) then
		e.self:Say("Go to the Butcherblocks. You stand a greater chance of finding the runners there. I shall pay a bounty for all returned runner pouches.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12108,item2 = 12108})) then -- Orc Hatchet x 2
		e.self:Say("Fantastic work!! Your actions shall earn you the respect of all Fier'Dal!  Take this as a small bounty for your deed.  We have heard of [Crushbone allies] who wish our demise.");
		e.other:SummonItem(eq.ChooseRandom(5047,5048,7032)); -- Tarnished Scimitar, Tarnished Bastard Sword, Cast-Iron Rapier
		e.other:Ding();
		e.other:Faction(99,10);  -- Faydark's Champions
		e.other:Faction(178,2); -- King Tearis Thex
		e.other:Faction(43,2);  -- Clerics of Tunare
		e.other:Faction(304,2); -- Soldiers of Tunare
		e.other:Faction(63,-2); -- Crushbone Orcs
		e.other:AddEXP(500);
		e.other:GiveCash(math.random(10),math.random(20),0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12108})) then -- Orc Hatchet
		e.self:Say("I expect to receive TWO orc hatchets.");
		e.other:SummonItem(12108); -- Orc Hatchet
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18840})) then -- Sealed Letter (Letter To King Naythox Thex)
		e.self:Say("Yes. A recent report has proven this to be true. An evil alliance has been made. We shall soon need many more experienced adventurers such as yourself. For now, take this reward and strengthen your skills.");
		e.other:SummonItem(8003); -- Longbow
		e.other:Ding();
		e.other:Faction(99,20);  -- Faydark's Champions
		e.other:Faction(178,5); -- King Tearis Thex
		e.other:Faction(43,5);  -- Clerics of Tunare
		e.other:Faction(304,5); -- Soldiers of Tunare
		e.other:Faction(63,-5); -- Crushbone Orcs
		e.other:AddEXP(1500);
		e.other:GiveCash(math.random(10),math.random(10),math.random(10),math.random(2));
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13226})) then -- Runner Pouch
		e.self:Say("Good work. We shall cut off correspondence between these two. It is for the best. Remember, if you find any notes to Neriak from the ambassador in Crushbone, give them to me.");
		e.other:SummonItem(2140); -- Raw-hide Tunic
		e.other:Ding();
		e.other:Faction(99,20);  -- Faydark's Champions
		e.other:Faction(178,5); -- King Tearis Thex
		e.other:Faction(43,5);  -- Clerics of Tunare
		e.other:Faction(304,5); -- Soldiers of Tunare
		e.other:Faction(63,-5); -- Crushbone Orcs
		e.other:AddEXP(1500);
		e.other:GiveCash(math.random(10),math.random(10),math.random(10),math.random(2));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54105 -- Dill_Fireshine