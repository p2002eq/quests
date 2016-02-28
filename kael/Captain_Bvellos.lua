function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, "..e.other:GetName()..". I am the captain of the Kael militia. I will be watching those of your kind who have come to Kael Drakkel as mercenaries and bounty hunters. You may have come here to serve king Tormax but Kael is my home and I intend to keep it a safe place for the Kromzek. Keep yourself out of trouble or you will end up in a world of pain.");
	elseif(e.message:findi("work")) then
		e.self:Say("Are you looking for work, "..e.other:GetName().."? I may have a use for one of your kind. I believe that several nobles in this fine city are not all they appear to be. I have suspicions about that filthy Wenglawks. He will do whatever it takes to amass his own wealth. My sources tell me that he may very well be trading with the Coldain, or worse yet, the dragons. If you could find me proof of his underhanded dealings, I would be most pleased.");
	elseif(e.message:findi("proof")) then	
		e.self:Say("The more convincing the proof is, the better. There must be a record of his actions somewhere.");
	elseif(e.message:findi("keep safe")) then
		e.self:Say("With the influx of mercenaries into Kael Drakkel, I have seen minor crimes increase. I have had to increase my militia patrols. A majority of my militia work longer hours than they did before. There was a time when we only had to watch for the dragons from the sky and the Coldain from the outside. Now we must watch within");
	elseif(e.message:findi("mercenaries")) then
		e.self:Say("I have several bounties open if you are interested. Bring me the head of a Coldain and I will reward you with a small sum of money and spread the word of your good work. There is also a bounty upon the nefarious Icepaw kobolds who serve the outcast Velketor. I require four of the paws of those little beasts.");
	end
end

function event_trade(e)
local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30081})) then
		e.self:Say("Excellent, "..e.other:GetName()..". Here is the bounty as promised.");
		e.other:Faction(188, 10) --kromrif
		e.other:Faction(189, 40) --kromzek
		e.other:Faction(179, 10) --king tormax
		e.other:Faction(42, -20) --CoV
		e.other:QuestReward(e.self, 0,0,5,10,0, 10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 25301, item2 = 25301, item3 = 25301, item4 = 25301})) then
		e.self:Say("Excellent, "..e.other:GetName()..". Here is the bounty as promised.");
		e.other:Faction(188, 30) --kromrif
		e.other:Faction(189, 30) --kromzek
		e.other:Faction(179, 30) --king tormax
		e.other:Faction(42, -90) --CoV
		e.other:QuestReward(e.self, 0,0,5,10, eq.ChooseRandom(25077,25084) , 20000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1718})) then
		e.self:Say("This indeed points to Wenglawks being a traitor. If only there were more proof I could take this to the king. Thank you, "..e.other:GetName()..", you have done a great service for Kael. Take this mask as a reward for your service to this city.");
		e.other:Faction(188, 30) --kromrif
		e.other:Faction(189, 30) --kromzek
		e.other:Faction(179, 30) --king tormax
		e.other:Faction(42, -90) --CoV
		e.other:QuestReward(e.self, 0,0,5,10, 25024, 20000); --Mask of War
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
