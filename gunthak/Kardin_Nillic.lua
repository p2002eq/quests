function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Emote("lifts his gaze from the whitened corpse lying on the bed in front of him. He holds the pale fingers tightly in his hands. As he opens his mouth to speak you shiver as what you thought was a corpse makes a soft moaning sound on the bed next to him. 'What business do you have here? Death grows near for him, what comfort can you hope to bring him in this ["..eq.say_link("What plagues this place?", false, "plagued").."] place?");
    elseif(e.message:findi("plagued")) then
        e.self:Say("The plague of Innoruuk has infested this island. We now know that many of the fish that can be caught here are diseased and should not be eaten. Of course this knowledge does little to abate the fevers of those already stricken. The Broken Skull pirates seem to be mysteriously ["..eq.say_link("How are they immune?",false,"immune").."] to this plague.");
    elseif(e.message:findi("immune")) then
        e.self:Say("Somehow the pirates are able to avoid becoming ill from eating the fish here. We know they're eating the same manner of fish that we are, but something else must be protecting or perhaps curing them of the toxins in the fish. In fact, they seem to always be in good spirits with the boisterous racket of ["..eq.say_link("What singing?",false,"singing").."] and fighting that echoes over the island every fortnight.");
    elseif(e.message:findi("singing")) then
        e.self:Emote("snickers softly. 'The pirates apparently enjoy songs at meal time. A group of bards seem to have joined them. They sound as if they were trained at the Wind Spirit's Song, but the faded song pages I've seen of theirs read like students of Marsheart's. All the pages I've seen have been faded and largely illegible or I would know for sure.");
    end
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 359022})) then -- Faded, Watermarked Book
        e.self:Emote("begins to flip through the pages of the faded song book. He studies one page, shakes his head and then flips through several more pages. Finally a smile of recognition creeps across his lips and he chuckles, 'Definitely a student of Jusean, but there's something else. Some of the chords are unfamiliar even to me. You'll have to ask Evanesque to take a look at them. Maybe he can tell you who wrote it.' ");
        e.other:QuestReward(e.self,0,0,0,0,359023,1000); -- Faded Songbook
    elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 359024})) then -- Transcribed Songbook
        e.self:Emote("takes the book from you and begins to hum the tune scawled on the pages. As you listen, you notice the whitened body next to Kardin cough. He seems to have regained some of his strength. You begin to notice that as Kardin sings the tune, his friend is regaining strength. By the end of the song, he is able to prop himself up on one arm and reach toward Kardin. 'So now we know the secret of the pirate's health. The power of the song keeps the disease at bay. Thank you for saving my friend, Loanni. We are in your debt, but we are even more in debt to whoever it was that wrote this song. Whoever it was certainly has much to offer a student of music.' ");
        e.other:QuestReward(e.self,0,0,0,0,359002,1000); -- Song: Aria of Asceticism
    end
    item_lib.return_items(e.self, e.other, e.trade)
end