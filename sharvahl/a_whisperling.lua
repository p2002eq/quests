function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Lumanes Astrall, Our cousin, a spirit of frost, is trapped. We may not intervene. Only one of flesh may aid us. Are you one [" .. eq.say_link("able to help") .. "]?");
    end
    if(e.signal == 2) then
        e.self:Say("Then we thank you. We will lure it here. But beware, it uses our cousins strength to protect itself.");
        eq.spawn2(155422,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
    end
end