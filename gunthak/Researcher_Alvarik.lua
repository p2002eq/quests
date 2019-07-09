function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Hello there. Are you too a student of the ["..eq.say_link("I am a student of the arcane.",false,"arcane").."]");
    elseif(e.message:findi("arcane")) then
        e.self:Say("Excellent. I hold myself as a master of researching the arcane. Even though I study mostly in the art of wizardry, I still carry tomes of the other realms. If you are a master of research and would like to borrow a copy of the research tome, let me know what school of magic you belong to and I may be able to help you out. I also carry with me hand copied works of the masters. If you like you can buy one from me for a small fee.");
    end

    if(e.message:findi("Enchanter") and e.other:GetClass() == 14 and e.other:GetSkill(58) > 100) then -- Enchanter
        e.self:Say("So you fancy yourself an enchanter? I dabble a bit in it myself, though I am more interested in the art of explosions! Nevertheless, here is the Phantasmist's Tome. Good luck to you in your studies!");
        e.other:SummonItem(317652); -- Phantasmal Tome
    else
        liar();
    end

    if(e.message:findi("Wizard") and e.other:GetClass() == 12 and e.other:GetSkill(58) > 100) then -- Wizard
        e.self:Say("So you too study wizardry! Isn't it the most fascinating of the four realms of magic? Well I won't keep you, here is the Sorcerer's Lexicon. Good luck to you in your studies.");
        e.other:SummonItem(317655); -- Sorcerer's Lexicon
    else
        liar();
    end

    if(e.message:findi("Magician") and e.other:GetClass() == 13 and e.other:GetSkill(58) > 100) then -- Magician
        e.self:Say("So you too study summoning! Isn't it the most fascinating of the four realms of magic? Well I won't keep you, here is the Arch Magus Grimoire. Good luck to you in your studies.");
        e.other:SummonItem(317653); -- Arch Magus Grimoire
    else
        liar();
    end

    if(e.message:findi("Necromancer") and e.other:GetClass() == 11 and e.other:GetSkill(58) > 100) then -- Necromancer
        e.self:Say("So you study necromancy! Isn't it the most fascinating of the four realms of magic? Well I won't keep you, here is the Warlock's Book of Binding. Good luck to you in your studies.");
        e.other:SummonItem(317654); -- Warlock's Book of Binding
    else
        liar();
    end
end

function liar (e)
    e.self:Say("Do you take me for a fool? It is obvious that you are not what you state. Begone from my sight, your false statements disgust me and insult the realms of the arcane.");
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
