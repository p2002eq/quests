function event_say(e)
	if(e.other:GetFaction(e.self) <= 5) then
		if(e.message:findi("hail")) then
			e.self:Emote("looks at you suspiciously. 'Yeah? Whacha want?'");
		elseif(e.message:findi("see stanos")  and  e.other:GetLevel() >= 46) then
			e.self:Say("This better be important.");
			eq.spawn2(5088,0,0,336,10,45,225);
		end
	else
		e.self:Say("Go away! We don't have time for the likes of you.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		eq.move_to(336,10,45);
	elseif(e.signal == 2) then
		e.self:Say("Vilnius has always had a good eye for talent. I think we can trust this one. But will he trust us? You have to wonder if he even knows [who we are]. . .");
		eq.signal(5088,1);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetLevel() >= 46 and e.other:GetFaction(e.self) <= 5) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28014})) then
			e.self:Say("Ah, we have been expecting this. Let me get Stanos, he will want to inspect it first, but here are your coins.");
			e.other:Faction(149,100,0);
			e.other:Faction(31,15,0);
			e.other:Faction(214,15,0);
			e.other:Faction(53,5,0);
			e.other:Faction(105,5,0);
			e.other:QuestReward(e.self,0,0,100,25,0,10000);
			eq.spawn2(5088,0,0,336,10,45,225);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
