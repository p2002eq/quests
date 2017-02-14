---- Twilight Armor - Warrior
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Another traveler to our fair city of Katta Castellum, you be careful now.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Yes I am one of the keepers of the soldier's armor. The pieces I have are the [helm], [breastplate], [vambraces], [greaves], [pauldrons], [bracer], and [boots]. Eandalion keeps the other pieces just ask him about armor.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the boots you will have to bring to me a cloud jewel, a mark of the martial, and a hope ruby.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer you will have to bring to me a star jewel, a mark of the siege, and a blue egg.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("For the breastplate you will have to bring to me a meteor jewel, a mark of war, a weathered yew wand, and some dew of dawn.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("For the greaves you will have to bring to me a sun jewel, a mark of archery, a golden torch, and a small meteor fragment.");
	elseif(e.message:findi("helm")) then
		e.self:Say("For the helm you will have to bring to me a sky jewel, a mark of battle, some petrified toes, and a fire blossom.");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("For the pauldrons you will have to bring to me a moon jewel, a mark of swordsmanship, and a water blossom.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("For the vambraces you will have to bring to me an astral jewel, a mark of arms, a small sponge, and a scorched rock.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5496, item3 = 5497})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3939,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5494, item3 = 5495})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3938,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5483, item3 = 5484, item4 = 5485})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3934,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5489, item3 = 5490, item4 = 5491})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3936,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5480, item3 = 5481, item4 = 5482})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3933,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5492, item3 = 5493})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3937,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5486, item3 = 5487, item4 = 5488})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3935,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
