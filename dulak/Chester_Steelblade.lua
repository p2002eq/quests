-- Chester Steelblade in Dulak for paladin quest

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.other:Message(0, "A soft glow fills the cavern as an ethereal form begins to form in front of you. The stern face of a middle aged Erudite forms from the swirling mists and begins to speak to you. 'Find the key to Brokenskull and free me from my torment.'");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359028}) and e.other:GetClass() == 3) then -- Glowing Black Medallion
        e.self:Emote("twitches as the necklace touches the ethereal form. You feel unfamiliar hands in your packs, but before you can check them, the stern face of the ghost turns into a snarl. The spirit's hands dart forward and take hold of your throat with an unholy strength.");
        e.other:QuestReward(e.self,0,0,0,0,359004,eq.ExpHelper(51)); -- Spell: Light of Life
        e.self:AddToHateList(e.other, 5000) -- lots of hate!
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end
