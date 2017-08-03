function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Hey Pelshia, how's business?");
		eq.signal(2073,1);
	elseif(e.wp == 7) then
		e.self:Say("And what about you, gorgeous? Looking as delightful as ever, I must say.");
	elseif(e.wp == 18) then
		e.self:Say("So, yeah, that Pelshia, she's all over me. And Renux, too. She was giving me the look, man. I'm telling ya. Zan, all the ladies want a piece of the Knargman.");
		eq.signal(2085,1);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("How about you and I go take a stroll under the docks tonight?");
		eq.signal(2073,2);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey..  What's up? My name's Knargon Lanenda. I just came over here from [" .. eq.say_link("Freeport") .. "] a couple of months ago. I used to run a big business importing goods from [" .. eq.say_link("Faydwer") .. "]. If you've been to [" .. eq.say_link("Freeport") .. "]. I'm sure you've heard of me.");
	elseif(e.message:findi("freeport") or e.message:findi("faydwer") or e.message:findi("highpass")) then
		e.self:Say("It's a long way from here. . .which is a good thing for me.");
	elseif(e.message:findi("jracol")) then
		e.self:Say("I don't know why [" .. eq.say_link("Carson") .. "] likes that guy ... he's certainly been nothing but trouble for me.");
	elseif(e.message:findi("carson")) then
		e.self:Say("Carson McCabe? He runs that sham of a fortress called [" .. eq.say_link("Highpass Hold") .. "]. We've been dealing with him for a few years, now. But, lately he seems to be losing control of his business. [" .. eq.say_link("Hanns") .. "] will whip him into shape pretty soon though, I bet.");
	elseif(e.message:findi("Hanns")) then
		e.self:Say("He is genuinely dangerous. If you think otherwise, you won't be thinking for long.");
	elseif(e.message:findi("shipment")) then
		e.self:Say("We have a small shipment of goods coming in later tonight. The [" .. eq.say_link("courier") .. "] will be waiting outside the city gates. Casually tell the courier [Lovely night for a stroll], and give him this old card as proof that you work for us. Make certain that you are not followed, and return the shipment to me.");
		e.other:SummonItem(13903); -- Bent Playing Card
	elseif(e.message:findi("courier")) then
		e.self:Say("The courier that usually runs [" .. eq.say_link("carson",false,"McCabe") .. "]'s [" .. eq.say_link("shipment") .. "], is that good for nothing J'Racol. I don't trust his kind.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18722})) then -- Sealed Note For Knargon
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("Hmm. Carson better deal with his little 'problem' soon, it's costing us a lot of money. Hanns is gonna skin us all when he hears this. Go tell Hanns that [" .. eq.say_link("Carson has a mole in the Highpass") .. "] guards, and see what he wants us to do.");
			e.other:Ding();
			e.other:Faction(33,5,0); -- Circle of Unseen Hands
			e.other:Faction(217,-1,0); -- Merchants of Qeynos
			e.other:Faction(53,1,0); -- Corrupt Qeynos Guards
			e.other:Faction(135,-1,0); -- Guards of Qeynos
			e.other:Faction(164,1,0); -- Kane Bayle
			e.other:AddEXP(250);
		else
			e.other:SummonItem(18722);
			e.self:Say("I'm... erm, not quite sure what to do with this, but... thanks, I guess.");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end