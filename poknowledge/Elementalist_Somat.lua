--Magician PoP Spells/Songs
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello traveler."); --Text made up.
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 29112})) then--Ethereal Parchment
		e.self:Emote("examines the parchment and mumbles something."); --Emote made up
		e.self:Say("Thank you very much, this will help our research. Take this as a reward."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21641, 21642, 32411, 29357, 29358, 29359, 29360, 29361, 28413, 28428, 28429, 28440, 21637, 21643, 21646, 21669, 28430, 28431)); --Level 61 or 62 Magician spell, PoP (Belt of Magi'Kot, Blade of Walnan, Flameshield of Ro, Summon Platinum Choker, Summon Runed Mantle, Summon Sapphire Bracelet, Summon Spiked Ring, Summon Glowing Bauble, Shield of the Arcane, Ward of Xegony, Firebolt of Tallon, Elemental Barrier, Xegony's Phantasmal Guard, Fist of Ixiblat, Talisman of Return, Burnout V, Sun Storm, Servant of Marr)
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29131})) then--Spectral Parchment
		e.self:Emote("examines the parchment and mumbles something."); --Emote made up
		e.self:Say("Thank you very much, this will help our research. Take this as a reward."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21644, 29362, 28432, 28433, 28497, 16341, 29363, 21645, 21659, 21668, 28415, 28434)); --Level 63 or 64 Magician spell, PoP (Blade of The Kedge, Summon Jewelry Bag, Black Steel, Child of Ro, Malosinia, Elemental Silence, Maelstrom of Ro, Girdle of Magi'Kot, Destroy Summoned, Planar Renewal, Shield of Maelin, Maelstrom of Thunder)
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29132})) then--Glyphed Rune Word
		e.self:Emote("examines the rune and mumbles something."); --Emote made up
		e.self:Say("Thank you very much, this will help our research. Take this as a reward."); --Text made up
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28435, 28436, 16342)); --Level 65 Magician spell, PoP (Rathe's Son, Sun Vortex, Call of the Arch Mage)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--quest by Kilelen
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
