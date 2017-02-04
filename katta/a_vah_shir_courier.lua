---- Quest:Rakshasa Skulls
function event_spawn(e)
    eq.set_timer("courier", 700000); -- 10 minutes to kill all mobs
end

function event_emote(e,message)
    local player_list = eq.get_entity_list():GetClientList();
    if(player_list ~= nil) then
        for player in player_list.entries do
            if(player:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 200) then
                player:Message(15,message)
            end
        end
    end
end

function event_timer(e)
    if (e.timer == "courier") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end

function event_death_complete(e)
    event_emote(e,"The Vah Shir courier slams the crate of skulls against the ground with unnatural force as he falls jarring it open.");
    event_emote(e,"With his dying breath the possessed courier mutters a dark incantation and the skulls burst from the chest sprouting new skeletal forms.");
    eq.signal(160126,3,1); -- Roshawna Rhorer - Spawn Reanimated mobs
end

function event_emote(e,message)
    local player_list = eq.get_entity_list():GetClientList();
    if(player_list ~= nil) then
        for player in player_list.entries do
            if(player:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 200) then
                player:Message(6,message)
            end
        end
    end
end

function event_waypoint_arrive(e)
    if(e.wp==6) then
        eq.pause(60);
        e.self:DoAnim(36);
        eq.SelfCast(278);
        e.self:Say("Sorry for the delay mistress, I ran into a spot of trouble on the way here. I am prepared to deliver your crate to the spiritualists back home.");
        eq.signal(160126,1,1000); -- Roshawwna_Rhorer
    end
end


function event_signal(e)
    if(e.signal == 1) then
        e.self:Emote("tucks the crate of skulls under his arm and nods to Roshawna.");
        event_emote(e,"Suddenly the courier begins to shake, his fur stands on end, and his eyes glaze over expressionlessly.");
        event_emote(e,"The courier runs for the gates of Katta Castellum with an otherworldly howl echoing in his wake.");
        eq.signal(160126,2,500); -- Roshawwna_Rhorer
        eq.resume();
    end
end