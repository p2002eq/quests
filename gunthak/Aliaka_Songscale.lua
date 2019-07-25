-- Aliaka Songscale in Gunthak for Wizard quest

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("flinches as you initially approach, but appears more at ease as she realizes you are not an immediate threat. 'Ah, thank Prexus you are not one of them. Not that this guarantees that you are any less dangerous, so please state your intentions clearly. We have suffered much [" .. eq.say_link("What abuse?", false, "abuse") .. "] at the hands of other races, and in particular I do not appreciate the pain that the sea trolls inflict upon my sisters.'");
    elseif(e.message:findi("abuse")) then
        e.self:Emote("speaks, her visage one of sadness and despair, 'This shore has forever been the home of my people, but we are practically driven into hiding now, forced to flee and scatter when the Luggalds come near. At their whim, the fiendish beasts lance us with their icy spears. The cold chill bites and the pain is horrible. In fact, their are still fragments of the dark ice embedded in my scales since their last attack. I believe they only mean to torment and not kill us, as so far there have been few deaths. Now that you understand our plight, what is it you want from me?'");
    elseif(e.message:findi("ice")) then
        e.self:Emote("smirks, 'Forgive my hesitance in trusting a stranger, but the frozen shards are quite painful, and removing them would be even more so. Perhaps we can trade services? I would give you some willingly if you would complete a [" .. eq.say_link("What task?", false, "task") .. "] first.'");
    elseif(e.message:findi("task")) then
        e.self:Say("As a sign of loyalty, and to avenge the innocent blood that was spilt by the Lugglds, I would like you to cut down some of the fiends and bring proof of their demise. Use whatever means necessary. Grant them no quarter and expect none in return. For each of their dark hearts I will trade pieces of the ice that you seem so interested in. I will accept nothing else.");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 358007})) then -- Luggald Heart
        e.self:Emote("clenches her jaw as she wrenches a glimmering obsidian shard from between her scales. 'As promised, here is what you desired. What I wouldn't give to have them taste their own bitter magic.'");
        e.other:SummonItem(354008); -- Fragment of Dark Ice 
    end

    item_lib.return_items(e.self, e.other, e.trade)
end
