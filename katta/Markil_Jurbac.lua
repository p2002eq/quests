---- Quest:Traitor to the Validus Custodus

function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings, " .. e.other:GetName() .. ". I am Governor Markil Jurbac. It is my primary duty to uphold the law in Katta Castellum. How may I be of assistance to you?");
	end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18331})) then -- Sealed Message
        e.self:Emote("lowers his head and mourns the loss of Halle. 'Tis the greatest shame of all when good people are lost to the most cowardly of deeds. I will seek Governor Tilbok's council in this matter... I have never been able to wrap my head around this kind of treachery and he may very well have more information. Give this dossier to Tilbok, it has all of the information he will need.");
        e.other:Faction(168,1); -- Katta Castellum Citizens
        e.other:Faction(350,1); -- Validus Custodus
        e.other:Faction(206,1); -- Magus Conlegium
        e.other:Faction(228,-1); -- Nathyn Illuminious
        e.other:Faction(55,-1); -- Coterie of the Eternal Night
        e.other:Faction(139,-1); -- Hand of Seru
        e.other:Faction(284,-1); -- Seru
        e.other:Faction(96,-1); -- Eye of Seru
        e.other:Faction(138,-1); -- Hand Legionnaries
        e.other:QuestReward(e.self,0,0,0,0,29844,10000); -- Dossier: Case 3463827
    end
    item_lib.return_items(e.self, e.other, e.trade)
end