function event_say(e)
	if(e.message:findi("hail")) then	
		e.self:Say("Hail to ye as well offlander. I bid you welcome to the Icy Mug, one o' the finest establishments for a drink in Thurgadin. Whether it's [souvenirs] or stories yer lookin for, you've come to the right place.")	
	elseif(e.message:findi("souvenirs")) then	
		e.self:Say("Here at the Icy Mug we have our own signature stein fer yer drinkin pleasure. For only 5 gold pieces ye can take one home to show yer kinfolk.");
	end	
end

function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {gold = 5})) then
		e.other:SummonItem(30145);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	
	if (e.signal == 1) then	
		e.self:Say("What's the rush there, youngster?");
		eq.signal(115019,1);
	elseif (e.signal == 2) then
		e.self:Say("That's not good, the Grand Historian's mighty protective of his daughter. What he do after he caught ya?");
		eq.signal(115019,2);
	elseif (e.signal == 3) then	
		eq.signal(115019,3);
	elseif (e.signal == 4) then
		e.self:Say("Well, coulda been worse. A month's worth of sermons is a far sight better than a trip to the bottom of the Dain's well.");
		eq.signal(115019,4);
	elseif (e.signal == 5) then
		e.self:Say("Here ya go, Ronodun, on the house this time. Drink fast, don't need the Grand Historian to come lookin' fer ya...");
		eq.signal(115019,5);
	elseif (e.signal == 6) then
		e.self:Say("My pleasure, son. You just remember to keep me in all those prayers you'll be sayin this month. Hahhahah!");
	end
end
