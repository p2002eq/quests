---- Quest:Order of the Storm Caller
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("What do you want?");
    elseif(e.message:findi("continue") and tonumber(qglobals.Storm_Caller) == 2) then
        e.self:Say("Now that the scepter has been properly modified for the task, you must keep it safe for now. Your next task will be to seek out two more components, for the original components and the spells describing how they were forged are lost forever -- destroyed by Urwenae's second and final pupil who went mad while attempting to fulfill his duty. The Essence of Storms must be retrieved, and there is only one place within the whole of Norrath's prime or astral realms that it can be found -- the Plane of Sky. There is a being known as The Storm Mistress who dwells there. Seek her out and retrieve the Essence of Storms from her ethereal being. Do not worry yourself over what seems to be a gruesome murder and thieving, for she will coalesce again as all immortal, planar beings do in time. The second item that you must retrieve is the Cloudy Azure Sphere, which lies in the hands of [" .. eq.say_link("Priestess Auraia") .. "] in the depths of Kedge Keep.");
    elseif(e.message:findi("Priestess Auraia") and tonumber(qglobals.Storm_Caller) == 2) then
        e.self:Say("Auraia was once a priestess of the Prime Healer. Upon her travels throughout the world of Norrath, she stumbled blindly into the castle grounds of Mistmoore. Fortunately, it was during the daylight hours and she did not need to wander far before discovering the error of their ways. Quickly, she attempted to turn back, fearfully respecting the wish for privacy that is heavily guarded and ferociously enforced by the vampire lord's undead servants. As she made her way out of the castle grounds and returned to the boundaries of the Lesser Faydark forest, Auraia happened upon a recently discarded azure sphere. She had no idea what the sphere was intended for - at first likely thinking it the lost toy of some Koada'Dal or gnomish child. However, she was intrigued by it and threw it in her pack for a later inquiry and inspection. Eventually, Auraia heard tales of the ancient underwater city known as Kedge Keep from her Koada'Dal hosts in Felwithe. The intrigue was too much for this young adventurer to bear."); -- Missing some text at the end.
        e.other:SummonItem(34040); -- Empty Case of Storms
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9234})) then -- Scroll of the Tempest Eye
        e.self:Say("The Scepter of Storms. . . but how could this be? You have spoken with Shayna, yes? I see that she has found one to retrieve the stolen tome. But what is even more intriguing is the acquisition of the scepter itself. I am impressed and these items represent your deeds better than any arrogant boasting that I hear day in and day out from the other youths of the order. Aaaah and yes, you have the scroll! Well then, we cannot let an opportunity like this slip through our fingers, now can we?'' The mage quickly eyes the scroll before closing his eyes and beginning an arcane chant. The scroll in his hand begins to smolder, although the page is not damaged. A glowing silver image of a swirling storm seems to reflect off the surface of the parchment. Then, the scepter begins to slightly chime and runes begin to magically imbed themselves into the scepter's base. The mage opens his eyes and extends the scepter to you, ''Now then, [" .. eq.say_link("shall we continue") .. "]");
        e.other:Faction(271,10); -- Residents of Jaggedpine
        e.other:Faction(159,5); -- Jaggedpine Treefolk
        e.other:Faction(265,5); -- Protectors of Pine
        e.other:Faction(135,1); -- Guards of Qeynos
        eq.set_global("Storm_Caller","2",5,"F"); -- Globals
        e.other:QuestReward(e.self,0,0,0,0,0,1000); --
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9236, item2 = 9235})) then -- Cloudy Azure Sphere & Essence of the Storm
        e.self:Emote("studies both items intently, muttering softly to himself at an inaudible tone. Eventually, the mage closes his eyes and begins to chant, the melodic weave of arcane words causing the essence to shimmer with the brilliance of an electrical storm. Slowly, he brings both hands together, sealing the ethereal essence within the magical sphere -- a union that forces a loud boom, the voice of thunder, to echo throughout the hall. D'mitrious opens his eyes and examines the completed orb and nods to himself, ''This should be sufficient. Take it and place it within the scepter. When the two enchanted items are united, the Orb of the Storm Caller will be forged.");
        e.other:Faction(271,10); -- Residents of Jaggedpine
        e.other:Faction(159,5); -- Jaggedpine Treefolk
        e.other:Faction(265,5); -- Protectors of Pine
        e.other:Faction(135,1); -- Guards of Qeynos
        eq.delete_global("Storm_Caller"); --Remove global
        e.other:QuestReward(e.self,0,0,0,0,34039,1000); -- Storm Caller Essence (Made up item)
    end
    item_lib.return_items(e.self, e.other, e.trade)
end