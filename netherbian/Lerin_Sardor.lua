-- Lerin_Sardor (161068) in Netherbian Lair

function event_spawn(e)
    progress = 0;
end

function event_say(e)
    if progress == 0 then
        if e.message:findi("hail") then
            e.self:Say("Ahh, hello there " .. e.other:GetName() .. ". I am a trader from Sanctus Seru trying to make my way to Shadowhaven for some dealings. I have come this far with the aid of guards from Sanctus Seru, but they have turned back and left me to go on my own. I hear there are many terible [creatures] here lurking in the shadows, leave it to the guards of the Hand to leave me unprotected.'");
        elseif e.message:findi("creatures") then
            e.self:Say("What I was told is that this pass is filled with small horrible creatures with no eyes. Perhaps you could [help by providing safe passage] to the other side?");
        elseif e.message:findi("safe passage") then
            e.self:Say("Great! If I can get safely to the other side I will give you a small trinket that I was going to sell. Getting safe passage for the rest of my goods is worth more than the item in itself. Surely you know a good deal when you hear one. Take this note, if you agree to the conditions that I get across safely before you get payment return it to me and we will be on our way.");
            e.other:SummonItem(5982); -- Unsigned Agreement
        end
    elseif progress <= 5 then
        e.self:Say("Let's wait to chat till we reach the end, shall we?"); -- text made up
    elseif progress > 5 then
        e.self:Say("Oh, I feel so much better now that we've made it across. But I don't even want to think about my trip home..."); -- text made up
    end
end

function event_trade(e)
    local item_lib = require("items");
    
    if item_lib.check_turn_in(e.self, e.trade, {item1 = 5982}) then -- Unsigned Agreement
        e.self:Say("Let us go then, please be alert throughout the cavern. Once we get to the other side safely give me the signed agreement and you will have your payment.");
        e.other:QuestReward(e.self,0,0,0,0,5983); -- Signed Agreement
        progress = 1;
        eq.start(11);
    elseif progress > 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 5983}) then -- safely across and Signed Agreement
        e.self:Say("Thank you so much for your help! As I promised here is a small token of my appreciation.")
        e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(10),5984, 5000); -- Jasper Kundan Earring
        eq.depop_with_timer();
    end
    
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
    if e.wp >= 2 and e.wp <= 5 and e.wp > progress then
        progress = progress + 1;
        spawn_wave(e.self);
    elseif e.wp >= 9 then
        e.self:Say("Whew, we are finally here. If you will give me the contract I will keep up with my part of the bargain.");
        progress = progress + 1;
    end
end

function spawn_wave(e_self)
    local mob = eq.ChooseRandom(161015, 161094, 161020);
    local my_x, my_y, my_z = e_self:GetX(), e_self:GetY(), e_self:GetZ();
    for i=1,math.random(2,4) do
        eq.spawn2(mob, 0, 0, my_x+math.random(-20, 20), my_y+math.random(20, 40), my_z, 0):AddToHateList(e_self);
    end
end
