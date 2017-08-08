---- Quest:Snarla's Friendship
function event_say(e)
    fac = e.other:GetFaction(e.self);
    if(fac <= 6) then
        if(e.message:findi("hail")) then
            e.self:Say("Shhh. quiet! This is place of solitude and peace! You [" .. eq.say_link("respect temple") .. "] while you here if you know what good for you!");
        elseif(e.message:findi("respect temple")) then
            e.self:Say("One way guests show respect is to bring the host [" .. eq.say_link("food") .. "]. Something really good would be nice.");
        elseif(e.message:findi("food")) then
            e.self:Say("Lessee. . . Dryad Pate is what I want. Bring me some [" .. eq.say_link("Dryad Pate") .. "] and then you be a good guest. Maybe then I return a favor for you.");
        elseif(e.message:findi("dryad pate")) then
            e.self:Say("I don't know how it made. Talk to the Brargus about it. He the cook.");
        elseif(e.message:findi("necklaces")) then
            e.self:Say("I make many different kinds of necklaces for my friends from fangs of powerful creatures like bear, panther and wolf. You give me your token of friendship and I give you a pouch to keep some stuff in. After you get the stuff and seal the bag, bring it back and I make you a nice necklace to wear. Stuff I need is one Anaconda Skin and three Fangs. Fangs that make good necklaces are Wolf, Bear and Panther. Make sure all fangs are same. Necklaces with different fangs are neat but not as nice as ones with all same fangs, so I only make those ones.");
        end
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8199})) then -- Dryad Pate
        e.self:Say("Ohh. . . This really good, thanks! You take this token of friendship. You all smell the same so this way I know who you are. I can make nice [" .. eq.say_link("necklaces") .. "] for my friends.");
        e.other:Faction(6,20); -- Anchorites of Brell Serilis
        e.other:QuestReward(e.self,0,0,0,0,8270,1000); -- Token of Friendship
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8270})) then -- Token of Friendship
        e.self:Say("Ok, here pouch to collect stuff. Come back when pouch full. Make sure you seal pouch or stuff may fall out.");
        e.other:SummonItem(8270); -- Token of Friendship
        e.other:QuestReward(e.self,0,0,0,0,17263,1000); -- Necklace Component Pouch
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9228})) then -- Sealed Wolf Fang Pouch
        e.self:Say("Oh hello friend, I make this nice necklace for you! You wear this and feel the spirit of the wolf run through you!");
        e.other:Faction(6,20); -- Anchorites of Brell Serilis
        e.other:QuestReward(e.self,0,0,0,0,8258,1000); -- Wolf Fang Necklace
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9229})) then -- Sealed Bear Fang Pouch
        e.self:Say("My friend returns again! I make this nice necklace for you. Wear this and feel the essence of the bear flow through you.");
        e.other:Faction(6,20); -- Anchorites of Brell Serilis
        e.other:QuestReward(e.self,0,0,0,0,8261,1000); -- Bear Fang Necklace
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9230})) then -- Sealed Panther Fang Pouch
        e.self:Say("Hello again friend. This nice panther fang, here you take this necklace I make you. It imbued with spirit of the cat.");
        e.other:Faction(6,20); -- Anchorites of Brell Serilis
        e.other:QuestReward(e.self,0,0,0,0,8257,1000); -- Panther Fang Necklace
    end
    item_lib.return_items(e.self, e.other, e.trade)
end