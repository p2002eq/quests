function event_say(e)
	if(e.other:GetFaction(e.self) <= 3) then --Warmly or better
		if(e.message:findi("hail")) then
			e.self:Say("Welcome to the castle of King Tormax. It is quite an accomplishment for one of your kind to have lived this long in the service of our great King Tormax. You must be powerful indeed. My power is like a storm - I may rage and destroy my foes with great fury.");
		elseif(e.message:findi("foes")) then
			e.self:Say("The dragons are the greatest threat to Kael Drakkel. For some reason they believe that this land we inhabit is holy and should not be tread upon. I cannot count the number of wurms I have beaten back from the gates of Kael Drakkel in the past. We giants will live on, though, for each year their numbers thin and ours only grow. With the help of mercenaries such as yourself we may be able to eradicate them from the face of Velious.");
		elseif(e.message:findi("eradicate")) then
			e.self:Say("I dream of the day when the only dragons in Velious are the ones whose skins line my boots. Some day my dream will come true. Until the day I can gather a force powerful enough to assault their homes, I will slay whatever foul beasts tread near Kael Drakkel.");
		elseif(e.message:findi("assault")) then	
			e.self:Say("That is an aspiration of King Tormax. One day, it may be possible for us to do so. Encountering so many dragons at once may very well be suicide though. Enough of my banter about dragons. What is it that brings you to Dragon Death Keep? Do you seek more challenging tasks?");
		elseif(e.message:findi("challenging task")) then		
			e.self:Say("If you are as mighty as I believe you to be, travel out from this city and fight off the draconian menace. For the head of an elder dragon you will be handsomely rewarded.");
		elseif(e.message:findi("reward")) then
			e.self:Emote("pats the huge axe at his side and drapes his shimmering cloak over his shoulders.");
		elseif(e.message:findi("axe")) then	
			e.self:Say("My axe is named Frostbringer. It was given to me by the great King Tormax for my service to him. Serving the king can be quite advantageous.");
		elseif(e.message:findi("cloak")) then
			e.self:Say("The cloak of the Maelstrom allows me to rage like a great storm. It is but a simple possession - the head of an elder dragon would be worth far more to my kind.");
		end
	else
		e.self:Say("Your loyalty to our ideals has yet to be proven.");
	end
end

function event_trade(e)

local item_lib = require('items');
	if(e.other:GetFaction(e.self) <= 3) then --Warmly or better
		if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25119})) then
			e.self:Say("The bards will sing of your greatness, "..e.other:GetName()..". Rage on like the Maelstrom when you wear this cloak. You have done a great service for the city of Kael Drakkel, and we Kromzek do not soon forget great deeds.");
			e.other:SummonItem(25023);
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 =  25118})) then
			e.self:Say("We shall hang this head from the halls of Dragondeath Keep and sing your praises, "..e.other:GetName()..". Take my axe as a reward for your great deeds. You are a true hero for Kael Drakkel!");
			e.other:SummonItem(25022);
		end
    else
	    item_lib.return_items(e.self, e.other, e.trade)	
	end

	item_lib.return_items(e.self, e.other, e.trade)	
end
