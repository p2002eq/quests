function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_death_complete(e)
	eq.spawn2(88093,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(88093,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading());
    eq.spawn2(88093,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading());
	
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

--Fiddlemetimbers