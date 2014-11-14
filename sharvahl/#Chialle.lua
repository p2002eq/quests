function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there traveler. Please take a moment to look at my goods. I have delicious meals perfect for traveling conditions.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 30625, item2 = 30625, item3 = 30625, item4 = 30625})) then
		e.self:Say("Oh wow! This is just what I was hoping for. Thank you so much! You must be a real good friend to Saren to have her make you these, she never makes freshly squeezed nectar unless she really likes someone. You have a kind heart Khatzhana. Please take this with you as a token of my friendship.");
		e.other:Faction(132,20);
		e.other:QuestReward(e.self,0,0,0,0,30609,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		eq.set_timer("1",120000);
		e.self:MerchantOpenShop();
	elseif(e.wp == 2) then
		eq.stop_timer("1");
		e.self:Say("Whew! I sure could use something sweet to drink.");
		e.self:MerchantCloseShop();
	elseif(e.wp == 13) then
		e.self:Emote("makes a deposit.");
	end
end

function event_timer(e)
	local rand = math.random(6);
	if(rand == 1) then
		e.self:Say("Weary traveler, please come have a look at my foods. My almonds make for a great traveling snack.");
	end
	if(rand == 2) then
		e.self:Say("Welcome to Shar Vahl! Please come look at my goods. Try my Shawerma sandwiches. I'll give you a good deal.");
	end
	if(rand == 3) then
		e.self:Say("Come have a look at my goods. I have lots of delicious food that travels well.");
	end
	if(rand == 4) then
		e.self:Say("Hold friend! Come see what I have to offer. Salted fish! Fresh Almonds! Delicious sandwiches!");
	end
	if(rand == 5) then
		e.self:Say("Hey there, don't be shy! Come over here and have a look at what I have for sale.");
	end
	if(rand == 6) then
		e.self:Say("Don't let yourself go hungry brave adventurer. My food is fairly priced, come see for yourself.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
