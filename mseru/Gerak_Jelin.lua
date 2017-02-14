function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Emote("gasps for air upon hearing your voice. 'Oh, you scared me! Try not to sneak up on people anymore ok?");
    elseif(e.message:findi("worried")) then
        e.self:Say("You talked to her? Surely she didn't come right out and say that though, that would get her removed from the Hand, and most definately the city. I am glad you were smart enough to read her emotions to see that she thought of me. It really makes my heart warm and gives me hope. It is difficult living here, we are under constant attack, and have no way to get food. I wish I had some [good news] for her.");
    elseif(e.message:findi("good news")) then
        e.self:Say("Yeah, it looks grim to anyone in this aweful place. I wrote her this letter when i found out that I was being exiled, but did not get a chance to give it to her. If you want to risk it, you can take it to her. Make no mention it is from me. She is loyal to the city and would not want to be cast out because of me.");
        e.other:SummonItem(6269); -- Tattered Letter
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end