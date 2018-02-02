--Jimmik_Greenstone (203427)
--potranquility

function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("gives a slight nod of his head in respectful greetings, 'You have arrived in our midst during a most exciting and haste-ridden time, my friend. The citizens of Quellious' domain have made excellent preparations to accommodate your presence among us. We can only hope that the wares and services we are able to provide will be sufficient enough to prepare you for the unforeseen future of this course in our collective history. Please, search my wares if you wish. All that I have is at a fair price. My inventory is modest, I admit, but what supplies I can offer may come to be of aid to you throughout your dangerous journeys.'");
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

