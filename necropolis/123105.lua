function event_signal(e)
    if (e.signal == 99) then
        e.self:Say("Chita ve ni ne, ni ne Neb!");
        eq.signal(123045,101,1000);
    end

end
