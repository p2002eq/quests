function event_say(e)
	e.self:Say("Hello");
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29683})) then -- Scout Tools
		eq.set_timer("depop", 1200000); -- 20 minutes
		eq.spawn2(120115,0,0,-3501,-4868,-108, 0); -- a Kromzek Captain
		eq.spawn2(120121,0,0,-3507,-4897,-106, 0); -- Kromzek Warrior
		eq.spawn2(120121,0,0,-3496,-4874,-109, 0); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3474,-4863,-114, 0); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3463,-4852,-117, 0); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3452,-4841,-119, 0); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3441,-4830,-122, 0); -- Kromzek Warrior
        eq.spawn2(120121,0,0,-3430,-4819,-124, 0); -- Kromzek Warrior
        e.other:Faction(42,30);   --Claws of Veeshan
		e.other:Faction(362,30);  --Yelinak
		e.other:Faction(189,-20); --Kromzek
		e.other:QuestReward(e.self,0,0,0,0,0,100000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29684})) then --Broken Disk
	    e.other:Faction(42,30);   --Claws of Veeshan
        e.other:Faction(362,30);  --Yelinak
        e.other:Faction(189,-20); --Kromzek
        e.other:QuestReward(e.self,0,0,0,0,29688); --Scout Report
        e.other:QuestReward(e.self,0,0,0,0,29685,100000); --Robe of Benevolence
        
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29685})) then --Robe of Benevolence
        e.other:QuestReward(e.self,0,0,0,0,29686); --Bracer of Benevolence
    
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29686})) then -- Bracer of Benevolence
        e.other:QuestReward(e.self,0,0,0,0,29687); --Talisman of Benevolence
    
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 29687})) then --Talisman of Benevolence
        e.other:QuestReward(e.self,0,0,0,0,29685); --Robe of Benevolence
        
        
	end

	item_lib.return_items(e.self, e.other, e.trade)

end

function event_timer(e)
	if (e.timer == "depop") then
	eq.stop_timer("depop");
	eq.depop(120115); --Captain
	eq.depop_all(120121); --warriors
	eq.depop(); --Scout Charisa
	end

end


-- fiddle
