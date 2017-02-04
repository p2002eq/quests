---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("Ajeea",900000);
end

function event_timer(e)
    if (e.timer == "Ajeea") then
        eq.depop();
    end
    eq.stop_timer(e.timer)
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7779})) then -- Shade Summoning Figurine
        e.self:Emote("Perfect. We shall begin the summoning and questioning. This enchanted scroll will magically scribe all that transpires within its radius of perception. Take it to Magistrate Phenic after the summoning and questioning are completed.");
        e.other:Faction(206,5); -- Magus Conlegium
        e.other:Faction(168,5); -- Katta Castellum Citizens
        e.other:Faction(350,5); -- Validus Custodus
        e.other:Faction(284,-5); -- Seru
        e.other:Faction(139,-5); -- Hand of Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-5); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,0,10000); -- exp
        eq.set_global("autarkic_combat",e.other:GetName(),3,"M10");
        eq.spawn2(160482,0,0,-97,-822,11,0); -- Autarkic Lord Sfarosh
        eq.signal(160482,1,10000); -- Autarkic Lord Sfarosh
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("How was it that you came to be imprisoned in the mansion of Nathyn Illuminious?");
        eq.signal(160482,4,5000); -- Autarkic Lord Sfarosh
    elseif(e.signal == 2) then
        e.self:SetAppearance(3);
        eq.signal(160483,2,100); -- #Praecantor Selis Dawneyes
    elseif(e.signal == 3) then
        eq.signal(160484,3,100); -- #Incantator Jak Masric
        eq.depop();
    end
end