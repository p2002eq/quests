--#exiled_soldier_of_Marr (201519)
--HoHonorA Alternate Access Quest
--pojustice

function event_spawn(e)
	eq.set_timer("anim",1 * 1000);
	eq.set_timer("depop", 2 * 60 * 1000);  --2 min depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	elseif e.timer == "anim" then
		e.self:SetAppearance(3);	--lying position
	end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29281})) then -- 
        --e.self:Emote("");	--missing hand-in text
        e.other:QuestReward(e.self,0,0,0,0,29293,0); -- Soul Sphere (calm)
		e.other:SummonItem(29281); --returns box of souls
    end
    item_lib.return_items(e.self, e.other, e.trade)
end