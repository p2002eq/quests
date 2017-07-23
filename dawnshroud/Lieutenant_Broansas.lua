---- Quest:Smuggler Reports
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings Stranger, is there something I can help you with? I would love to chat with you but i'm afraid I have to stay focused on the [" .. eq.say_link("case") .. "] I am investigating.");
    elseif(e.message:findi("case")) then
        e.self:Say("Well, " .. e.other:GetName() .. ". I'm monitoring a possible smugglers ring down there ahead of us in the distance. That group down there sure has a large shipment of goods and I intend to find out why.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4760})) then -- A Notorized Letter
        e.self:Say("You are sent from Lady Mistala I see? Ah of course she needs my reports. I trust you will return these documents to Mistala at once. Here you are, and thank you for your help. I shall have more reports soon.");
        e.other:Faction(152,5); -- house of fordel
        e.other:Faction(140,5); -- haven defenders
        e.other:Faction(338,1); -- traders of the haven
        e.other:QuestReward(e.self,0,0,0,0,4761,2500); -- Journal of Broansas
    end
    item_lib.return_items(e.self, e.other, e.trade)
end