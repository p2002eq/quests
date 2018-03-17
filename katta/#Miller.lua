---- Quest:The Conspiracists: Arbogast and Miller
function event_say(e)
    if(e.message:findi("hail")) then
        e.self:Say("Ho there.  Whatcha want?  Yer interruptin' Arboast's story- he was just in the middle of laying some truth on me.");
    end
end

function event_signal(e)
    if(e.signal == 1) then
        e.self:Say("Yeah, you tell 'em Arbogast!  I bet this one doesn't even know what's going on right under his nose in this here city.  Like for example, you probably don't even know the truth about about his importantness Phenic Dionicas do you?");
    elseif(e.signal == 2) then
        e.self:Say("Yeah, splash it right in his unliving face!");
    elseif(e.signal == 3) then
        e.self:Say("Ooh! I know, I know!  Nathyn Illuminious!!!");
        eq.signal(160112,1,2500); -- Arbogast
    elseif(e.signal == 4) then
        e.self:Emote("beams a smile your way.");
    elseif(e.signal == 5) then
        e.self:Say("A bloody, boldfaced lie!");
        eq.signal(160112,2,2500); -- Arbogast
    elseif(e.signal == 6) then
        e.self:Emote("looks a bit distressed and says to Arbogast, 'You said he would die getting these and we could keep...' Arbogast silences Miller with a kick under the table and smiles broadly at you, 'Well done and my very sincere thanks to you. The cloak is in the bank, Miller and I each hold a piece of it. We will go get it for you now.' Miller and Arbogast lean in close to each other and discuss this in whispers for a moment before getting up and heading out, Miller looking most dejected.");
        eq.signal(160112,4,500); -- Arbogast
    elseif(e.signal == 7) then
        e.self:say("Wait for me!");
        eq.start(24);
    elseif(e.signal == 8) then
        e.self:Emote("and Arbogast do their business with the bank, Miller retrieving a heavy brown cloak and Arbogast a beautiful golden clasp. They look up at each other, unable to bear the thought of actually parting with their treasures when Arbogast says, 'You know what? I think we'll keep them. Thanks for your help, don't be a stranger. Come now Miller, let's not be a bother.' With that, they both tear off out the door");
    elseif(e.signal == 9) then
        e.self:Say("Wait for me!");
        eq.spawn2(160376,26,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
        eq.depop_with_timer();
    end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end