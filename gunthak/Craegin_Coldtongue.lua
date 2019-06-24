function event_say(e)
    local qglobals = eq.get_qglobals(e.self,e.other);
    if(e.other:GetClass() == 15) then
        if(e.message:findi("Hail")) then
            e.self:Emote("glances at you with eyes of energy. He peers across your armor and then finally seems to come to a decision and points to the ground. He kneels down and then begins to draw something in the dirt. You see the outline of a wolf begin to take shape. You then see a humanoid figure standing next to the animal. He draws a circle around them, presumably to show that they are connected somehow. Craegin looks up at you and points to the wolf and then at you. You think he is asking if you are a ["..eq.say_link("I am a Beastlord",false,"Beastlord").."]. His gaze pierces your eyes waiting for an answer.");
        elseif(e.message:findi("Beastlord")) then
            e.self:Emote("nods quickly and begins to draw again in the sand. He points at the humanoid figure and then at himself. Apparently he has drawn himself. He looks up at you and you nod back in understanding. He points to the wolf and then points out onto the island. He grabs a handful of dust and blows it across the wolf's picture. Perhaps his ["..eq.say_link("I am a Beastlord",false,"warder").."] is sick and lost on the island somewhere. He looks as if he might want to ["..eq.say_link("Will you draw more about your warder?",false,"draw").."] more.");
        elseif(e.message:findi("draw more about your warder")) then
            e.self:Emote("nods furiously. He begins drawing again in the sand. you see some sort of spear being thrown at the wolf. He then draws a collar of some sort and then draws an arrow to the wolf. Apparently his warder has been injured and captured somehow by something on the island. You can see the pain in the barbarian's eyes as he looks at you hopefully. He hands you a small emblem of some kind and points towards the island.");
            e.other:SummonItem(359032); -- Stone Emblem
        elseif(e.message:findi("wish to draw for me") and qglobals["Craegin_Spell"] == 1) then
            e.self:Emote("kneels to the ground once more and begins to draw. He draws the picture of a skull in the dirt and then draws several squiggly lines beneath. You begin to realize he's describing a ["..eq.say_link("What Cave System?",false,"cave").."] system beneath the island.");
        elseif(e.message:findi("cave") and qglobals["Craegin_Spell"] == 1) then
            e.self:Emote("nods at you. He reaches for a bag at his waist and pulls out a few grains of fine black powder. He rubs the black powder carefully across the cave sketch. He makes a sort of digging motion with his hands and points back toward the island. He must have found the black powder in the cave system on the island somewhere.");
        end
    else
        e.self:Emote("shivers quietly. You have a hard time believing that a barbarian of his stature could possibly think this climate to be cold. He stares into your eyes for a moment and then shuffles away.")
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359033})) then -- Glowing Collar
        e.self:Emote("looks at you in amazement as you hand the glowing collar to him. He looks as if he might weep for joy at any moment. He holds the collar firmly by the clasp and brings it down to his side. He mumbles some words and the wolf immediately appears beside him. He reaches into his bags and grabs a small stone similar to the one fit into the collar. You reach forward and take it from him. He points at the dirt once more as if he wishes to ["..eq.say_link("What do you wish to draw for me?",false,"draw").."] something for you.");
        eq.set_global("Craegin_Spell",1,0,"F");
        e.other:QuestReward(e.self,0,0,0,0,359010,1000); -- Spell: Bond of the Wild
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359034})) then -- Strange Dark Powder
        e.self:Emote("looks over the dark powder carefully for a moment and then nods at you. He grabs a small bag from his waist and places the dust inside of it. He then takes a second bag and empties another odd powder into the bag. He closes and shakes the bag vehemently and then looks at you expectantly. You nod. He reaches into the bag and pulls a bit of the mixtures out. Unexpectedly he blows the mixture into your face, causing your eyes to burn and your lungs to uncontrollably cough in pain. You fall to the ground for a moment, but the burning subsides. You rise back to your feet and Craegin hands you the rest of the bag of powder.");
        eq.delete_global("Craegin_Spell");
        e.other:QuestReward(e.self,0,0,0,0,359009,1000); -- Spell: Malaria
    end
    item_lib.return_items(e.self, e.other, e.trade)
end