function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A healthy young " .. e.other:Race() .. " you appear to be. The Plague Bringer has not yet blessed you with his greatest of gifts. What can I do for you young one?");
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To assemble scourge warrior gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Ruined Wolf Pelt and two Gnoll Finger Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19633);
	elseif(e.message:findi("boot")) then
		e.self:Say("To assemble scourge warrior boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Ruined Wolf Pelts, and two Gnoll Foot Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19634);
	elseif(e.message:findi("bracer")) then
		e.self:Say("To assemble a scourge warrior bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Ruined Wolf Pelt and a Gnoll Ulna Bone in the Mail Assembly Kit.");
		e.other:SummonItem(19632);
	elseif(e.message:findi("helm")) then
		e.self:Say("To assemble a Scourge Warrior Helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Ruined Wolf Pelt and a Gnoll Skull in the Mail Assembly Kit.");
		e.other:SummonItem(19631);
	elseif(e.message:findi("greave")) then
		e.self:Say("To assemble scourge warrior greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Low Quality Wolf Pelts and two Gnoll Tibia in the Mail Assembly Kit.");
		e.other:SummonItem(19636);
	elseif(e.message:findi("vambrace")) then
		e.self:Say("To assemble scourge warrior vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Low Quality Wolf Pelt and two Gnoll Humerus Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19635);
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To assemble a scourge warrior breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Medium Quality Wolf Pelt, a Gnoll Sternum, and a Gnoll Ribcage in the Mail Assembly Kit.");
		e.other:SummonItem(19637);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20205})) then
		e.self:Say("Ah, so you are in need of a suit of armor fitting a young scourge warrior of the Bloodsabers. I will assist you. You will use this Mail Assembly Kit to construct the pieces of armor. Each piece will require different materials for its proper construction. Do you seek to assemble [" .. eq.say_link("Gauntlets of the Scourge Warrior") .. "], [" .. eq.say_link("Boots of the Scourge Warrior") .. "], a [" .. eq.say_link("Bracer of the Scourge Warrior") .. "], a [" .. eq.say_link("Helm of the Scourge Warrior") .. "], [" .. eq.say_link("Greaves of the Scourge Warrior") .. "], [" .. eq.say_link("Vambraces of the Scourge Warrior") .. "], or a [" .. eq.say_link("Breastplate of the Scourge Warrior") .. "]?");
		e.other:QuestReward(e.self,0,0,0,0,17124);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20177, item2 = 19946})) then
		e.self:Say("Excellent work. Use this sword to further our mission.");
		e.other:QuestReward(e.self,0,0,0,0,20262,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
