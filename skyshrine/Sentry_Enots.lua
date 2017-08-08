-- Storm Giant Toes to Sentry Kcor
function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("It was because of an outsider that the dragons were forced to flee.");
        eq.signal(114581,1,2000); -- Sentry_Kcor
    elseif(e.signal == 2) then
        e.self:Say("Perhaps you are right Kcor, but we will see.");
        e.self:Say("I must speak with the Herald, Kcor please see to the gate until I return.");
        eq.signal(114581,2,2000); -- Sentry_Kcor
    elseif(e.signal == 3) then
        e.self:Say("I shall not be long.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end