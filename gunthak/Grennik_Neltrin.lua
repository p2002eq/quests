-- Grennik Neltrin for blood quests in Gunthak

-- say block
function event_say(e)
    if(e.other:GetClass() == 2 or e.other:GetClass() == 6 or e.other:GetClass() == 10) then
        if(e.message:findi("Hail")) then
            e.self:Say("Hello. Have you been exploring the island? I came here to discover the secrets of the Broken Skull trolls but I have yet to even explore the island. Rumors that their high priest Nadox held the power to cure any disease have been drifting around Norrath for some time. I've come to see if the rumors are true. Unfortunately the island is much more dangerous than I had imagined and I haven't found anything useful. If you find anything having to do with the troll High Priest, please bring it to me.");
        end
    else
        e.self:Say("Hello, " .. e.other:GetName() .. ". Nice weather isn't it?  Well considering our location I mean.  I somehow doubt that the sun ever shines on this cursed rock.");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359053})) then -- Glowing Black Potion
        e.self:Emote("holds the vial carefully between her fingers as she spins it slowly in the light. 'Yes I believe the potion is complete now. Of course we can never be certain until one of us drinks it. Since you prepared it would stand to reason for you to try it.'");
        e.self:Emote("lifts the dark potion towards you and you reach out and take it from her. You take a deep breath and bring the potion to your lips. The smell nearly makes you faint, but you regain your composure and swallow it in one giant gulp."); -- modified from original 3rd person perspective, which made no sense...
        e.other:Message(15,"You are suddenly filled with dark warmth as the potion slides down into your stomach. You can almost sense it invading your body, battling with your defenses. You stomach turns as the venom and blood mixes in your stomach and you fight the urge to pass out. You focus all of your energy on combating the poison inside you and your body begins to turn the venom. Eventually the poison grows silent inside you and only a slight warmth is left in its place. You have conquered the poison.'")

        if(e.other:GetClass() == 10) then
            e.other:QuestReward(e.self,0,0,0,0,359525,500000); -- Spell: Blood of Nadox, ~2% exp at lvl 52
        elseif(e.other:GetClass() == 2 or e.other:GetClass() == 6) then
            e.other:QuestReward(e.self,0,0,0,0,359012,500000); -- Spell: Pureblood, ~2% exp at lvl 52
        end
    end

    item_lib.return_items(e.self, e.other, e.trade)
end