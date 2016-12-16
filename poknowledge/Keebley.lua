
function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Hello! I'm Keebley and Santa has asked me to hand out presents to all the [nice] boys and girls!");
		elseif(e.message:findi("nice")) then
			e.self:Say("Prove to me you are one of the nice ones by going and feeding a short slave in Crushbone a ration, bringing bandages to an injured Halfling in Najena, giving water to a Translocator in Oasis, and delivering a pie to the Chancellor of the Plane of Knowledge. You will get one of my [presents] as a reward for your kindness.");
		elseif(e.message:findi("presents")) then
			e.self:Say("Oh what wondrous bounties I have from extraordinary adventuring weapons to exotic foods. And if you are extra special, you might be granted something rare to this world!");
		end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local item_lib = require("items");
	
	if qglobals.nice == nil and item_lib.check_turn_in(e.self, e.trade, {item1 = 34027, item2= 34028,item3 = 34029, item4 = 22291}) then
		e.self:Emote("smiles broadly.");
		e.self:Say("Santa would be proud of what you have done for these people. Happy Holidays!  Enjoy your gift! Come back tomorrow for another!");
		rewards(e);
		eq.set_global("nice", "done", 1, "M1");
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function rewards(ev)
	local item_pick = math.random(1000);
	
	if item_pick < 100 then -- 10%
		ev.other:SummonItem(eq.ChooseRandom(16877, 16878, 16879, 16880)); -- gnomish fireworks
	elseif item_pick < 200 then -- 10%
		ev.other:SummonItem(13035); -- elven wine
	elseif item_pick < 400 then -- 20%
		ev.other:SummonItem(9662); -- misty thicket picnic
	elseif item_pick < 600 then -- 20%
		ev.other:SummonItem(9758); -- qeynos afternoon tea
	elseif item_pick < 699 then -- 9.9%
		ev.other:SummonItem(14534); -- blood of wolf
	elseif item_pick < 798 then -- 9.9%
		ev.other:SummonItem(14896); -- great concentration
	elseif item_pick < 897 then -- 9.9%
		ev.other:SummonItem(19078); -- cloudy potion
	elseif item_pick < 996 then -- 9.9%
		ev.other:SummonItem(14329); -- thick amber potion
	elseif item_pick > 995 then -- 0.4%
		local tbl = {}; -- 31853 (high elf), 31854 (half elf), 31859 (halfling), 31860 (wood elf), 31863 (gnome)
		if ev.other:GetRace() ~= 5 then
			table.insert(tbl, 31853);
		end
		if ev.other:GetRace() ~= 7 then
			table.insert(tbl, 31854);
		end
		if ev.other:GetRace() ~= 11 then
			table.insert(tbl, 31859);
		end
		if ev.other:GetRace() ~= 12 then
			table.insert(tbl, 31863);
		end
		ev.other:SummonItem(tbl[math.random(#tbl)]); -- illusion items
	end
	
end
