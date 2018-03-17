-- Sentry Kale in Skyshrine for Hammerfal and Dragon Tooth Choker

function event_spawn(e) -- sets which quest he starts. Currently set to hand out both rewards at all times, which is consistent with Alla posts from the era
	friendofthekin = false
end

function event_say(e)
	if (e.other:GetFaction(e.self) <= 2) then -- Warmly or lower
		if(e.message:findi("hail") and friendofthekin) then
			e.self:Say("Ah, outsiders, I have heard word of your travel here.  Perhaps you wish to become a [" .. eq.say_link("friend of the kin") .. "]?");
		elseif(e.message:findi("friend of the kin") and friendofthekin) then
			e.self:Say("Good, then you would not mind assisting us with a matter of grave importance. We have received news of an alarming sort. There walks amongst us a spy of the storm giants, who feeds our every move to them and their accursed strategist. For the life of us, we cannot deduce whom the traitor is, however we have received word from Wenglawks of Kael, an associate of ours, that he has information concerning this. For a measly sum of 100 platinum, he has offered to give us the information to rid ourselves of this traitor. If you are indeed friend to the kin, take this note to Wenglawks and rid us of this traitor. ");
			e.other:SummonItem(29068); -- Note to Wenglawks
		elseif(e.message:findi("hail")) then 
			e.self:Say("Another "..e.other:Race()..", in the great shrine? Perhaps the times have gotten worse than we had expected -- I wonder if I will need to reactivate my [" .. eq.say_link("sentinel") .. "] for further use in my stead.");
		elseif(e.message:findi("sentinel")) then
			e.self:Say("It was not too long ago that I was merely a chunk of walking velium in the eyes of most who traveled through the shrine. However that golem was in fact one of my sentinels used to keep my identity secluded, and took on the tasks that I gave it. However, there has been a [" .. eq.say_link("problem") .. "] recently with our supplies, and I have had to take it offline until further notice.");
		elseif(e.message:findi("problem")) then
			e.self:Say("As you may have noticed, there are a great deal of golems and gargoyles within the shrine that consist of velium. These are our guards and they serve us well, however with extended use of these creatures comes extensive repair needed. It is because of this necessity to keep our sentries and lookouts working well that we require a great deal of velium ore stocked and ready for use. Unfortunately, our [" .. eq.say_link("supplies") .. "] have been running thin and we are in need of a new shipment of ore.");
		elseif(e.message:findi("supplies")) then
			e.self:Say("I may have been wrong in my initial thoughts about your race, "..e.other:Race()..". You may just prove to be worth my time. Take this note now and find Ungdin. Please hurry and remember to keep this information to yourself.");
			e.other:SummonItem(1725); -- Velium Delivery Note
		end
	else
		e.self:Say("You must prove your worth before I will discuss such matters with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 3) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29064})) then -- A shipment of Velium Ore
			e.self:Say("You've returned, and with the shipment of ore intact! It was wise to send you out on that mission, "..e.other:GetName()..", and I'm glad you did not fail. If you're looking for more assignments to do, I may have something that is just right for you. If you're interested in it, just let me know and we'll talk.");
			e.other:Faction(362, 10); --Yelinak
			e.other:Faction(42, 10); --CoV
			e.other:Faction(189, -30); --Kromzek
			friendofthekin = true;
			local reward = 0;
			if math.random(10) > 5 then reward = 1727 end
			e.other:QuestReward(e.self, math.random(10),math.random(10),math.random(10),math.random(10), reward, 12500); -- Bracer of Hammerfal
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29065})) then -- a spy report
			e.self:Say("You have shown us yet again your loyalty to our people. Please accept this token of our gratitude.");
			e.other:Faction(362, 10); --Yelinak
			e.other:Faction(42, 10); --CoV
			e.other:Faction(189, -30); --Kromzek
			e.other:SummonItem(29050, 4); -- Dragon Tooth Choker (summoning outside QuestReward to set charges correctly)
			e.other:QuestReward(e.self, math.random(10),math.random(10),math.random(10),math.random(10), 0, 32500);
		end
	end
    item_lib.return_items(e.self, e.other, e.trade);
end
