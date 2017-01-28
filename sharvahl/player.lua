function event_say(e)
    myX = e.self:GetX()
    myY = e.self:GetY()
    if(e.message:findi("Lumanes")) and (between(myX, 530, 580) and between(myY, -550, -590)) and e.self:IsSitting() then --
        eq.signal(155337,1,1);
    elseif(e.message:findi("able to help")) and (between(myX, 530, 580) and between(myY, -550, -590)) and e.self:IsSitting() then --
        eq.signal(155337,2,1);
    end
end