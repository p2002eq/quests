-- Coldain Ring: Quest 2

local route_end = false;

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Hello stranger, I am Boridain, master hunter of the Coldain. Glad to meet you.");
	end
end

function event_trade(e)
    local item_lib = require('items');
	
    if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30265})) then -- Axe
		e.self:Say("Say! This looks just like the axe my uncle uses. With this I can kill the beast for sure! Now please, be very quiet, I must track my prey. I won't return to Thurgadin without the hide of the rabid tundra kodiak!")
        e.other:QuestReward(e.self,0,0,0,0,0,1000);
		e.self:SetRunning(true);
		eq.start(370);
	elseif route_end and item_lib.check_turn_in(e.self, e.trade, {item1 = 30266}) then -- Kodiak hide
		e.self:Say("Yes! I've done it! The vile beast is finally dead. I will at last be revered as the mighty hunter I am. Here is your axe back, I broke it on the killing blow. Take it as proof that you are a friend of the greatest hunter in the history of the Coldain!");
		e.other:QuestReward(e.self,0,0,0,0,30267,1000);
		eq.depop_with_timer();
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_waypoint_arrive(e)

	if(e.wp == 7) then
		e.self:Say("Boy, all this hunting sure does make ya hungry! Time for a snack.");
		e.self:SetAppearance(1);
	elseif(e.wp == 13) then
		e.self:Emote("yawns.");
		e.self:Say("All this tracking is makin me mighty sleepy. Time for a little nap. You keep a lookout.");
		e.self:SetAppearance(3);
	elseif(e.wp == 18) then
		route_end = true;
		e.self:Say("Who am I kidding, I'm no hunter. I'll never be a hunter. I may as well give up and become a miner like dad.");
		e.self:SetAppearance(1);
		eq.spawn2(116597, 371, 0, 1559, -2304, 313, 125.5);
	end
end

function event_waypoint_depart(e)

	if(e.wp == 3) then
		e.self:Say("Hmmm, fresh prints. They're HUGE! This must be it! This hunting stuff is easier than I thought.");
	elseif(e.wp == 5) then
		e.self:Say("Hmm, that wasn't him. Let's see now, if I were a rabid tundra beast where would I go? This way!");
	elseif(e.wp == 7) then
		e.self:SetAppearance(0);
		e.self:Say("Ahh, that's better. Back to the hunt... I think I hear something over yonder. Stay low.");
	elseif(e.wp == 10) then
		e.self:Say("Where did that vile beast go now? Wait, what's that over there? Could it be? Only one way to find out!");
	elseif(e.wp == 13) then
		e.self:SetAppearance(0);
		e.self:Emote("stretches.");
		e.self:Say("Ahh, refreshing! Back to work... I think I smell the beast! This way.");
	elseif(e.wp == 16) then
		e.self:Say("I just don't get it. I thought that was him for sure. I don't see any sign of him now.");
	end
end

function event_combat(e)

	if e.joined then
		e.self:SetAppearance(0);
	end

end
