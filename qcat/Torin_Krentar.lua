-- Bertoxxulous cleric quest armor

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The dead are watching you young one, yet you are safe under their otherworldly gaze. Is there something I can do for you?");
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To assemble pestilence priest gauntlets you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Iron Gauntlets with a Large King Snake Skin and two Gnoll Finger Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19633);
	elseif(e.message:findi("boot")) then
		e.self:Say("To assemble pestilence priest boots you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Iron Boots with two Large King Snake Skins, and two Gnoll Foot Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19634);
	elseif(e.message:findi("bracer")) then
		e.self:Say("To assemble a pestilence priest bracer you will need to obtain a brick of crude iron and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Iron Bracer with a Large King Snake Skin and a Gnoll Ulna Bone in the Mail Assembly Kit.");
		e.other:SummonItem(19632);
	elseif(e.message:findi("helm")) then
		e.self:Say("To assemble a pestilence priest helm you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Iron Helm with a Large King Snake Skin and a Gnoll Skull in the Mail Assembly Kit.");
		e.other:SummonItem(19631);
	elseif(e.message:findi("greaves")) then
		e.self:Say("To assemble pestilence priest greaves you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Iron Greaves with two Giant King Snake Skins and two Gnoll Tibia in the Mail Assembly Kit.");
		e.other:SummonItem(19636);
	elseif(e.message:findi("vambrace")) then
		e.self:Say("To assemble pestilence priest vambraces you will need to obtain two bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Iron Vambraces with a Giant King Snake Skin and two Gnoll Humerus Bones in the Mail Assembly Kit.");
		e.other:SummonItem(19635);
	elseif(e.message:findi("breastplate")) then
		e.self:Say("To assemble a pestilence priest breastplate you will need to obtain four bricks of crude iron and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Iron Breastplate with a Giant King Snake Skin, a Gnoll Sternum, and a Gnoll Ribcage in the Mail Assembly Kit.");
		e.other:SummonItem(19637);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 20207})) then
		e.self:Say("Well met young disciple of Bertoxxulous. Perhaps one day you shall serve the Plague Lord in his realm, but for now you will serve the Bloodsabers, his mortal agents on Norrath. The armor you seek must be assembled using this Mail Assembly Kit. The materials necessary to construct the armor vary depending on the piece being crafted. Do you wish to craft [Gauntlets] of the Pestilence Priests, [Boots] of the Pestilence Priests, a [Bracer] of the Pestilence Priests, a [Helm] of the Pestilence Priests, [Greaves] of the Pestilence Priests, [Vambraces] of the Pestilence Priests, or a [Breastplate] of the Pestilence Priests?");
		e.other:QuestReward(e.self,0,0,0,0,17124);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20199, item2 = 19946})) then
		e.self:Say("Well done, " .. e.other:GetName() .. ". Now go, spread the gifts of the Plague Lord upon the world.");
		e.other:QuestReward(e.self,0,0,0,0,20261,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: qcat ID: 45074 NAME: Torin_Krentar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------