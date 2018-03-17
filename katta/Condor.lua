-- Condor in Katta

function event_spawn(e)
	eq.set_timer('depop', 30 * 60 * 1000)
	e.self:Shout('Behind the Nectar of Unity men!! Surround them!!')
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29846})) then -- Recording Stone
        e.self:Say("Perfect, this should give us some idea of what they may or may not know,' as he puts the stone in his belt pouch. 'Very well done my friend, have you ever considered a career in espionage? Take this, I have little need for it these days - Tilbok will know how to recharge it,' he says with a wry grin before disappearing back into the shadows.");
        e.other:Faction(168,1); -- Katta Castellum Citizens
        e.other:Faction(350,2); -- Validus Custodus
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(228,-1); -- Nathyn Illuminious
        e.other:Faction(55,-1); -- Coterie of the Eternal Night
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
		e.other:SummonItem(5105)
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer)
		eq.depop()
	end
end
