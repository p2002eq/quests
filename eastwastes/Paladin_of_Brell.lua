local paladin = nil;

function event_signal(e)
    if (e.signal == 1) then
        e.self:Say("inside signal"
        paladin = paladin + 1;
        if(paladin == 1) then
            e.self:Say("signal 1");
            e.self:AssignWaypoints(278);
        elseif(paladin == 2) then
            e.self:AssignWaypoints(279);
            e.self:Say("signal 2");
        elseif(paladin == 3) then
            e.self:AssignWaypoints(280);
            e.self:Say("signal 3");
        elseif(paladin == 4) then
            e.self:AssignWaypoints(281);
            e.self:Say("signal 4");
        end
    end
end
