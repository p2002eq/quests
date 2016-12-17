
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello! I'm Grunch and I have presents that I stole from Santa! They're in my special bag! Are you [naughty]? If you help me sow a little mayhem, you can have one!");
	elseif(e.message:findi("naughty")) then
		e.self:Emote("cackles wildly.");
		e.self:Say("Prove to me you are one of the naughty ones! Bring me the matted hide of a Halfling, a gnome kabob, brownie parts, and the blood of a human, and you will get one of my [presents].");
	elseif(e.message:findi("presents")) then
		e.self:Say("I stole all the good presents! They're all in my bag! HAHAHAHA! Quick quick!");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local item_lib = require("items");
	
	if qglobals["naughty"] == nil then
		if item_lib.check_turn_in(e.self, e.trade, {item1 = 22572, item2 = 22514, item3 = 13466, item4 = 16579}) then
			e.self:Emote("howls with laughter.");
			e.self:Say("Wonderful! Wonderful! Reach into my bag and grab what you can! I'll need another laugh tomorrow, so do come back!");
			rewards(e);
			e.self:SpellFinished(eq.ChooseRandom(119, 30, 214, 206), e.other);
			eq.set_global("naughty", "done", 1, "H23");
		end
	else
		e.self:Say("You can't have another yet! Come back later!");
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
		ev.other:SummonItem(14523, 1); -- slime filled potion
	elseif item_pick < 970 then -- 9%
		ev.other:SummonItem(10081, 5); -- midnight mallet
	elseif item_pick < 996 then -- 2.6%
		ev.other:SummonItem(11175, 1); -- can o whoop ass
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
		eq.world_emote(15, ev.other:GetCleanName() .. " can take new form!");
		ev.other:SummonItem(tbl[math.random(#tbl)]); -- illusion items
	end
	
end
