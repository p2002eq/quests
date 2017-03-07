---- Twilight Armor - Rogue
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("looks at ".. e.other:GetName() .. " and smirks. 'I be Bolli and it's sure an honor to meet such a fine person such as yourself! I have plenty of [deals] for any stealthy types'");
	elseif(e.message:findi("deals")) then
		e.self:Say("Ah ".. e.other:GetName() .. ", you fancy yerself to be a rogue.  Well I can cut ya a deal on some [armor] if you be wantin' some.");
	elseif(e.message:findi("armor")) then
		e.self:Emote("smiles widely. ''Ah excellent. I have a [coif], [tunic], [vambraces], [greaves], [mantle], [bracer], and [boots]. Just ask about each one and I'll tell ya just what I want in return. You'll have to talk to my partner Liteema if you want the rest of the armor.");
	elseif(e.message:findi("boots")) then
		e.self:Say("If you want the Boots of Concealment go gather for me a meteor jewel, a mark of silence, and an engraved fire emerald statuette.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("If you want the Bracer of Concealment go gather for me a sky jewel, a mark of cunning, and an engraved black diamond statuette.");
	elseif(e.message:findi("tunic")) then
		e.self:Say("If you want the Tunic of Concealment go gather for me a sun jewel, a mark of seduction, an engraved diamond statuette, and a tethered leash.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("If you want the Greaves of Concealment go gather for me a star jewel, a mark of burglary, an engraved ruby statuette, and a small brass figurine.");
	elseif(e.message:findi("coif")) then
		e.self:Say("If you want the Coif of Concealment go gather for me an astral jewel, a mark of thievery, an engraved sapphire statuette, and a brass linked chain.");
	elseif(e.message:findi("mantle")) then
		e.self:Say("If you want the Mantle of Concealment go gather for me a cloud jewel, a mark of forgery, and an engraved star sapphire statuette.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("If you want the Vambraces of Concealment go gather for me a moon jewel, a mark of robbery, an engraved emerald statuette, and a half melted blade.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5285, item3 = 5286})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3794,10000); -- Boots of Concealment
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5283, item3 = 5284})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3793,10000); -- Bracer of Concealment
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5272, item3 = 5273, item4 = 5274})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3789,10000); -- Mail of Concealment
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5278, item3 = 5279, item4 = 5280})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3791,10000); -- Greaves of Concealment
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5269, item3 = 5270, item4 = 5271})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3788,10000); -- Coif of Concealment
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5281, item3 = 5282})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3792,10000); -- Mantle of Concealment
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5275, item3 = 5276, item4 = 5277})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3790,10000); -- Vambraces of Concealment
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
