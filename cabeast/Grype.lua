function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("gulps down the rest of his ale. 'Looks like I'll need another.'");
	elseif(e.message:findi("blue talon")) then
		e.self:Emote("takes a swipe at you. 'We used to be the bruisers of the west side. We didn't take nothin' from no one!! Fist and mind was our motto. Now get lost before I introduce my fist to your face. Hmpf. Too late, I see.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30146})) then -- The Broken Glacier Souvenir Mug
		e.self:Say("Well, as promised, here's your Foot of the candlestick.");
		e.other:QuestReward(e.self,0,0,0,0,12852,100); -- Foot of Candlestick
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12609, item2 = 12609, item3 = 12609, item4 = 12609})) then -- 4x Cabilis Pale Ale
		e.self:Emote("swallows the whole bottle in one gulp. 'Here, go buy yourself a brain. What?!! You expecting something? How about this.. <BUUURRRPPPP!!> Thanks for helping me get through my dry spell, croak!! Never mess with a Blue Talon!!");
		e.other:QuestReward(e.self,1,0,0,0,0,100); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end