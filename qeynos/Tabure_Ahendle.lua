function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What have we here?  Perhaps a future Ebon Strongbear?  A [member of the Steel Warriors]?  If the way of the warrior is not to your liking, might I suggest joining the League of Antonican Bards?  The only damage you might take there is a sore throat! HAHAHA!");
	elseif(e.message:findi("steel warrior")) then
		e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
	elseif(e.message:findi("dangerous task")) then
		e.self:Say("A ship sank while returning from Odus. On this ship was my squire, Tombor. He sank to the bottom and there he still lies. With him went a map. I would very much like you to search for this sunken ship. Return the map to me. I am sure it is still in the rotting hands of Tombor.");
	elseif(e.message:findi("assist")) then
		e.self:Say("So, you think you be of assistance to me? Let me test your skill. Travel to Erudin and seek out the beasts which are called Kobolds. I have never seen one and would very much like to have four Kobold Hides with which to make a rug. To do so would earn you some barely used rawhide armor - maybe even a shield.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13423})) then
		e.self:Say("The map!! It is all blurred. The ink has run. I shall never be able to decipher it now. Still, I owe you for completion of your mission. May these be of assistance. It is always good for a warrior to be well supplied.");
		e.other:SummonItem(5082);
		e.other:Ding();
		e.other:Faction(135,1,0);
		e.other:Faction(184,1,0);
		e.other:Faction(311,1,0);
		e.other:Faction(53,-5,0);
		e.other:Faction(105,-5,0);
		e.other:AddEXP(500);
		e.other:GiveCash(0,3,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13424, item2 =13424, item3 = 13424,item4 = 13424})) then
		e.self:Say("Incredible!! Such grand tones. It shall make a fine rug. You have shown me that you cannot always judge a book by its cover. You are quite skilled. Would you like to perform a [dangerous task] for me?");
		e.other:SummonItem(eq.ChooseRandom(2140,2147));
		e.other:Ding();
		e.other:Faction(135,1,0);
		e.other:Faction(184,1,0);
		e.other:Faction(311,1,0);
		e.other:Faction(53,-5,0);
		e.other:Faction(105,-5,0);
		e.other:AddEXP(500);
		e.other:GiveCash(0,4,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1098 -- Tabure_Ahendle