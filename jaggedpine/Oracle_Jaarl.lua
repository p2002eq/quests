---- Quest:Paying Oracle Jaarl Respect
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Emote("shakes his body and his countless necklaces cause a loud rattle to echo off the stone walls. 'Hello Frostpipes. Have you come to [" .. eq.say_link("worship") .. "] or have you just come for a visit to view our wonderful architecture and to [" .. eq.say_link("pay your respects") .. "].");
    elseif(e.message:findi("worship")) then
        e.self:Say("Very well. You worship quietly then. May Brell Serilis bless you.");
    elseif(e.message:findi("respects")) then
        e.self:Say("You have, well then! You can pay your respects by bringing me a [" .. eq.say_link("present") .. "].");
    elseif(e.message:findi("present")) then
        e.self:Say("I like necklaces. I wear necklaces made from every kind of beast. The power of the beast is contained within each necklace. The more necklaces I wear, the greater my power! Bring me a Bear Fang Necklace, a Wolf Fang Necklace and a Panther Fang Necklace. This will show your devotion to the temple. Then perhaps I can do you a [" .. eq.say_link("favor") .. "]");
    elseif(e.message:findi("favor")) then
        if(fac <= 4) then
            e.self:Say("I see that you truly respect our temple and more importantly, myself. Since I have great power and you have given me many gifts, I am willing to give you a gift if you are skilled in the ways of the [" .. eq.say_link("mystic") .. "] or the [" .. eq.say_link("heretic") .. "].");
        else
            e.self:Say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
        end
    elseif(e.message:findi("heretic")) then
        e.self:Say("I can make a weapon for you, one that you may use to curse your enemies with terrible illness. I require several items. The shaft of the weapon will be made from a [" .. eq.say_link("Treant Finger") .. "]. I shall cover the shaft in Griffon Down and affix a Griffon Skull to the top. Finally, I shall need a Diseased Bear Liver with which to imbue the staff with its terrible magic.");
    elseif(e.message:findi("mystic")) then
        e.self:Say("I can make a weapon for you, one that you may use to curse your enemies with terrible illness. I require several items. The shaft of the weapon will be made from a [" .. eq.say_link("Treant Finger") .. "]. I shall cover the shaft in Griffon Down and affix a Griffon Skull to the top. Finally, I shall need a Diseased Bear Liver with which to imbue the staff with its terrible magic.");
    elseif(e.message:findi("treant finger")) then
        e.self:Say("I doubt a treant would willingly hand over his finger. Remember, the older the treant the stronger the shaft of the weapon will be."); -- Possible continuance of the quest, but unknown.
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8265, item2 = 8266, item3 = 8267, item4 = 8268})) then -- Diseased Bear Liver, Griffon Down, Griffon Skull & Treant Finger
        e.self:Say("Grr, Bark. Here is your item");
        e.other:QuestReward(e.self,0,0,0,0,8071,1000); -- Rod of Ulceration
    end
    item_lib.return_items(e.self, e.other, e.trade)
end