function event_say(e)
	if (e.message:findi("plague knight boots")) then
		e.self:Say("To assemble Plague Knight Boots you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Boot Mold. Once that is done combine the Crude Bronze Boots with two Ruined Cat Pelts, and two Clockwork Rat Belly Plates in the Mail Assembly Kit.");
		e.other:SummonItem(19634); -- Crude Boot Mold
	elseif (e.message:findi("plague knight bracer")) then
		e.self:Say("To assemble a Plague Knight Bracer you will need to obtain a brick of crude bronze and smelt it in a forge with a Water Flask and this Crude Bracer Mold. Once that is done, combine the Crude Bronze Bracer with a Ruined Cat Pelt and a Clockwork Rat Leg Section in the Mail Assembly Kit.");
		e.other:SummonItem(19632); -- Crude Bracer Mold
	elseif (e.message:findi("plague knight breastplate")) then
		e.self:Say("To assemble a Plague Knight Breastplate you will need to obtain four bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Breastplate Mold. Once that is done combine the Crude Bronze Breastplate with a Medium Quality Cat Pelt, a Clockwork Spider Thorax Plate, and a Clockwork Spider Abdomen Plate in the Mail Assembly Kit.");
		e.other:SummonItem(19637); -- Crude Breastplate Mold
	elseif (e.message:findi("plague knight gauntlets")) then
		e.self:Say("To assemble Plague Knight Gauntlets you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this crude Gauntlet Mold. Once that is done combine the Crude Bronze Gauntlets with a Ruined Cat Pelt and two Clockwork Rat Back Plates in the Mail Assembly Kit.");
		e.other:SummonItem(19633); -- Crude Gauntlets Mold
	elseif (e.message:findi("plague knight greaves")) then
		e.self:Say("To assemble Plague Knight Greaves you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Greaves Mold. Once that is done combine the Crude Bronze Greaves with two Low Quality Cat Pelts and four Clockwork Spider Leg Sections in the Mail Assembly Kit.");
		e.other:SummonItem(19636); -- Crude Greaves Mold
	elseif (e.message:findi("plague knight helm")) then
		e.self:Say("To assemble a Plague Knight Helm you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Helm Mold. Once that is done combine the Crude Bronze Helm with a Ruined Cat Pelt and two Clockwork Spider Eye Lenses in the Mail Assembly Kit.");
		e.other:SummonItem(19631); -- Crude Helm Mold
	elseif (e.message:findi("plague knight vambraces")) then
		e.self:Say("To assemble Plague Knight Vambraces you will need to obtain two bricks of crude bronze and smelt them in a forge with a Water Flask and this Crude Vambrace Mold. Once that is done combine the Crude Bronze Vambraces with a Low Quality Cat Pelt and two Clockwork Spider Leg Sections in the Mail Assembly Kit.");
		e.other:SummonItem(19635); -- Crude Vambrace Mold
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 10987})) then -- Parchment to Mimtia
		e.self:Say("Hail " .. e.other:GetName() .. "! You must be one of Garret's new knights. Garret has asked me to help get you outfitted in a suit of armor to protect you from the weapons of our foes. I have assembled a kit for you that will allow you to construct the armor pieces once you have gathered the necessary components. The required components vary according to which piece of Plague Knight Armor you are planning on assembling. Do you wish to craft a [" .. eq.say_link("plague knight helm") .. "], a [" .. eq.say_link("plague knight bracer") .. "], [" .. eq.say_link("plague knight gauntlets") .. "], [" .. eq.say_link("plague knight boots") .. "], [" .. eq.say_link("plague knight vambraces") .. "], [" .. eq.say_link("plague knight greaves") .. "], or a [" .. eq.say_link("plague knight breastplate") .. "].");
		e.other:QuestReward(e.self,0,0,0,0,17124,100); -- Mail Assembly Kit
	end
	item_lib.return_items(e.self, e.other, e.trade)
end