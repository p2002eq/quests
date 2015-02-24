--Reaver_Nydlil.pl
--Shadowknight PoP Spells
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s voice spills forth in a piercing hiss, the pitch high and accented in the tones of the Iksarian Empire of old.");
		e.self:Say("Welcome to New Tanaan, and stand before us as enemies not, but as equals. Your mind should be open to us, for we wish only to guide you where we have been led in our years beyond Norrath. If you are a knight of the shadows, then perhaps I may be of service in guiding you further to power.");
		e.self:Say("The adepts of New Tanaan, the scholars, have come forward and penned spells of our former lives in memory. We wish to share this knowledge with you without bias or judgment. There is more beyond the mortal limits of magic that I can aid you to attain should you wield the blade of the shadow.");
		e.self:Say("If you happen across a seemingly mundane arcane item of incorporeal material, do not discard it. Return it to me and I shall carve for you from its essence a most powerful spell conceived in the divine realms of pure magic.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 29112})) then --Ethereal Parchment
		e.self:Emote("carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Shadowknight then closes his eyes and chants lowly in an unfamiliar language.");
		e.self:Message(15, "You feel the coalescing of spirits around you in the area as the Shadowknight calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Shadowknight. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf.");
		e.self:Say("Do not use this power without caution, " .. e.other:GetName() .. ". It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26920, 26924, 26921, 26925, 26937)); --Level 61 or 62 Class spell, PoP (Festering Darkness, Aura of Darkness, Touch of Volatis, Zevfeer's Bite, Deny Undead)
	elseif(item_lib.check_turn_in(e.trade, {item1 = 29131})) then --Spectral Parchment
		e.self:Emote("carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Shadowknight then closes his eyes and chants lowly in an unfamiliar language.");
		e.self:Message(15, "You feel the coalescing of spirits around you in the area as the Shadowknight calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Shadowknight. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf.");
		e.self:Say("Do not use this power without caution, " .. e.other:GetName() .. ". It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21651, 26922, 26923, 21632, 21634, 21633)); --Level 63 or 64 Class spell, PoP (Shroud of Chaos, Aura of Pain, Terror of Thule, Blood of Hate, Pact of Hate, Spear of Decay)
	elseif(item_lib.check_turn_in(e.trade, {item1 = 29132})) then --Glyphed Rune Word
		e.self:Emote("carefully takes the planar arcane item from you. With a careful eye, he inspects every portion of the incorporeal item before nodding to himself in satisfaction. The Shadowknight then closes his eyes and chants lowly in an unfamiliar language.");
		e.self:Message(15, "You feel the coalescing of spirits around you in the area as the Shadowknight calls them forth to bless the arcane item in his grip. Dark runes of a rusted color begin to carve themselves onto a parchment that grows more real and tangible with each syllable uttered by the Shadowknight. Eventually, his chant comes to a close and the completed item is handed to you without expectation of further aid on your behalf.");
		e.self:Say("Do not use this power without caution, " .. e.other:GetName() .. ". It is quite powerful indeed for it is power forged upon the planar worlds but may affect both astral and prime alike.");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26926, 26927, 26928, 21635)); --Level 65 Class spell, PoP (Voice of Thule, Aura of Hate, Touch of Innoruuk, Cloak of Luclin)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
