function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail friend, are you a new recruit or have you been at it for a bit?");
	elseif(e.message:findi("i am a new recruit")) then
		e.self:Say("Well... perhaps you should head to the combat training grounds and pick up a few pointers.  Walk west along the ledge that runs just outside of the city's walls and you shouldn't be able to miss it.");
	elseif(e.message:findi("i have been at it for a bit")) then
		e.self:Say("Good good... keep at it!  We need all of the strong willed thick headed Khala Dun we can muster!  Now, get back to the fight!");
	elseif(e.message:findi("ore")) then
		e.self:Say("The ore that I require is often used to create living rock formations. These collections of rocks and boulders will often leave a trail of energy that causes other rocks to collect and come to life. Our scouts have seen these formations in a variety of areas. Take care when you attempt to gather this ore.");
	elseif(e.message:findi("void")) then
		e.self:Say("If you look in the Maiden's Eye, you will find entities that are the embodiment of darkness. Their twisted spirits are not allowed to escape the form that they inhabit. They have no hope of escape, unless they are released during the destruction of their material form. There are some occasions when the power that is used to keep them in this realm will turn upon itself during this period of destruction. This process is what produces the Gems of the Void.");
	elseif(e.message:findi("padding")) then
		e.self:Say("When traversing the Deep, you will run across a shrieking fungus. Those creatures are much more durable and dangerous than the other fungi that you may encounter in the caverns of Luclin. It is for this reason that we use their flesh as padding. Take care when hunting them, for they will provide a good challenge.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9050})) then
		e.self:Say("You are just the time. The weapon that Elder Dumul requested has almost been completed. We need you to gather a few items in order to complete the weapon. These items will not require much effort to acquire, but I will need to tell you where to look. Place all of the items that I request in this box and return it to me as quickly as possible.");
		e.self:Say("Now, seek out a large chunk of perfect acrylia [ore], two Gems of the [Void], and chunk of dense fungal [padding]. Once I have those items, I can finish the weapon that you will need to use to kill the dark animist.");
		e.other:QuestReward(e.self,0,0,0,0,17363);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 9051})) then
		e.self:Say("These claws should work well for you. The design was research by Historian Qua. They should work to neutralize the magical field that protects the dark animist and allow you to tear his scaly flesh from his frame. Remember that all of this is theoretical. Those claws are an original creation. You will be the first to prove their effectiveness in combat.");
		e.self:Say("Take the claws back to Animist Dumul and show him their design. Use them well, " .. e.other:GetName() .. ". May the spirits guide you in your attack. ");
		e.other:SummonItem(9056);
		e.other:QuestReward(e.self,0,0,0,0,9055);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
