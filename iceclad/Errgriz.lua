-- Captain Nalot's Triple Strength Rum
function event_say(e)
	if(e.message:findi("Hail")) then
        e.self:Say("Errrr.  You come for master. learning like me?");
    elseif(e.message:findi("what learning")) then
        e.self:Say("I am learning ways of skinning and tailoring.  None left but the master so I must learn to help.  For now I only clean the furs.");
    elseif(e.message:findi("i come for learning")) then
        e.self:Say("I am learning ways of skinning and tailoring.  None left but the master so I must learn to help.  For now I only clean the furs.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30023})) then -- High Quality Dire Wolf Fur
        e.self:Emote("starts to cut and scrape the furts. He growls softly as he works and his master watches his progress. 'Grrr. Much too small. I fail. I not ready to work on my own. Sorry to waste your time. Here, take what I made. Maybe you can find use for it.'");
        e.other:QuestReward(e.self,0,0,0,0,30037,10000); -- Wolf Fur Earcovers
    end
    item_lib.return_items(e.self, e.other, e.trade)
end