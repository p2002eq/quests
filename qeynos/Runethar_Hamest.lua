function event_signal(e)
	e.self:Say("Hire one soon, Wolten. We need to get in touch with Drosco!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Temple of Thunder. We are home to paladins and clerics who follow the ways of Karana. Do you [need guidance] or are you [already a follower of Karana]?"); 
	elseif(e.message:findi("need guidance")) then
		e.self:Say("Then go forth into the church and speak with Gehna Solbenya. She will assist you."); 
	elseif(e.message:findi("follower of karana")) then
		e.self:Say("So you are one with our cause? This is good. Be aware that there are forces at work which not even the Qeynos Guard can keep at bay. We are here to spread the words of Karana and smite those who should try to end His children. We and Antonius Bayle shall work together in our destruction of evil. He requests our aid. Do you also [wish to assist Lord Bayle]?"); 
	elseif(e.message:findi("wish to assist")) then
		e.self:Say("Then we command you to assist the Qeynos Guard with the destruction of Blackburrow. Report to Captain Tillin of Qeynos Guard and speak with him of the [gnolls of Blackburrow]. I believe he is at the arena. My loyal friend, if you have earned your Thunder Staff, I urge you to [retrieve the Bayle list]."); 
	elseif(e.message:findi("will retrieve")) then
		e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause"); 
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18710})) then
		e.self:Say("Greetings, fellow knight of Karana, and welcome to the Temple of Thunder! Here, wear this tunic and help our crusade. Wolten Grafe is my assistant, he will get you started and teach you the ways of the Rainkeeper.");
		e.other:SummonItem(13505); -- Old Gray Tunic*
		e.other:Ding();
		e.other:Faction(183,100,0);
		e.other:Faction(21,-100,0);
		e.other:Faction(257,75,0);
		e.other:Faction(135,75,0);
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18809,item2 = 6357})) then
		e.self:Say("Antonius Bayle will be pleased. The Temple is also pleased. Here is the enchanted staff we call Bonethunder. Should you find the enchantment gone, just ask Kasine to [enchant Bonethunder]. We need more disciples like you! Go forth to tell the world of the Rainkeeper.");
		e.other:Faction(183,10,0);
		e.other:Faction(21,-10,0);
		e.other:Faction(257,7,0);
		e.other:Faction(135,7,0);
		e.other:QuestReward(e.self,0,0,0,0,6358,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1136 -- Runethar_Hamest 

