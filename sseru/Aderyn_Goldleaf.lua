 -- Jeweled Quiver of the Hand

function event_say(e)
	if e.message:findi('hail') then
		e.self:Say(string.format("Greetings, %s. I am a Ranger of Seru. There are not many that follow our ways within the city, as there is only limited need for us. Tracking is an invaluable tool at times though so our ways continue to be passed on. There is no way that [" .. eq.say_link("Katta") .. "] Castellium can match our tracking skills. What are you look... ah, I see you are eyeing my quiver. It is the Jeweled Quiver of the Hand. It is given to each ranger that is in the Hand's Ranks. ", e.other:GetName()));
	elseif e.message:findi('katta') then
		e.self:Say("Katta Castellium is a dreary place. To show how vile it is, they have vampyres living within the city! My point though, is that they would easily spot one of us entering their city. You are just right. They would not question one from Norrath. If you with to prove your worth and earn your own Quiver go to Katta. Galren Fuzzytoes is know to us to be a spy, but we can never catch him. Surely it will be easier to find him within his own city. Defeat him, and retrieve any report that he is taking back to their Governors.");
	end
end

function event_trade(e)
	local item_lib=require("items");
	if (item_lib.check_turn_in(e.self, e.trade, { item1 = 29892 })) then -- Confidential Report
		e.self:Say(string.format("You actually did it? You have done an invaluable service ridding us of that wretched little halfing. You deserve to be a soldier in Seru's army. Take this Quiver with my regard, %s.", e.other:GetName()));
		e.other:SummonItem(17120); -- Jeweled Quiver of the Hand
		e.other:Faction(96,10); -- eye of seru
		e.other:Faction(139,10); -- hand of seru
		e.other:Faction(142,10); -- heart of seru
		e.other:Faction(284,10); -- seru
		e.other:Faction(141,-30); -- haven smugglers
		e.other:Faction(350,-30); -- validus custodus
		e.other:Faction(206,-30); -- magus conlegium
	end
	item_lib.return_items(e.self, e.other, e.trade);
end