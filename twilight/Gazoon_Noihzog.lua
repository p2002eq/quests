---- Twilight Armor - Wizard
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Who are you?! Why are you on MY island?! If you have [business] with me then speak! Otherwise, leave at once.");
	elseif(e.message:findi("business")) then
		e.self:Say("I'll only deal with a wizard! And you look like no real [wizard] I've ever met!");
	elseif(e.message:findi("wizard")) then
		e.self:Say("You're a wizard you say? Hrmph! If so, let's see you prove it to me. I need some items collected for my research. In return, I will give you some [armor] I have laying around.");
	elseif(e.message:findi("armor")) then
		e.self:Say("I have a [bracer], [cap], [pants], [robe], [sandals], [shawl], and [sleeves]. I gave some of the other ones to Trizpo if you desire those as well, oh great 'wizard'");
		e.self:Emote("laughs extremely loud");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer bring me a Cloud Jewel, Mark of Potency and a Book of Applied Magic.");
	elseif(e.message:findi("cap")) then
		e.self:Say("For the cap bring me a Meteor Jewel, Mark of Explosion, Explosive Dust and a Book of Wizardry.");
	elseif(e.message:findi("pants")) then
		e.self:Say("For the Pants bring me a Moon Jewel, Gilded Branch, Fiery Sand and Mark of Energy. ");
	elseif(e.message:findi("robe")) then
		e.self:Say("A great robe if you bring me an astral jewel, Mark of Sorcery, Book of Sorcery and Globe of Power.");
	elseif(e.message:findi("sandals")) then
		e.self:Say("I can give you a beautiful pair of sandals for a sky jewel, Mark of Intensity, and Sun Stained Steel Rod.");
	elseif(e.message:findi("shawl")) then
		e.self:Say("For the shawl bring me a Star Jewel, Mark of Force, and Tro Jeg Toes.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves bring me a Sun Jewel, Mark of Implosion, Grub Worm Guts and a Fiery Heart.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4724, item2 = 4491, item3 = 4723})) then
		e.self:Emote("smiles.");
		e.self:Say("This doesn't in any way make you a real wizard. Merely an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,3715,25000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4711, item2 = 4709, item3 = 4710, item4 = 4493})) then
		e.self:Emote("smiles.");
		e.self:Say("This doesn't in any way make you a real wizard. Merely an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,3710,25000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4720, item2 = 4719, item3 = 4718, item4 = 4489})) then
		e.self:Emote("smiles.");
		e.self:Say("This doesn't in any way make you a real wizard. Merely an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,3713,25000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4713, item3 = 4714, item4 = 4712})) then
		e.self:Emote("smiles.");
		e.self:Say("This doesn't in any way make you a real wizard. Merely an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,3711,25000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4725, item2 = 4492, item3 = 4726})) then
		e.self:Emote("smiles.");
		e.self:Say("This doesn't in any way make you a real wizard. Merely an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,3716,25000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4721, item2 = 4490, item3 = 4722})) then
		e.self:Emote("smiles.");
		e.self:Say("This doesn't in any way make you a real wizard. Merely an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,3714,25000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4717, item2 = 4716, item3 = 4715, item4 = 4488})) then
		e.self:Emote("smiles.");
		e.self:Say("This doesn't in any way make you a real wizard. Merely an apprentice.");
		e.other:QuestReward(e.self,0,0,0,0,3712,25000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
