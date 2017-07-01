--Pinky Ekkolofezznaboten III 
--Plane of Mischief 1.0

--possibly more responses should go into this LUA (i.e. says certain knock knock jokes) but haven't seen any specific data

function event_say(e)
    if(e.message:findi("hail")) then
		e.self:Say("Hail ".. e.other:GetName() ..".  Do you know any [knock knock] jokes?");
	elseif(e.message:findi("knock knock")) then
        e.self:Emote("laughs");
        e.self:SpellFinished(904, e.other);  --knockback player towards pit trap behind invis wall
    end
end

--standard item return

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

