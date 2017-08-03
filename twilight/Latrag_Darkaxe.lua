---- Twilight Armor - Paladin
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("lets out a resounding belch.");
		e.self:Say("Har there lad! Ye be sure 'nuff to tell em all that Brewmaster Latrag is [" .. eq.say_link("retiring") .. "].");
	elseif(e.message:findi("retiring")) then
		e.self:Say("Ya got that right. I'm goin' to concentrate more on me devotion to Brell as a [" .. eq.say_link("holy knight") .. "]!");
	elseif(e.message:findi("holy knight")) then
		e.self:Say("I be a paladin of Brell thar Daias. Might ye be a [" .. eq.say_link("paladin") .. "] yerself?");
	elseif(e.message:findi("paladin")) then
		e.self:Say("That's good. Ya know, I have some [" .. eq.say_link("armor") .. "] ye might be interested in.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Yar! I have me a [" .. eq.say_link("helm") .. "], [" .. eq.say_link("breastplate") .. "], [" .. eq.say_link("vambraces") .. "], [" .. eq.say_link("greaves") .. "], [" .. eq.say_link("pauldrons") .. "], and a [" .. eq.say_link("bracer") .. "]. If ye want the rest talk to the mighty holy warrior Trallen over there about armor.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("For the breastplate ye gotta bring me a star jewel, a mark of courage, a white marble bowl, and a jagged reed.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("For the vambraces ye gotta bring me a cloud jewel, a mark of righteousness, a runed card, and a pristine ebony idol");
	elseif(e.message:findi("greaves")) then
		e.self:Say("For the greaves ye gotta bring me a sky jewel, a mark of bravery, a sunflower fruit, and a weathered bundle of wood");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("For the pauldrons ye gotta bring me a meteor jewel, a mark of daring, and a life gem.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer ye gotta bring me an astral jewel, a mark of reliance, and some blessed water");
	elseif(e.message:findi("helm")) then
		e.self:Say("For the helm ye gotta bring me a moon jewel, a mark of valor, a withered branch, and a pale pearl.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5902, item3 = 5903})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3977,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5891, item3 = 5892, item4 = 5893})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3973,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5897, item3 = 5898, item4 = 5899})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3975,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5888, item3 = 5889, item4 = 5890})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3972,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5900, item3 = 5901})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3976,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5894, item3 = 5895, item4 = 5896})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3974,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end