function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I hope you have a good reason for disturbing my contemplations. Perhaps you [seek the knowledge] of those who meditate within this Temple of Fear?");
	end
	if(e.message:findi("I seek knowledge")) then
		e.self:Say("It is the secrets of Fear you seek, but first you must prove your devotion to our temple. There are pack rats within the city that have a habit of getting into things. Some of these rats have ingested a concoction developed by the necromancers of this great city. The rats have since died and, due to the concoction, their undead corpses now roam the fields. Bring me four livers from these undead rats so that we may examine them.");
	end
	if(e.message:findi("duties")) then
		e.self:Say("The primary duty of this temple is to spread terror, fright, and dread as a symbol of your devotion to our lord Cazic Thule. We are currently researching a means of summoning avatars of Fright, Terror and Dread, the primary minions of the Faceless in his home plane. Will you [assist me in summoning] the avatar of Fright?");
	end
	if(e.message:findi("assist")) then
		e.self:Say("In order to summon the avatar of Fright. I require some special components for the ritual. Fetch me the flesh of a zombie. the dust used in the process of mummification. [charred bone chips]. and a [vial of Tunare's Breath].");
	end
	if(e.message:findi("chips")) then
		e.self:Say("Some time ago a necromancer by the name of Obretl was sent to slay Rathmana Allin and his abomination of an adopted son. Ortallius. Obretl failed in his task and now haunts a small ruin in the desert of Ro cursed by Solusek to wallow in his failure in the form of a burning skeleton. Slay Obretl to free him from his pathetic existence and gather his charred remains.");
	end
	if(e.message:findi("vial")) then
		e.self:Say("Tunare's Breath is a life-giving potion created by the Fier'Dal Soldiers of Tunare. Seek out the druid Kalayia who is known to wander the Faydarks in search of reagents for potions. Procure from her a vial of Tunare's Breath. Shed her blood if need be.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18019})) then -- Harbingers of Fear Guild Note
		e.self:Say("You are welcomed into the fold. Now go out. and prove yourself. young one. You have much to learn about the Dark Truth.");
		e.other:SummonItem(13573); -- Blood Splattered Tunic
		e.other:Ding();
		e.other:Faction(143,100); -- Heretics
		e.other:Faction(79,-100); -- Deepwater Knights
		e.other:Faction(112,-100); -- Gate Callers
		e.other:Faction(56,-100); -- Craftkeepers
		e.other:Faction(60,-100); -- Crimson Hands
		e.other:AddEXP(100);
	
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13270, item2 = 13270, item3 = 13270, item4 = 13270})) then
		e.self:Say("Well done, go now and continue your contemplations of fear. Keep up with your [duties] and you will soon be reaping the rewards granted by our Lord Cazic-Thule!!");
		e.other:AddEXP("200");
		e.other:Faction("143","10");
		e.other:Faction("56","-30");
		e.other:Faction("60","-30");
		e.other:Faction("79","-30");
		e.other:Faction("112","-30");
	
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13074, item2 = 16990, item3 = 14102, item4 = 14103})) then
		e.self:Say("Excellent Job " .. e.other:GetName() .. ". These components will help with our research immeasurably. You will soon be reaping the rewards granted by our Lord Cazic-Thule!! If you want to further assist our research effots, talk to Atdehim Sqonci.");
		e.other:SummonItem("1437");
		e.other:AddEXP("1000");
		e.other:Faction("143","150");
		e.other:Faction("56","-30");
		e.other:Faction("60","-30");
		e.other:Faction("79","-30");
		e.other:Faction("112","-30");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75072 -- Sern_Adolia

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
