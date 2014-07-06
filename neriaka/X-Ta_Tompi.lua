--Quest Name: Necromancer Words - X`Ta Tompi
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("We three are the [Sisters Dark] - [Necromancy] is our Art - Bonded dead, they serve our will - No beat of heart, yet faithful still.");
	elseif(e.message:findi("sisters dark")) then
		e.self:Say("We three are the Sisters Dark - Keepers of the shadowed Dread - [Lore of Death]. we research now - Join with us and serve [the Dead].");
	elseif(e.message:findi("lore of death")) then
		e.self:Say("The Lore of Death is shadow bound - Its [words] are [hid]. yet shall be found - Through our research into the dark - Old hexes found and parchment marked.");
	elseif(e.message:findi("the dead")) then
		e.self:Say("The Dead are the shadowknights and necromancers of Neriak. They were formed by Queen Cristanos herself. Even among the Teir'Dal they are feared and they keep to themselves within the Lodge of the Dead in the Third Gate. I have heard they take orders only from the queen.");
	elseif(e.message:findi("necromancy")) then
		e.self:Say("Necromancy - Art of the Dead - Binding bones to serve your will - We research now the [Lore of Death] - Ancient spells with power still.");
	elseif(e.message:findi("hid")) then
		e.self:Say("The Words are hid in tomes of old - Their yielded lore worth more than gold - Though we search both 'fore and 'hind - [Components] we can not yet find.");
	elseif(e.message:findi("components")) then
		e.self:Say("We need components for research - These are things that you could find - In return for [tasks] that you perform - Words of [reward] we have in mind.");
	elseif(e.message:findi("tasks") or e.message:findi("reward")) then
		e.self:Say("Bring us components for our research - We give [Word]s by tasks performed - [Possession], [Detachment], [Allure], [Haunting], [Rupturing], [Dark Paths], [Suffering], [Collection], [Obligation], [Requisition] and [Acquisition].");
	elseif(e.message:findi("words of allure")) then
		e.self:Say("From the Estate of Unrest, bring a Charred Pearl - From Castle Mistmoore, a wand charred - From a merchant bring a stone of blood and a ruby - Words of Allure will be your reward.");
	elseif(e.message:findi("words of dark paths")) then
		e.self:Say("From the Estate of Unrest, bring an globe of darkness - From Guk, an Eye of Urd - From a merchant bring a Star Rose Quartz - Then Words of Dark Paths will to you be given.");
	elseif(e.message:findi("words of acquisition")) then
		e.self:Say("From the Plane of Fear, bring Fetid Skin, Scare Straw and a Turmoil Wart - From a merchant bring a pearl - Then Words of Acquisition will to you be given.");
	elseif(e.message:findi("words of obligation")) then
		e.self:Say("From Guk, bring an Eye of Jin - From spectres, bring a Globe of Fear - From a merchant bring a jade stone - Then Words of Obligation will to you be given.");
	elseif(e.message:findi("words of possession") or e.message:findi("words of detachment") or e.message:findi("words of rupturing") or e.message:findi("words of haunting") or e.message:findi("words of suffering") or e.message:findi("words of collection") or e.message:findi("words of requisition")) then
		e.self:Say("The answer to that question is held by another - Ask again of my sister...");
	end
end

function event_trade(e)
	local item_lib = require("items");

	--Words of Allure
	--Requires: 1 Charred Pearl, 1 Ruby, 1 A Wand (Charred Wood Wand?), 1 Bloodstone
	if(item_lib.check_turn_in(e.trade, {item1 = 10083, item2 = 10035, item3 = 14160, item4 = 10019})) then
		e.self:Say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
		e.other:SummonItem(11829);
		e.other:Faction("322","10"); 	-- The Dead
		e.other:Faction("268","10"); 	-- Queen Cristanos Thex
		e.other:Faction("177","-10"); 	-- King Naythox Thex
		e.other:Faction("170","-10"); 	-- Keepers of the Art
		e.other:Faction("91","-10"); 	-- Eldritch Collective
		e.other:Faction("260","-10"); 	-- Primordial Malice
		e.other:AddEXP(62000); 			--Approx half a blue at level 31
		e.other:Ding();
	--Words of Dark Paths
	--Requires: 1 Sphere of Unrest, 1 Eye of Urd, 1 Star Rose Quartz
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10520, item2 = 10523, item3 = 10021, item4 = 10019})) then
		e.self:Say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
		e.other:SummonItem(11850);
		e.other:Faction("322","10"); 	-- The Dead
		e.other:Faction("268","10"); 	-- Queen Cristanos Thex
		e.other:Faction("177","-10"); 	-- King Naythox Thex
		e.other:Faction("170","-10"); 	-- Keepers of the Art
		e.other:Faction("91","-10"); 	-- Eldritch Collective
		e.other:Faction("260","-10"); 	-- Primordial Malice
		e.other:AddEXP(62000); 			--Approx half a blue at level 31
		e.other:Ding();
	--Words of Acquisition (Beza)
	--Requires: 1 Fetid Skin, 1 Scare Straw, 1 Turmoil Warts, 1 Pearl
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13150, item2 = 13152, item3 = 8331, item4 = 10024})) then
		e.self:Say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
		e.other:SummonItem(11866);
		e.other:Faction("322","10"); 	-- The Dead
		e.other:Faction("268","10"); 	-- Queen Cristanos Thex
		e.other:Faction("177","-10"); 	-- King Naythox Thex
		e.other:Faction("170","-10"); 	-- Keepers of the Art
		e.other:Faction("91","-10"); 	-- Eldritch Collective
		e.other:Faction("260","-10"); 	-- Primordial Malice
		e.other:AddEXP(62000); 			--Approx half a blue at level 31
		e.other:Ding();
	--Words of Obligation
	--Requires: 1 Globe of Fear, 1 Eye of Jin, 1 Jade
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10521, item2 = 10525, item3 = 10023, item4 = 10024})) then
		e.self:Say("You have quested well - With spell and sword - Accept our thanks - And this reward.");
		e.other:SummonItem(11863);
		e.other:Faction("322","10"); 	-- The Dead
		e.other:Faction("268","10"); 	-- Queen Cristanos Thex
		e.other:Faction("177","-10"); 	-- King Naythox Thex
		e.other:Faction("170","-10"); 	-- Keepers of the Art
		e.other:Faction("91","-10"); 	-- Eldritch Collective
		e.other:Faction("260","-10"); 	-- Primordial Malice
		e.other:AddEXP(62000); 			--Approx half a blue at level 31
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Author: Blaz
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
