local quest_helper = require('velious_quest_helper');
local ARMOR_GEMS = quest_helper.ARMOR_GEMS;
local THURG_ARMOR = quest_helper.THURG_ARMOR;
local QUEST_TEXT = {
    hail="Greetings to you. I seek the service of devout knights who have distinguished themselves. Are you a paladin, -name?",
    paladin="A paladin of your kind has not made it this far for quite some time. Well, I wonder what it is you seek here? Do you seek heroic and chivalrous deeds to distinguish yourself from your brethren? Do you need accoutrements to aid you in your battles perhaps? You are in luck, knight, for I have both for you. Do you wish to partake of my quests?",
    partake="Excellent! By serving my cause, you, in turn, will further your own. I require certain components and if you bring them to me I shall reward you for your honorable service. You may choose from among these items: a helm, a breastplate, armplates, bracers, gauntlets, greaves, and boots.",
    helm="To create a piece of armor to protect your skull I will require three pieces of crushed coral as well as a corroded plate helmet.",
    breastplate="For the breastplate, I will need a corroded breastplate and three flawless diamonds. Once I have them in my possession it will not take long to craft a sturdy breastplate.",
    armplate="Protection for your arms will come at the price of a set of corroded plate vambraces and three flawed emeralds.",
    bracer="For the bracers, I will require a corroded plate bracer and a set of three crushed flame emeralds. Return to me if you happen to find these things in your travels.",
    gauntlet="Protecting your hands is very important. I can forge protection for your hands if you bring me a pair of corroded plate gauntlets and three crushed topaz.",
    greaves="A set of corroded greaves might be salvageable if you were to find three flawed sea sapphires. With the right techniques almost anything is possible.",
    boots="Boots made for battle are not always the most comfortable available. However, if you seek a fine set for battle bring me a set of corroded plate boots and three pieces of crushed black marble."
}

local QUEST_ITEMS = {
    -- boots
    quest_helper:melee_boots(THURG_ARMOR.Plate_Boots, 31027),
    -- legs
    quest_helper:melee_legs(THURG_ARMOR.Plate_Greaves, 31026),
    -- gloves
    quest_helper:melee_gloves(THURG_ARMOR.Plate_Gauntlets, 31025),
    -- wrist
    quest_helper:melee_bracer(THURG_ARMOR.Plate_Bracer, 31024),
    -- arms
    quest_helper:melee_arms(THURG_ARMOR.Plate_Vambraces, 310123),
    -- chest
    quest_helper:melee_chest(THURG_ARMOR.Plate_Breastplate, 31022),
    -- helm
    quest_helper:melee_helmet(THURG_ARMOR.Plate_Helmet, 31021)
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
