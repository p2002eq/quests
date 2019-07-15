-- Xoomix Haroinoddin for Find Xoomix quest in Gunthak

-- say block
function event_say(e)
    local qglobals = eq.get_qglobals(e.self,e.other);

    if(e.message:findi("Hail")) then
        e.self:Emote("whispers in a low voice 'Please. Please help me. I am weak and being [" .. eq.say_link("Who is holding you captive?", false, "held captive") .. "] here against my will.'");
    elseif(e.message:findi("captive")) then
        e.self:Say("What are you doing?!?! Keep your voice down! You don't know who I am, you are just another adventurer who will look and feel sorry for me, but will do nothing to help!");
    elseif(e.message:findi("tools") and qglobals["Helping_Xoomix"] == 1) then
        e.self:Say("Well, I have many tools that I have either lost while in this place or that were taken from me because the guards felt they had too much value for me to possess them. I also need my gearbox from back home to construct my compass that I need to escape this place. I could set sail anytime I want, but I did not want to risk setting out to sea and dying alone because I didn't know my bearings. If you could [" .. eq.say_link("I will find your possessions", false, "find my possessions") .. "] then I could make something that Golsodix would know came from me and he could give you my gearbox.");
    elseif(e.message:findi("possessions") and qglobals["Helping_Xoomix"] == 1) then
        e.self:Say("'That is great news, " .. e.other:GetName() .. "! I will need you to collect four things for me, if you are up to the challenge. My quarterstaff, silvered micro servos, metallic oil, and personal toolbox. If you can find these things, I can make you something to take to Golsodix. Please return to me with these things when you have found them, and make haste because I have grown quite tired being stuck here for so long.");
    end
end

-- trade block
function event_trade(e)
    local item_lib = require("items");
    local qglobals = eq.get_qglobals(e.self,e.other)

    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 321979})) then -- Clockwork Eye
        e.self:Say("How did you get this? Is it possible you come from my friend Golsodix? I am very sorry for yelling at you. You have no idea how being here has broken my spirit. I almost lost all hope and given up many times, but I knew my friend was out there and would send someone for me. If you can help me escape, I will certainly need my [" .. eq.say_link("What tools?", false, "tools") .. "].");
        eq.set_global("Helping_Xoomix", 1, 0, "F"); -- set qglobal to indicate that player has started to help Xoomix

	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 321980, item2 = 321981, item3 = 321982, item4 = 321983}) and qglobals["Helping_Xoomix"] == 1) then -- Xoomix's Quarterstaff, Metallic Oil, Silvered Micro Servos, Xoomix's Toolbox
        e.self:Say("I don't believe it. I never thought I would ever see these tools again. It is quite clear that you intend to help me and for that I am grateful. Here is a quick little something that put together for Golsodix. Bring him this and ask him for my gearbox. Once I have that, I think I can finally get home! Please come back soon!");
        e.other:SummonItem(321984); -- Tinkered Contraption

    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 321985}) and qglobals["Helping_Xoomix"] == 1) then -- Xoomix's Gearbox
        e.self:Say("his is it indeed! It has everything I need in here to return home. Please take this charm that I have carried with me for many years. It has brought me good luck throughout my ordeal here and now that I am returning home, I do not think I will need it anymore. Safe travels to you " .. e.other:GetName() .. ", I must now ready my boat and finish my compass. May Lord Brell bless you forever!");
        e.other:QuestReward(e.self,0,0,0,0,361003,eq.ExpHelper(51, 5)); -- Xoomix's Mystical Charm, ~5% lvl 51 exp
        eq.set_global("Helping_Xoomix") -- clean up qglobal at quest completion

    item_lib.return_items(e.self, e.other, e.trade)
end
