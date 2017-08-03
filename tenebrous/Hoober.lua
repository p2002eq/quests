local beaten = false
local behari = false

function event_spawn(e)
    eq.set_timer("banter1", 110000);
    beaten = false
    behari = false
end

function event_timer(e)
    if (e.timer == "banter1") then
        e.self:Emote("appears to be playing a game with invisible pieces. He stares intently at the air in front of him, deep in strategic planning before reaching out, grabbing an unseen token and moving it silently to another space in midair. A moment later, his head jerks up and he stares directly at his pet,");
        e.self:Say("what? I did not and I resent your implication that I did. Like I would need to! If this is the way you are going to be then I don't even want to play! he states and spins around indignantly. The elemental pet has no response. ");
        eq.set_timer("banter2", 110000)
    elseif (e.timer == "banter2") then
        e.self:Emote("blurts out 'you can keep the whole lot of 'em I tell you!' He stares at his elemental companion a moment, who does not seem to respond in any way, to which Hoober retorts, 'Well that may be what you think, but what do you know?");
        e.self:Say("You aren't even a day old for pity's sake! And who have you ever been in love with anyway? After giving his silent, summoned companion ample time to respond, Hoober continues, 'Sure she does and how come you've never mentioned her before now? Cause you're full of crackers I say. You really get under my skin with that high and mighty attitude you know?' ");
        eq.set_timer("banter3", 110000);
    elseif (e.timer == "banter3") then
        e.self:Emote("is fuming angry. It takes you a moment to be sure, but it looks as if he is upset with his elemental pet.");
        e.self:Say("Well you broke it, that's why, you idiot! I always tell you that you play to rough, but not you don't want to hear it, no,' he hollers as he waves a locket in the face ofthe summoned creature. The chain on the locket is broken and the elemental has no response whatsoever to the continued berating, 'I'll need you to fetch me a pitcher of water and a bunch of vegetables for a salad otherwise we may never hear from her again and then all hope for peace among the tribes will be lost. Now go.");
        e.self:Emote("looks satified as his pet stands at his side, resolute and unmoving. ");
        eq.set_timer("banter4", 110000);
    elseif (e.timer == "banter4") then
        e.self:Emote("assumes a very serious and conspiratorial air as he whispers so that he thinks only his elemental pet may hear, 'The wombats will come, for they have a new leader, and he brings them frightening power, he does. It will he be he who is foolish indeed that does not fear the wombat.' The summoned creature sits in silence, no response forthcoming. ");
        eq.set_timer("banter5", 110000);
    elseif (e.timer == "banter5") then
        e.self:Emote("looks utterly exasperated and yells at his elemental pet,");
        e.self:Say("No, no, no!! First the rabbit goes around the bend and then the child can enter so that the flowers will bloom giving new life to the faceless jar of wisdom. If I have told you that once I have told you that one thousand times, please do not make me repeat myself.' He pauses for a moment, collecting himself, before addressing his animated companion once more, 'now, we were discussing the affairs of state?'");
        e.self:Say("Well my mother lived underground with the rest of them, don't you know. Where would you expect a royal envoy to live, in the middle of a raging storm? Of course she would, but enough about me, tell me about your mother...' He looks at his elemental pet for a moment as though awaiting a reply, and responds to the absolute silence, 'really, is it as drafty up there as one would assume?' ");
        eq.set_timer("banter1", 110000);
    elseif (e.timer == "hooberfd") then
        eq.depop_with_timer();
    end
    eq.stop_timer(e.timer)
end

function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("snaps his eyes in your direction. He gestures wildly with his hands and face, his voice crackling with insanity as he speaks,");
        e.self:Say("Are you talking to me? I don't see anyone else around so you must be talking to me. Did you come to discuss matters of high importance like the struggle between the Violet Tri-tubes and their oppression under the iron fist of the Barrel Trees? Or perhaps you wish to speak directly with the animals for I can show you how. If you came in search of the power of flight, you would not be the first.' ");
    elseif(e.message:findi("Behari")) then
        if behari then
            e.self:Emote("sobs into his hands, 'horrible tings... such horrible things... I remember this man named Behari, take this, it belonged to him before... before I... 'suddenly, Hoober begins to shake uncontrollably. He starts to look at you, something between fear and dementia behind his eyes,");
            e.self:Say("Go! GO NOW! It's starting again, I shouldn't be around decent people! LEAVE ME ALONE! Stop treating me like a fool, I will leave the money in a sack under the seventy-third pillar from the giant froglok just as I agreed with your master NOW GET AWAY FROM ME!' His shouts echo throughout the mountains as he tears off at a full sprint. ");
            e.other:QuestReward(e.self,0,0,0,0,5996); -- Aisha'a Locket
            eq.depop_with_timer();
        else
            e.self:Say("He was a man. He was a good man. Born on a rock in a lake in world from a reality far from this coil you and I call our homes. He was the hero of his existence, fighting for those that sought to destroy you as part of the endless struggle to remove the giant rat from power. Did you know that with the proper care and education, elemental pets can make wonderful conversationalists?' ");
        end
    elseif(e.message:findi("love potion")) then
        e.self:Emote("sort of calms as he speaks very clearly, very deliberately,");
        e.self:Say("Do not trifle with me on this. A [" .. eq.say_link("luclin clover") .. "], a [" .. eq.say_link("drop of moonlight") .. "] and the [" .. eq.say_link("essence of sonnet") .. "] bring me these things and you will share eternity with whomever you treasure most.' ");
    elseif(e.message:findi("Luclin clover")) then
        e.self:Say("These are abundant throughout the thicket, now go.");
    elseif(e.message:findi("Drop of moonlight")) then
        e.self:Say("Any skilled astrologer can get you this thing. Bring it to me now.");
    elseif(e.message:findi("Essence of sonnet")) then
        e.self:Say("A difficult thing to acquire, find a bard and get it done, waste no more of time, bring me the ingredients!");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if beaten and item_lib.check_turn_in(e.self, e.trade, {item1 = 5994}) then -- Elixir of Obsession
        e.self:Emote("coughs a bit as you feed him the elixir. With a bit o a start he comes around to full consciousness with a calm in his eyes. 'Do I know you?' he asks. ");
        behari = true
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5994})) then -- Elixir of Obsession
        e.self:Emote("struggles as you try to force-feed him the elixir, making you think twice about the wisdom of force-feeding something to a madman. 'I DON'T WANT TO DRINK MY JUICE, MOTHER! NOW GET YOUR HANDS OFF OF ME!' he shouts.");
        e.other:QuestReward(e.self,0,0,0,0,5994); -- Elixir of Obsession
        e.self:AddToHateList(e.other,1)
    end
    item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
    if(e.joined == true) then
        eq.stop_all_timers(e.self);
        eq.set_next_hp_event(20);
    end
end

function event_hp(e)
    if (e.hp_event == 20) then
        e.self:SetAppearance(3);
        e.self:SetInvul(true)
        e.self:WipeHateList();
        beaten = true
        eq.set_timer("hooberfd", 300000);
    end
end