-- An impassive sea spirit in Gunthak

-- say block
function event_say(e)
    if(e.other:GetClass() == 10) then -- Shaman
        if(e.message:findi("Hail")) then
            e.self:Emote("sways back and forth, rocking with the gentle motions of the tide. You are nearly mesmerized by its periodic fluctuation, when it suddenly speaks. 'I watch you as you watch me, and I wonder. Do you realize how to become empty of wishes, of dreams, of hope and sorrow? What do you know, strange one, about the virtue of null emotion? Do you understand how to be as unwavering as the ocean itself? Can you envision yourself as the pebble in the river? Can you mute feeling? Do you [" .. eq.say_link("I dare to learn!", false, "dare to learn") .. "]?'");
        elseif(e.message:findi("learn")) then
            e.self:Say("We will see, " .. e.other:GetName() .. ", we will see. If you are a willing pupil, then demonstrate that you have begun to comprehend. Bring me something empty that previously numbed feeling and therefore brought emptiness to its possessor. You should not have to travel far.");
        elseif(e.message:findi("impassive")) then
            e.self:Emote("removes his gaze from the ocean and looks at you, 'Perhaps you can be, but I require proof. If you can defeat the smallest elements of the ocean, I shall reward you. Hand me their essences and I shall know you have completed the task. When you are ready to challenge them, hand me back that rock.'")
        end
    else
        e.self:Emote("lifts its gaze from the depths and scans you up and down. Finding nothing that interests it, the spirit returns to gazing at the depths.");
    end
    
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 358010})) then -- Empty Flask
        e.self:Say("Well done, strange one. Your perception is admirable.' The spirit hands you an incredibly heavy rock. 'Can you, " .. e.other:GetName() .. ", be as [" .. eq.say_link("I can be impassive as the sea", false, "impassive as the sea") .. "]?");
        e.other:SummonItem(358013); -- Large Rock

    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 358013})) then -- Large Rock
        e.self:Emote("melds with the murky ocean water, and two elements of the sea appear.");
        eq.spawn2(224345,0,0,-284.48,650,-148.25, 480); -- Flotsam
        eq.spawn2(224346,0,0,-267.10,665.95,-148.25, 440); -- Jetsam
    
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 358014, item2 = 358015})) then -- Small Piece of Flotsam and Small Piece of Jetsam
        e.self:Say("Now you comprehend. This is the way things are, and the way they have always been. Your acceptance of these truths proves your worthiness.");
        e.other:QuestReward(e.self,0,0,0,0,359013,eq.ExpHelper(44, 5)); -- Spell: Stoicism
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
