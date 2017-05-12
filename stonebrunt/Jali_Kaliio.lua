function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Greetings outsider. I trust you have [peaceful intentions] while visiting our village?");
    elseif(e.message:findi("peaceful intentions")) then
        e.self:Say("That is good to hear. Those filthy kobolds have caused enough trouble. We do not need more enemies.");
        e.self:Emote("Jali turns around and glances at another Kejekan. This one seems somewhat ill. Her fur is coming out in patches and strange sores cover her body.");
        e.self:Say("That is my wife, Yuio. She has come down with a sickness, no doubt caused by those accursed kobolds.");
        e.self:Emote("Anger wracks Jali's face as he speaks.");
        e.self:Say("I would ask you for [help] but you are a stranger and owe us nothing. Of course if you did assist me, I would be forever greatful.");
    elseif(e.message:findi("help")) then
        e.self:Say("Oh thank you! You are most kind. I fear that there is not much time left for my dear Yuio. Please speak to [Khonza Ayssla]. She is most wise and perhaps can find some cure for this affliction.");
    elseif(e.message:findi("khonza ayssla")) then
        e.self:Say("Khonza Ayssla is the village's High Shaman. She teaches the ancient ways of Okanjo and is most wise. If she cannot assist you I do not know who can. I would go myself but I am too worried to leave my dear wife behind. When you find Khonza, tell her that Jali sent you. Please hurry, friend!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6976 })) then --vial of healing liquid
        e.self:Say("Jali opens the vial and gently tilts back Yuio's head. He pours the liquid into her mouth and waits. Miraculously, Yuios fur begins to take on a healthy sheen and the sores begin to disappear! Yuio falls into Jali's arms then goes slack, passing out.");
        e.self:Emote("Anger wracks Jali's face as he speaks.");
        e.self:Say("She needs much rest. I cannot begin to thank you enough for helping us. Please accept this as a reward. It is not much but it should be of some use. You are indeed a friend of ours and if you ever need shelter from the wilds, please visit us again.");
        e.other:QuestReward(e.self,0,0,0,0,6952,10000);  -- Wakizashi of the Frozen Skies
        e.other:Faction(172, 5, 0); -- Kejek Villiage
        e.other:Faction(247, 1, 0); -- Peace Keepers
    end
    item_lib.return_items(e.self, e.other, e.trade);
end