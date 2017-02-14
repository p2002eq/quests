function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Greetings, " .. e.other:GetName() .. ", as she fiddles absently with the ring on her finger as though it were a gift from someone who meant a great deal to her...");
    elseif(e.message:findi("rifkin")) then
        e.self:Say("'Umm, who? I do not know anyone by that...' she trails off, unable to find the words. 'He... he failed the question. I didn't have anything to do with it, why would you ask me? On second thought, never mind, I would really rather not talk about it thank you very much. Good day to you " .. e.other:GetName() .. ".");
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end