function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Mmmph!!  Who you?  Oh. you " .. e.other:GetName() .. ".  You supposed to be promising Craknek.  Me need you.  There bad things in swamp.  You want [help Crakneks] or you [want Guntrik bash your face]!!?");
	elseif(e.message:findi("what help crakneks")) then
		e.self:Say("Crakneks warriors!!  They be far back.  Through last caves.  They smash and bash.  They no like Greenbloods.  Bouncers keep thems from bashing.");
	elseif(e.message:findi("bash")) then
		e.self:Say("OK!! Me bash!!  You hurt!!");
		eq.attack(e.other:GetName());
	elseif(e.message:findi("help crakneks")) then
		e.self:Say("Go to swamps. Find noble hunters of humans and elves. All have house crests. Return to me and I give things. If you find special item says where hunters sleep, give to me. If meat founded then give to Clurg's cook. She make fine stew and give coins for meat.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18787})) then
		e.self:Say("Ahh..  good..  good..  here. take..  Now you Craknek! You bash good. Bash lizards. Bash froggies. Bash mushrooms. Remember. you no help Greenbloods. Crakneks stronger than Greenbloods.");
		e.other:Ding();
		e.other:Faction(57,100);  	-- Craknek Warrior
		e.other:Faction(46,15);  	-- Clurg
		e.other:Faction(128,-15); 	-- Green Blood Knight
		e.other:QuestReward(e.self,0,0,0,0,13525,100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13361})) then
		e.self:Say("One less trouble. Hunhuh!! You do good work. Keep up. Remember to bring any special things to Guntrik. Here junk for good work. Go away now.");
		e.other:Faction(57,10);  	-- Craknek Warrior
		e.other:Faction(46,1);  	-- Clurg
		e.other:Faction(128,-1); 	-- Green Blood Knight
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5032,5029, 5033, 5031, 13355),500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------