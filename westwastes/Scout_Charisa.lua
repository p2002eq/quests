function event_say(e)
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29683})) then -- Scout Tools
		eq.set_timer("depop", 120000); -- 20 minutes
		eq.load_encounter("Scout_Charisa");
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
	eq.unload_encounter("Scout_Charisa");
	eq.depop(120115); --Captain
	eq.depop_all(120121); --warriors
	eq.depop_with_timer(); --Scout Charisa
	end

end


-- fiddle
