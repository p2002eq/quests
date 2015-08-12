function event_say(e)
    local charfaction = e.other:GetCharacterFactionLevel(49);
    if (charfaction >= 3) then
        if e.message:findi("hail") then
            e.self:Say("Greetin's, ".. e.target:GetRace() ..", you look like a $race who knows the value of a good bow when ye see one. I'll let ye in on a li'l secret, the bow is the greatest of all weapons as it allows you to inflict maximum punishment on yer foes with minimum risk. How can ye possibly go wrong? Or better yet, if'n ye be a ranger, I can see my way clear to making you a coif, tunic, sleeves, bracer, gauntlets, leggings, or boots that I'm sure ye would enjoy.");
        end
    end
end
