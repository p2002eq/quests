---- Quest:Beer for the Guards
function event_say(e)
    if(e.message:findi("Hail")) then
        eq.signal(160398,1,1);
        e.self:Say("Sure'n this one came from Norrath, eh Tack? One wonders if'n a bottle o' one on o' the finer things in life might be in our future, if we were to ask politely?");
        eq.signal(160398,2,1);
    elseif(e.message:findi("share a pint")) then
        e.self:Say("That'd be great! By Brell, a short beer or a honey mead'd be a nice change from?");
        eq.signal(160398,3,1);
    elseif(e.message:findi("trouble")) then
        e.self:Emote("clears his throat and flashes a broken-toothed grin your way, 'Ye know, me dwarven heart longs for me first taste o' some underfoot brown, a reputed fine stout not available 'ere on Luclin... Ye know, if ye can manage it that is.'");
        eq.signal(160398,4,1);
    end
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Emote("catches on slowly, 'ahhh, roight! Good show, Tack! D'ye think 'e would go te that kinda [trouble] fer us?'");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19967})) then -- Underfoot Brown
        e.self:Emote("takes a wee sip and smacks his lips together, proclaiming, 'Ahhh, a finer stout has never passed my lips, ' before draining the mug in one gulp. 'Yer a saint amongst us, I say. Feel free to keep 'em coming, " .. e.other:GetName() .. "!'");
        e.other:Faction(168,5); -- Katta Castellum Citizens
        e.other:Faction(350,5); -- Validus Custodus
        e.other:Faction(206,5); -- Magus Conlegium
        e.other:Faction(228,-5); -- Nathyn Illuminious
        e.other:Faction(55,-5); -- Coterie of the Eternal Night
        e.other:Faction(139,-5); -- Hand of Seru
        e.other:Faction(284,-5); -- Seru
        e.other:Faction(96,-5); -- Eye of Seru
        e.other:Faction(138,-5); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,0,10000); -- Reflective Combine Claymore
    end
    item_lib.return_items(e.self, e.other, e.trade)
end