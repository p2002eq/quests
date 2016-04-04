local paladin = nil;

function event_signal
    if (signal == 1) then
        paladin = paladin + 1;
        if(paladin == 1) then
            e.self:AssignWaypoints(278);
        elseif(paladin == 2) then
            e.self:AssignWaypoints(279);
        elseif(paladin == 3) then
            e.self:AssignWaypoints(280);
        elseif(paladin == 4) then
            e.self:AssignWaypoints(281);
        end
    end
end
