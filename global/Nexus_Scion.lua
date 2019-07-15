-- Nexus Scion in multiple zones
-- this is a massively simplified version of spires script, which has been altered from its original functionality
-- this is meant as a quality of life improvement for both devs and players who don't have to wait for next port

-- say block
function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Hello, traveler! Do you wish to [" .. eq.say_link("I wish to journey to Luclin", false, "journey to Luclin") .. "]?");
    elseif e.message:findi("journey to luclin") then
        e.self:Say("Take this, " .. e.other:GetName() .. ". When you are ready to begin your journey, hand me the shard and you will be on your way.");
        e.other:SummonItem(19720); -- Spire Stone
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");
    
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19720})) then -- Spire Stone
		e.self:Say("Fare well on your journey, " .. e.other:GetName() .. "!");
        e.self:SpellFinished(2935, e.other);
    end
    
	item_lib.return_items(e.self, e.other, e.trade)
end
