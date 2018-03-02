-- Call of the Hero cast in Acrylia Caverns

function event_spell_effect(e)
    local caster = eq.get_entity_list():GetClientByID(e.caster_id);
    caster:Message(13, "A voice whispers in your ear: There are no heroes here... except this one.");

    eq.spawn2(154373, 0, 0, caster:GetX() + math.random(-5, 5), caster:GetY() + math.random(-5, 5), caster:GetZ() + 1, 0):AddToHateList(caster, 100);
    
    return -1
end
