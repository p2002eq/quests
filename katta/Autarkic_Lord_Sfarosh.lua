---- Quest:Vampyre Troubles
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Emote("chants in an ancient language"); -- adlib for debug.
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Meddling fleshlings! Why have you pulled back to this forsaken castellum? Do you fear that I will seek vengeance on Nathyn Illuminious and the city that shelters him for my years of captivity here? Or do you seek something more dangerous, knowledge of the dark path of shadows?");
        eq.signal(160484,1,20000); -- #Incantator Jak Masric
    elseif(e.signal == 2) then
        e.self:Say("A simple question indeed. I simply supplied him with Akhevan blood for his experimentation, that is all. The Order of Autarkic Umbrage is no friend of the Akheva and it was possible that his research could uncover some useful information for my order. Valdanovs own motivation for his experimentation was none of my concern, but the outcome is quite fascinating I must admit.");
        eq.signal(160483,1,20000); -- #Praecantor Selis Dawneyes
    elseif(e.signal == 3) then
        e.self:Say("I am amazed at how little you fleshlings know of what occurs within the very walls of your own castellum. It is known by my Order that Akhevan blood has strange mutagenic effects on the bodies of non-akheves if introduced to their circulatory systems. The process by which the Shadow Tegi are infused with the blood is quite complicated and painful but I would deduce that a vampyre like Valdanov merely had to ingest the blood for the mutagenic agents to effect his physiology, causing the permenent change into what I believe you call a Vampyre Volatilis. I have no dealings with Valdanov since his mutation as I was imprisoned in Nathyns mansion until freed by these foolish fleshings.");
        eq.signal(160485,1,20000); -- #Theurgus Ajeea Polaja
    elseif(e.signal == 4) then
        e.self:Say("I was paying a visit to Valdanov with more Akhevan blood, not knowing he had already been banished by Nathyn from Katta Castellum for becoming the monster that he became. I must admit, Nathyn is a powerful and cunning creature. He was prepared for my arrival, captured me with his sorceries, and imprisoned me in that enchanted chest. I was not offered an explanation, nor do I know how he discovered my dealings with Valdanov, I assume he obtained that knowledge from questioning Valdanov about his mutation.");
        e.self:Say("It seems some allies are arriving! Foolish fleshlings, run while you have the chance!");
        eq.signal(160485,2,20000); -- #Theurgus Ajeea Polaja
    elseif(e.signal == 5) then
        e.self:Say("Your feeble fleshling magic has failed you! Your souls shall be slaves of the Order of Autarkic Umbrage!");
        eq.signal(160483,3,5000); -- #Praecantor Selis Dawneyes
    elseif(e.signal == 6) then
        e.self:Say("Attempt to slay me if you so desire, and if you succeed it matters not. I will return as I am a creature of shadows and shadows never die, merely slumber!");
        eq.spawn2(160481,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #Autarkic_Lord_Sfarosh
        eq.spawn2(160486,0,0,-25,-762,4,160);
        eq.spawn2(160486,0,0,-164,-760,4,96);
        eq.spawn2(160486,0,0,-30,-901,4,224);
        eq.depop();
    end
end