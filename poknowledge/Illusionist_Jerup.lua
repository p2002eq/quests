function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings traveler and welcome to the Plane of Knowledge! I am so pleased to see so many eager minds among us -- for it has been so long since I have had the meaningful presence of a pupil. If by chance you practice the art of Enchantments. then I might be of service to you. I have penned many spells from memory as a wandering enchanter and scholar of Norrath's history and though these spells are nothing unique or rare unto your world. they may provide some aid to you while you are here. Also. if you happen upon a seemingly meaningless item of arcane nature -- you will recognize these specific items I speak of by their corporeal state of existence -- then do not hesitate to take them up and return them to me. I know a thing or two regarding planar magic and can turn these seemingly mundane items into enchantments of great power.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 29112})) then--Ethereal Parchment
		e.self:Emote(" examines the item. 'Excellent! I can continue my research into planar magic. Take this as a reward.'");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26944, 28413, 28643, 28644, 28452, 28453, 26947, 21665, 21667, 28455, 28457, 28469, 21639)); --Level 61 or 62 Enchanter spell, PoP (Greater Fetter, Shield of the Arcane, Arcane Rune, Boggle, Howl of Tashan, Rune of Zebuxoruk, Pacification, Speed of Vallon, Guard of Druzzil, Strangle, Beckon, Word of Morell, Aeldorb's Animation)
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29131})) then--Spectral Parchment
		e.self:Emote(" examines the item. 'Excellent! I can continue my research into planar magic. Take this as a reward.'");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21666, 28458, 28460, 28461, 28464, 28415, 28459, 28465, 28468)); --Level 63 or 64 Enchanter spell, PoP (Night's Dark Terror, Torment of Scio, Tranquility, Uproar, Sleep, Shield of Maelin, Insanity, Command of Druzzil, Bliss)
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29132})) then--Glyphed Rune Word
		e.self:Emote(" examines the item. 'Excellent! I can continue my research into planar magic. Take this as a reward.'");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21648, 21664, 28470)); --Level 65 Enchanter spell, PoP (Illusion Froglok, Vallon's Quickening, Voice of Quellious)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--quest by Kilelen
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
