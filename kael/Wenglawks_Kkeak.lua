function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Greetings, $name, I have heard of you. My name is Wenglawks Kkeak. Welcome to my humble home. My sources tell me you are a [mercenary]. Is this true?");
	elseif (e.message:findi("mercenary")) then	
		e.self:Say("Well then, I suppose you might be [looking] for work. Are you?");
	elseif (e.message:findi("looking")) then	
		e.self:Say("I have been looking for a few good people to deliver goods for me. I have several [deliveries] to clients which must be made soon. My last delivery person ended up dead, unfortunately.");
	elseif (e.message:findi("deliveries")) then	
		e.self:Say("I have three clients whose orders must be taken care of. These will not be simple deliveries. I want you not only to deliver the items but to assist them if they need help using their packages. Do you wish to hear of the first task I have for you?");
	elseif (e.message:findi("first task")) then	
		e.self:Say("One of my clients lives on the shores of the Iceclad Ocean. His name is Sojan. Supposedly he is some kind of pirate from the other lands. However, I could not care less what he calls himself. He paid me well to acquire him a set of Coldain tools and they were not easy to come by. Are you willing to take this [package] to Sonjan?");
	elseif (e.message:findi("package")) then	
		e.self:Say("Wonderful, $name. Take this note to Kellek and he will give you the tools.");
		e.other:SummonItem(25279);
	elseif (e.message:findi("undertake")) then			
		e.self:Say("In the great divide there is a small outpost of kromrif. In that outpost you will find Bekerak, my client. I have acquired this new hunting spear for him and he may wish to test it out. Because of one simple mistake, once in my past, he thinks all of my wares are shoddy. I need the payment for the transaction still so don't let him get away without giving it to you. Take this voucher to Kellek and he will give you the spear.");
		e.other:SummonItem(25280);
	elseif (e.message:findi("third client")) then	
		e.self:Say("Are you sure you will be up to this journey? It will take a hardened person to survive the trip. Let alone find my client. Do you really [want to go] out into the dangerous lands in the west?");
	elseif (e.message:findi("want to go")) then	
		e.self:Say("I'm not sure if I can [trust] you with this. If you die on the trip, I will be losing profit! The other deliveries were much simpler, I remind you. Can I really [trust] you as far as I can throw you? Wait, that's a bad example - I could probably throw you quite far.");
	elseif (e.message:findi("trust")) then	
		e.self:Say("I will curse your immortal soul if you fail, $name. In the depths of the icy waters of the cobalt scar lives an outcast siren who preys upon her own kind. We have a deal, I will provide her with an excellent hunting net and she will provide me with a giant cloak made of the scales of her kind. Take this voucher to Kellek and deliver the net. Do whatever it takes to get my cloak.");
		e.other:SummonItem(25281); 
	end

end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 28600, platinum = 200})) then
		e.self:Say("Here is the information your employer requested. Now be gone. I have more business to take care of.");
		e.other:SummonItem(28601);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  20474})) then	
		e.self:Say("I assume the delivery went well? You can have these as payment. One of my customers just decided he does not wish to buy them. They are rather sturdy! I do have another task available if you wish to [undertake] it.");
		e.other:AddEXP(1000);
		e.other:SummonItem(25062); 	
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25130})) then	
		e.self:Say("He has reconsidered the offer, you say? This is most excellent! I hope this will be acceptable payment for your troubles, $name. My cash situation is not the best at this point in time. I do have a [third client] who needs delivery...");
		e.other:AddEXP(1500);
		e.other:SummonItem(25061);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  25110})) then	
		e.self:Say("It is truly a sight to behold. This is the most fashionable cloak I have yet to see. Even King Tormax will be green with envy. This old bag has served me well, I hope you find it to your liking.");
		e.other:AddEXP(2000);
		e.other:SummonItem(17049);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  29068, platinum = 100})) then	
		e.self:Say("Here is the information your employer requested. Now be gone. I have more business to take care of.");
		e.other:SummonItem(29626);
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 1722})) then	
		e.other:QuestReward(e.self,0,0,0,0, 1719, 2000);
		e.other:SummonItem(1723);
	end

	item_lib.return_items(e.self, e.other, e.trade);
	
end
