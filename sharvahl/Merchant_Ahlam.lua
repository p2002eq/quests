--Art of Vah Shir Brewing
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ". would you care for a drink?  Or perhaps you're the one they sent to help me?  If you've come to help please show me your acrylia slate.");
	elseif(e.message:findi("interested")) then
		e.self:Say("Is that so? I suppose I would be willing to teach you a few things about brewing, but you'll have to show me one of my seals before I begin your instruction.");
	elseif(e.message:findi("purify water")) then
		e.self:Say("Take a bottle to Gamali in Hollowshade Moor. You'll find her somewhere around the Grimling fishing huts if I had to guess. She'll fill the bottle with water for you. Take this water and combine it with the Acrylia sand purifer. That will yield the purest water you ever did drink.");
	elseif(e.message:findi("gravel leaf tea")) then
		e.self:Say("To make the tea you'll need a flask of crystal clear water and some gravel pit leaves. Boil the water in a brew barrel and add the leaves when it's hot. That makes for the strongest dose of the sedative qualities of the tea.");
		e.other:SummonItem(17099);
	elseif(e.message:findi("hollow palm tea")) then
		e.self:Say("You'll need some Crystal water, just as you do with all of our teas, and some Hollow palm roots. You can find Hollow palms out in the moors, watch out for the grimlings though. Once you find the roots just use the strainer to control the flow of water over the leaves. If you do it correctly you'll create a very potent brew. When you get it right bring the strainer back to me with a sample of your work.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 2877})) then
		e.self:Say("Ah good I was hoping you'd be along soon. I need you to collect some Gravel tea leaves from below the city. I need these leaves to make some tea for the guards under the arena. I need 10 of these leaves to brew enough tea for the guards. Take this pouch and fill it with leaves and return it to me.");
		e.other:QuestReward(e.self,0,0,0,0,17098);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 31764})) then
		e.self:Say("Many thanks " .. e.other:GetName() .. ", I'll be going to brew this tea up for the guards now. Take this seal as proof of your helping me. You wouldn't happen to know anyone who would be [interested] in learning the art of Vah Shir Brewing would you? I could really use the help in these hard times, I can barely keep up with all the demand.");
		e.other:QuestReward(e.self,0,0,0,0,31774);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 31774})) then
		e.self:Say("Well done, it is now time to start down the path of learning the art of Vah Shir brewing. You'll need a steady hand if you are to master the brew barrel. The first thing you'll need to learn is how to purify the water we use for all our finest brews. Take this Acrylia filter and use it to [purify water]. Bring me 4 flasks of crystal clear water and I'll teach you how to make the tea from the gravel tea leaves.");
		e.other:QuestReward(e.self,0,0,0,0,31760);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 31762, item2 = 31762, item3 = 31762, item4 = 31762})) then
		e.self:Say("Very good " .. e.other:GetName() .. ", this water is perfect for making Gravel leaf tea. I've just received a message from Guard Jabbar under the arena needs a shipment of [Gravel leaf tea] to help sedate the prisoners. Fill a crate with bottles of Gravel leaf tea and take it to Guard Jabbar.");
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 31775})) then
		e.self:Say("Very good " .. e.other:GetName() .. ", the guards had been waiting for that tea all day. I think you're ready to move on to something a bit more challenging now. Take this strainer, it will allow you to create some very potent brews from some of the more rare herbs to be found near the city. You'll want to start by making some [Hollow palm tea] to get used to how the strainer works.");
		e.other:QuestReward(e.self,0,0,0,0,31768);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 31769, item2 = 31768})) then
		e.self:Emote("sips the tea. A bit of a glazed look comes across his face.");
		e.self:Say("Mmmmm, I do so love Hollow palm tea. This is a bit mild for Hollow palm tea though, you might want to try adding some spices next time for a bit more flavor. Here's your strainer back, I etched some runes into that should add to the potency of your brews. I hear the grimlings make a very potent sort of tea from the grimroot out in the forest, but the thought of drinking anything made from grimroot makes my stomach churn. At any rate, tinker a bit with that strainer and don't be afraid of trying some new brews with it. If you create anything interesting that you think I might like bring it to me so I can taste it.");
		e.other:QuestReward(e.self,0,0,0,0,31771);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 31772})) then
		e.self:Say("Great job, here is my seal of approval.  Hand that back in along with your stainer for an upgrade.");
		e.other:QuestReward(e.self,0,0,0,0,31776);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 31776, item2 = 31771})) then
		e.self:Say("Here is the Acrylia Handled Strainer.  Use it with regular water to replace the crystal clear water.");
		e.other:QuestReward(e.self,0,0,0,0,31777);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
