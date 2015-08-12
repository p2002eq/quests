local quest_helper = require('velious_quest_helper');
local ARMOR_GEMS = quest_helper.ARMOR_GEMS;
local THURG_ARMOR = quest_helper.THURG_ARMOR;
local QUEST_TEXT = {
    hail="Greetin's, -name, you look like a -race who knows the value of a good bow when ye see one. I'll let ye in on a li'l secret, the bow is the greatest of all weapons as it allows you to inflict maximum punishment on yer foes with minimum risk. How can ye possibly go wrong? Or better yet, if'n ye be a ranger, I can see my way clear to making you a coif, tunic, sleeves, bracer, gauntlets, leggings, or boots that I'm sure ye would enjoy.",
    coif="To create a piece of armor to protect your sensitive skull. I will require three pieces of crushed coral as well as a corroded chain coif.",
    tunic="To forge a spectacular chain tunic I will require three flawless diamonds and a corroded chain tunic.  With the gems and my skills I may be able to draw out some of its magical powers.",
    sleeves="Protection for your arms will come at the price of three flawed emeralds and a set of corroded chain sleeves.",
    bracer="For the bracers, I will require a corroded chain bracer as well as three crushed flame emeralds. Return to me when you find such things -race",
    gauntlets="Protecting your hands is very important.  I can forge protection for your hands if you bring me a pair of corroded chain gauntlets and three crushed topaz.",
    leggings="A set of corroded chain leggings might be salvageable if you were to find three flawed sea sapphires.  With the right techniques and ingredients almost anything is possible.",
    boots="We use our feet so often, should not they be protected as well as any other portion of our bodies?  If you seek fine protection for your feet, return to me with three pieces of crushed black marble and a set of corroded chain boots."
}

local QUEST_ITEMS = {
    -- boots
    quest_helper:melee_boots(THURG_ARMOR.Chain_Boots, 31020),
    -- legs
    quest_helper:melee_legs(THURG_ARMOR.Chain_Leggings, 31019),
    -- gloves
    quest_helper:melee_gloves(THURG_ARMOR.Chain_Gauntlets, 31018),
    -- wrist
    quest_helper:melee_gloves(THURG_ARMOR.Chain_Bracer, 31017),
    -- arms
    quest_helper:melee_gloves(THURG_ARMOR.Chain_Sleeves, 31016),
    -- chest
    quest_helper:melee_gloves(THURG_ARMOR.Chain_Tunic, 31015),
    -- helm
    quest_helper:melee_gloves(THURG_ARMOR.Chain_Coif, 31014),
}

function event_say(e)
    local faction = e.other:GetFaction(e.self);
    if (faction >=3) then
        quest_helper.quest_text(e, QUEST_TEXT);
    else
        e.self:Say("I do not know you well enough to entrust you with such a quest, yet.");
    end
end


function event_trade(e)
    quest_helper:quest_turn_in(e, 3, QUEST_ITEMS, quest_helper.thurg_armor_success)
end
