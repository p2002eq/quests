local helper = {}

function helper.hail_text(e, zone)
    if (e.message:findi('hail')) then
        e.self:Say("Greetings ".. e.other:GetCleanName() ..", I am ".. e.self:GetCleanName() .."and i have been sent here by the Gnomish Academy of Science to assit you in traveling the oceans of norrath. If you would like to [Travel to ".. zone .."] please let me know.");
    end
end

return helper;
