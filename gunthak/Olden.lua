-- Olden for Green drogmor sellback in Gunthak

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("coughs violently as you approach him. He looks rather sick. 'Hello " .. e.other:GetName() .. ", you might want to stand back. I've got a nasty cough and I don't want to be spreading it around. Hopefully you haven't come to sell a green drogmor back, I'm afraid I might be allergic to them and that will make my cough even worse! Oh, but I suppose I'll have to buy it back from you if you're sure you don't want it. Show me your green drum and I'll make you a platinum offer for it.");
	end
end

--trade block
function event_trade(e)
    local item_lib = require("items");
    
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359510})) then -- Small Green Drum
		e.other:SummonItem(321820); -- Bag of Platinum Pieces
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359511})) then -- Green Drum
		e.other:SummonItem(321821); -- Heavy Bag of Platinum
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359512})) then -- Large Green Drum
		e.other:SummonItem(321822); -- Big Bag of Platinum
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359513})) then -- Giant Green Drum
		e.other:SummonItem(321823); -- Huge Bag of Platinum
    end
    
	item_lib.return_items(e.self, e.other, e.trade)
end
