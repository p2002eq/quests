
function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Hello! I'm Neebly and I have presents that I stole from Santa! They're in my special bag! Are you [naughty]? If you help me sow a little mayhem, you can have one!");
		elseif(e.message:findi("naughty")) then
			e.self:Emote("cackles wildly.");
			e.self:Say("Prove to me you are one of the naughty ones! Bring me the foot bone of a Halfling, a gnome kabob, Brownie parts, and the flesh of a high elf, and you will get one of my [presents].");
		elseif(e.message:findi("presents")) then
			e.self:Say("Oh what wondrous bounties I have from extraordinary adventuring weapons to exotic foods. And if you are extra special, you might be granted something rare to this world!");
		end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local item_lib = require("items");
	
	if qglobals["naughty"] == nil and item_lib.check_turn_in(e.self, e.trade, {item1 = 16183, item2= 13365, item3 = 13466, item4 = 16579}) then
		e.self:Emote("howls with laughter.");
		e.self:Say("Wonderful! Wonderful! Reach into my bag and grab what you can! I'll need another laugh tomorrow, so do come back!");
		rewards(e);
		eq.set_global("naughty", "done", 1, "M1");
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function rewards(ev)
	local item_pick = math.random(1000);
	
	if item_pick < 150 then -- 15%
		ev.other:SummonItem(13032, 20); -- stack of short beer
	elseif item_pick < 300 then -- 15%
		ev.other:SummonItem(22125); -- charcoal
	elseif item_pick < 500 then -- 20%
		ev.other:SummonItem(9752); -- halas meat pie
	elseif item_pick < 700 then -- 20%
		ev.other:SummonItem(9760); -- grobb liquidized meat
	elseif item_pick < 790 then -- 9%
		ev.other:SummonItem(32241); -- living coal
	elseif item_pick < 880 then -- 9%
		ev.other:SummonItem(14523); -- slime filled potion
	elseif item_pick < 970 then -- 9%
		ev.other:SummonItem(10081); -- midnight mallet
	elseif item_pick < 996 then -- 2.6%
		ev.other:SummonItem(29781); -- bristlebane's party platter
	elseif item_pick > 995 then -- 0.4%
		local tbl = {}; -- 31851 (ogre), 31855 (erudite), 31857 (dark elf), 31861 (troll), 31862 (iksar)
		if ev.other:GetRace() ~= 10 then
			table.insert(tbl, 31851);
		end
		if ev.other:GetRace() ~= 3 then
			table.insert(tbl, 31855);
		end
		if ev.other:GetRace() ~= 9 then
			table.insert(tbl, 31861);
		end
		if ev.other:GetRace() ~= 128 then
			table.insert(tbl, 31862);
		end
		ev.other:SummonItem(tbl[math.random(#tbl)];); -- illusion items
	end
	
end
