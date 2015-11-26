function event_say(e)
	local qglobals = eq.get_qglobals();
	if (e.other:GetFaction(e.self <= 2)) then --Warmly or lower
		if(e.message:findi("hail")) then 
			e.self:Say("Another "..e.Race()..", in the great shrine? Perhaps the times have gotten worse than we had expected -- I wonder if I will need to reactivate my [sentinel] for further use in my stead.");
		elseif(e.message:findi("sentinel")) then
			e.self:Say("It was not too long ago that I was merely a chunk of walking velium in the eyes of most who traveled through the shrine. However that golem was in fact one of my sentinels used to keep my identity secluded, and took on the tasks that I gave it. However, there has been a problem recently with our supplies, and I have had to take it offline until further notice.");
		elseif(e.message:findi("problem")) then
			e.self:Say("As you may have noticed, there are a great deal of golems and gargoyles within the shrine that consist of velium. These are our guards and they serve us well, however with extended use of these creatures comes extensive repair needed. It is because of this necessity to keep our sentries and lookouts working well that we require a great deal of velium ore stocked and ready for use. Unfortunately, our supplies have been running thin and we are in need of a new shipment of ore.");
		elseif(e.message:findi("supplies")) then
			e.self:Say("I may have been wrong in my initial thoughts about your race, "..e.Race()..". You may just prove to be worth my time. Take this note now and find Ungdin. Please hurry and remember to keep this information to yourself.");
			e.other:SummonItem(1725);
		elseif(e.message:findi("i am interested")) and (qglobals["friendofthekin"] == "1") then
			e.self:Say("I'm glad to hear it. You see, we have received news that there is a spy amongst the kin, sending our movements and our defensive strategies to the giants. Every attempt of ours to decipher who the spy is have failed. It seems there is a great protective magic around them preventing us from centering on the source of the espionage. However, we do have a [source] of our own in the city of Kael who passes us information now and again.");
		elseif(e.message:findi("source")) and (qglobals["friendofthekin"] == "1") then
			e.self:Say("He is an associate that holds ties to us, for the fact that he believes that the invasion against the kin is a non-profitable, overall bad endeavor. Wenglawks is his name and he has told us that he has information regarding the name of the spy here in the shrine. His price is 100 platinum, paid in full to reveal the spy to us. If you think you're capable of finding out the name of this spy, I have a piece of parchment that will show Wenglawks that you are there for the information.");
		elseif(e.message:findi("i am capable")) and (qglobals["friendofthekin"] == "1") then
			e.self:Say("As I expected you would be. Take this note to Wenglawks and return to me when you have some -- any -- information on this spy among us.");
		end
	else
		e.self:Say("You must prove your worth before I will discuss such matters with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals();
	
	if(itemlib.check_turn_in(e.self, e.trade, {item1 = 29064})) then
		e.self:Say("You've returned, and with the shipment of ore intact! It was wise to send you out on that mission, "..e.other:GetName()..", and I'm glad you did not fail. If you're looking for more assignments to do, I may have something that is just right for you. If you're interested in it, just let me know and we'll talk.");
		e.other:QuestReward(e.self, 0, 0, 10, 10, 1727, 12500); --Bracer of Hammerfal
		e.other:Faction(362, 10); --Yelinak
		e.other:Faction(42, 10); --CoV
		e.other:Faction(189, -30); --Kromzek
		eq.set_global("friendofkin", "1", 0, "D30");
		
	end
	
	if(itemlib.check_turnin(e.self, e.trade, {item1 = 29065})) and (qglobals["friendofkin"] == "1") then
		e.self:Say("You have shown us yet again your loyalty to our people. Please accept this token of our gratitude.");
		e.other:QuestReward(e.self, 0, 0, 10, 10, 29050, 32500); --Dragon Tooth Choker
		e.other:Faction(362, 10); --Yelinak
		e.other:Faction(42, 10); --CoV
		e.other:Faction(189, -30); --Kromzek
		eq.delete_global("friendofkin");
	end
	
    item_lib.return_items(e.self, e.other, e.trade);
end

