---- Twilight Armor - Paladin
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings and well met, ".. e.other:GetName() .. ". Don't listen to ol' Latrag over there. He'll never stop brewin' the best durn ale to be found.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Latrag is goin' on 'bout his armor again isn't he. Well friend, be ye a [" .. eq.say_link("paladin") .. "]?");
	elseif(e.message:findi("paladin")) then
		e.self:Say("Of course ya are ".. e.other:GetName() .. ". Why would ya have asked me about the armor if ye wasn't, eh? I have the [" .. eq.say_link("boots") .. "], [" .. eq.say_link("mask") .. "], [" .. eq.say_link("cloak") .. "], [" .. eq.say_link("gauntlets") .. "], [" .. eq.say_link("gorget") .. "], [" .. eq.say_link("girdle") .. "], and a [" .. eq.say_link("sword") .. "]. Which do ye want?");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the boots yer gonna have to get me a sun jewel, a mark of destiny, and a fleshy vine.");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask yer gonna have to get me a moon jewel, a mark of blessings, and some crystallized dew.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak yer gonna have to get me a star jewel, a mark of the steadfast, a lexicon of the sun, and some glade dew.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("For the gauntlets yer gonna have to get me a cloud jewel, a mark of honor, and some naturally formed quartz.");
	elseif(e.message:findi("gorget")) then
		e.self:Say("For the gorget yer gonna have to get me a sky jewel, a mark of gallantry, and a lunar marked stone.");
	elseif(e.message:findi("girdle")) then
		e.self:Say("For the girdle yer gonna have to get me a meteor jewel, a mark of heart, a lexicon of the moon, and a dread leech eye.");
	elseif(e.message:findi("sword")) then
		e.self:Say("For the sword yer gonna have to get me an astral jewel, a mark of the noble, a hardened clay sculpture, and a runic ear plug.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5904, item3 = 5905})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3978,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5908, item3 = 5909, item4 = 5910})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3980,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5911, item3 = 5912})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3981,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5915, item3 = 5916, item4 = 5917})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3983,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5913, item3 = 5914})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3982,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5906, item3 = 5907})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3979,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5918, item3 = 5919, item4 = 5920})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3984,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end