function event_death_complete(e)
     eq.spawn2(214122,0,0,e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());  --Enraged War Boar
     eq.spawn2(214122,0,0,e.self:GetX()+10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());
     eq.spawn2(214122,0,0,e.self:GetX()-10,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
     eq.spawn2(214122,0,0,e.self:GetX()-10,e.self:GetY()-10,e.self:GetZ(),e.self:GetHeading());
end

-- End of File  Zone: PoTactics  ID: 214053  -- #Glykus_Helmir