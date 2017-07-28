function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("What brings you to the hall of the frost giants, little one? Have you come to [" .. eq.say_link("serve") .. "] our lord and master? Or are you simply a scout for a raiding party? I warn you, do not make war on my kin. I will twist the elements to my will and destroy you if that is your intent.");
	elseif (e.message:findi("serve")) then	
		e.self:Say("You could best serve the masters by serving me. The more time I have to tend to my research the better. I have several [" .. eq.say_link("minor tasks") .. "] which you could easily handle...");
	elseif (e.message:findi("minor task")) then	
		e.self:Say("In the wreched jungle to the west there lives a race of faries protected by Tunare and her other minions. These abominations are called the Sifaye. I belive that the strength of the Wakening lands is linked not only to Tunare herself, but her connection with these foul beasts. Bring me the wings of one of their so called knights and the heads of three commoners and I will reward you for such busy work.");
	end
end

function event_trade(e)

	local item_lib = require('items');

	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25112, item2 = 25113})) then
		e.self:Say("You are starting to prove yourself here is a small token for your work");
		e.other:SummonItem(25056);
	end

	item_lib.return_items(e.self, e.other, e.trade);		

end
