---- Quest:Rakshasa Skulls
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Greetings Traveler. If it is rest you seek then I'm sure you may rest safely within the walls of this outpost. As the sentries keep watch for physical danger I commune with the spirits of this territory to watch for less noticeable threats.");
    end
end

function event_trade(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31839, item2 = 31841})) then -- Resealed Runed Iron Bound Chest & Roshawnas Report of Occurrences
        e.self:Say("It was wise of Roshawna to send you to me instead of risk bringing something so tainted by the dark spirits within the walls of Shar Vahl.");
        e.self:Say("I shall begin the ritual immediately.");
        e.self:Say("What is that?! Look! There is a grimling heading this way followed by what appear to be grimling undead. Defend me while I perform the ritual.");
        e.self:Say("Defend me while I perform the ritual!");
        eq.spawn2(167685,0,0,-975.17,-825.20,6.74,260); -- A possesed griming
        eq.spawn2(167687,0,0,-958.44,-834.88,6.74,260); -- A Reanmiated Grimling
        eq.spawn2(167687,0,0,-979.17,-839.41,1.14,260); -- A Reanmiated Grimling
        eq.spawn2(167687,0,0,-967.86,-838.92,4.63,260); -- A Reanmiated Grimling
        e.other:QuestReward(e.self,0,0,0,0,0,500); --
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31847, item2 = 31848, item3 = 31848, item4 = 31848})) then -- Possessed Grimlings Head & 3x Reanmiated Grimling Skull
        e.self:Say("I am grateful for your assistance. I will be able to complete the rest of the ritual without danger now that the spirits in the skulls have been calmed. Please take this report of occurrences to Scribe Cholsa in Shar Vahl.");
        e.other:Faction(68,10); -- Dar Khura
        e.other:QuestReward(e.self,0,0,0,0,31849,10000); -- Rolekos Report of Occurrences
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10777, item2 = 10778, item3 = 10779, item4 = 10915}) and tonumber(qglobals.Rakshasa) ~= 1) then -- Amulet of Golden Rays, Black Flame Charcoal, Thought Leech Brain & Rakshasa Materialization Ritual
        e.self:Emote("prepares the ritual components according to the ritual instructions.");
        e.self:Say("I will need to maintain my concentration to keep the Rakshasa from escaping back into the spirit realm. If you kill him while he is materialized he will be slain and his body will remain material. Bring me the head of the Rakshasa when he is slain.");
        e.other:Faction(68,10); -- Dar Khura
        eq.spawn2(167713,0,0,-975.17,-825.20,6.74,20); -- Rakshasa Karwoaro
        e.other:QuestReward(e.self,0,0,0,0,0,15000); --
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10916})) then -- Head of the Rakshasa
        e.self:Say("The threat of the Rakshasa appears to be eliminated. You have the gratitude of the Dar Khura for your bravery and assistance. Let us be wary however, the Rakshasa gained his power by allying with dark spirits that may not be indifferent to the Rakshasas death.");
        e.other:Faction(68,30); -- Dar Khura
        e.other:QuestReward(e.self,0,0,0,0,31837,40000); -- Shield of Bane Warding
    end
    item_lib.return_items(e.self, e.other, e.trade)
end