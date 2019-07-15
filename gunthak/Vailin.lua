-- Vailin for Black drogmor sellback in Gunthak

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Greetings " .. e.other:GetName() .. ", I suppose you're here looking at the fine drogmors my friend Hizaklom has for sale.  Fine, fine beasts they are.  They'll most assuredly get you where you want to go, and safely at that! Of course, if you decide that you're not happy with one of them I'm sure we can work out a deal.  I'm in charge of the black variety.  Which are obviously the best I might add.  I won't touch any other color.  Give me your calling drum and I'll give you a fair price for it.");
	end
end

--trade block
function event_trade(e)
    local item_lib = require("items");
    
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359505})) then -- Small Black Drum
		e.other:SummonItem(321820); -- Bag of Platinum Pieces
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359506})) then -- Black Drum
		e.other:SummonItem(321821); -- Heavy Bag of Platinum
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359507})) then -- Large Black Drum
		e.other:SummonItem(321822); -- Big Bag of Platinum
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359508})) then -- Giant Black Drum
		e.other:SummonItem(321823); -- Huge Bag of Platinum
    end
    
	item_lib.return_items(e.self, e.other, e.trade)
end
