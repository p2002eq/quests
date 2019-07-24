-- a_shipwrecked_hatestorm_sailor for crappy hatestorm sailor quest...

--say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Wot do you want? I be tired after [" .. eq.say_link("what big trouble?", false, "big trouble") .. "].' This Troll's speech gives you the impression that he is not the smartest being you have ever dealt with.");
    elseif(e.message:findi("big trouble")) then
        e.self:Say("Me's and me crew come to dock here but a big storm come and smash our ship. I thinks me the only one alive now. Da ship and all [" .. eq.say_link("what loots?", false, "loots") .. "] are now gone.")
    elseif(e.message:findi("loots")) then
        e.self:Say("Da loots from da other ship dat we attacked. Dat ship gone now too becuz of da big storm.' An almost sly look seems to grow across the troll's scarred face. 'Yous wants da loots? Mebbe me can helps you if you can [" .. eq.say_link("I can help you", false, "help") .. "] me?")
    elseif(e.message:findi("help")) then
        e.self:Say("Now dat I have no ship, methinks dat I will have ta work in da mines agin. Me not want that. Dere be no ale in dere and me luvs da ale. You gets me da [" .. eq.say_link("How do you get safe passage?", false, "safe passage") .. "] to da maynland and mebbe me can tell you more about da loots.")
    elseif(e.message:findi("safe passage")) then
        e.self:Say("I dunno. Mebbe you can gets me a note dat says me can ride on a ship to da maynland or sumthing.")
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 355007})) then -- Note of safe passage
        e.self:Say("Dis be gud. Better not trick me, becuz I get angry and it not good when me get angry. Me saw a lot of da loots come up to da beach. Da troll zombee mens come to da loots and take all. I not fights dem. Date be truble dere.");
        e.other:QuestReward(e.self, math.random(0,10), math.random(0,10), math.random(0,10), math.random(5), 0, eq.ExpHelper(20)); -- little bit of money and exp
    end

    item_lib.return_items(e.self, e.other, e.trade)
end

