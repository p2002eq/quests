-- Redlin Hullnic for Wizard spell quests in Gunthak

-- say block
function event_say(e)
    if(e.other:GetClass() == 12) then -- Wizard
        if(e.message:findi("Hail")) then
            e.self:Say("'Eh, who's there? Yender is that you? No you're far too tall to be Yender. You must be one o' them [" .. eq.say_link("I am not a pirate", false, "pirates") .. "]!' Redlin then begins to beat furiously on your ankle with his staff. Furiously might be a slightly strong word, as he doesn't seem to be doing any real damage.");
        elseif(e.message:findi("pirate")) then
            e.self:Say("Not a pirate, aye? Well lucky thing for you, I would have given you a real thrashing with my stick if you were! I don't suppose you know where I could get a good pair of gnomish glasses around here do ya? Mine broke on the boat ride over and I can't see a thing without 'em.");
        end
    else
        e.self:Emote("squints up at you from his seat on what looks like very wet ground. 'Hey there lad, do ya think you could step out of the way there? You're standing in the light.' Redlin then goes back to squinting intently at the ground around him.");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");
    
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359054}) and e.other:GetClass() == 12) then -- Gnomish Spectacles
        e.self:Emote("takes the spectacles from your hands and puts them up to his eyes and blinks several times. Many thanks, Snowtop! I don't know what I would have done without you. Probably stagger around the island half blind for the rest of my life! At any rate I can repay you with a little trick I picked up along the way. If you ever get in a jam, hopefully you won't be as forgetful as I was!' He hands you a scroll with several runes scrawled across it.");
        e.other:QuestReward(e.self,0,0,0,0,359020,150000); -- Spell: Vision Shift, ~2% exp for lvl 44
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end