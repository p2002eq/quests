--Brain Bite (The Overthere)
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("appears to be the local master of wizardry. His garb clearly comes from the dark city of Neriak as it bears a black sun emblem.");
		e.self:Say("Speak!! I am dispatched from Neriak to this land by order of the king. I shall research [" .. eq.say_link("new spells") .. "] and aid the adventuring wizards. My knowledge of wizardry is offered to all in hopes of gaining information about Kunark.");
	elseif(e.message:findi("new spells")) then
		e.self:Say("Within this lost land could lie the knowledge of extinct civilizations. I am ordered to seek out this knowledge for the empire of Neriak. So far, all I have discovered is a way to create a spell of my own design. I call it [" .. eq.say_link("Brain Bite") .. "].");
	elseif(e.message:findi("brain bite")) then
		e.self:Say("If you wish to own a copy of MY spell, Brain Bite, I would be glad to give you one. All I ask is that you [" .. eq.say_link("gather a few souls") .. "] for me.");
	elseif(e.message:findi("gather a few souls")) then
		e.self:Emote("reveals three ornate bottles.");
		e.self:Say("While I finished my research on Brain Bite, I encountered three [" .. eq.say_link("interlopers") .. "] who wished to steal my spell. I had the dragoon garrison track them down and dispatch them. Unfortunately, I forgot to instruct them to trap their souls with these bottles. Do you want to [" .. eq.say_link("take the bottles") .. "] and finish the job?");
	elseif(e.message:findi("interlopers")) then
		e.self:Say("The garrison report was sloppy, to say the least. They informed me that Hampton was slain near some ruins within a jungle infested by raptors. Mardon was slain in an ancient city found deep in a jungle. Ryla was killed in a hidden fortress guarded by fierce armored wolves who walked on their hind legs.");
	elseif(e.message:findi("take the bottles")) then
		e.self:Say("The bottles also require a gem. You will fetch me the three gems and I will prepare the bottles and give them to you to finish the job. I need an onyx, a peridot and a star rose quartz.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10027, item2 = 10028, item3 = 10021})) then--Onyx, Peridot, Star Rose Quartz
		e.self:Say("This bottle is for the one called Hampton. If you look well, you can see his name.");
		e.self:Say("This bottle is for Mardon. You may be able to identify his name upon it.");
		e.self:Say("Identify this when the time comes. It is Ryla's prison.");
		e.other:SummonItem(12962);-- Ornate Bottle, Hampton
		e.other:SummonItem(12963);-- Ornate Bottle, Mardon
		e.other:QuestReward(e.self,0,0,0,0,12964);-- Ornate Bottle, Ryla
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12965, item2 = 12966, item3 = 12967})) then-- Bottle of Swirling Smoke (Hampton), Bottle of Swirling Smoke (Mardon), Bottle of Swirling Smoke (Ryla)
		e.self:Emote("empties the bottle's smoke into a very large glass urn filled with similar swirling smoke. You think you hear the cries of a thousand tortured souls. He then closes the urn and hands you a scroll.");
		e.self:Say("Here is your reward. It will blast a foe's brain and hopefully, they may forget their hatred.");
		e.other:Faction(353, 30);--Add some Venril Sathir faction
		e.other:QuestReward(e.self,0,0,0,0,12968,3322176);--Scroll of Brain Bite--3% level 45 xp,
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
