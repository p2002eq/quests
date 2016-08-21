local eventStarted = false;


function event_trade(e)
	local item_lib = require("items");
	-- Dialogue on turn in, spawns the war mobs then despawn her.
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1093})) and (eventStarted == false) then 
	    e.self:Say("Thank you. I will return to the Dain and inform him that the battle is underway. Please escort Garadain to the battlefield and see that he returns safely. May Brell bless you and bring you victory over these beasts.")
	    e.other:Faction(49, 30); -- +Coldain
		e.other:Faction(67, 30); -- +Dain Frostreaver IV
		e.other:Faction(188, -30); -- -Kromrif
		e.other:Faction(189, -30); -- -Kromzek
		e.other:AddEXP(10000);
		if (eq.get_entity_list():GetMobByNpcTypeID(116084) == false) then
			eq.spawn2(116084,0,0,-390,-2713,179.48,19.4);
		end
	    eq.load_encounter("RingEight");	
		eventStarted = true;
		eq.depop();
--	    eq.spawn2(116607,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
    end
	item_lib.return_items(e.self, e.other, e.trade)
end