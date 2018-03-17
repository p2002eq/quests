function event_trade(e)
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1724})) then
            e.self:say("Ahh, thank you. I've been waiting for these supplies for ages."); --generic reward text
            e.other:Faction(42,-30); --#CoV
            e.other:Faction(188,10); --#k-rif
            e.other:Faction(189,10); --#k-zek
            e.other:Faction(179,10); --#King_Tormax
            e.other:QuestReward(e.self,5,5,2,1,0);
        end
    
	item_lib.return_items(e.self, e.other, e.trade)
end

--fiddle
