-- flavor text

-- say block
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Well hey there, young'un. What brings you to this neck of the woods?  Lookin' to buy one of my trained [" .. eq.say_link("You sell drogmors?", false, "drogmors") .. "], are ya?  Well ya come to the right place.  I've the best prices in all of the land when it comes to drogmors.  And you'll not find a better display of fine animals anywhere!  So if ya got the coin and the inclination, I've got just the thing to improve your traveling situation.  Step right up and take a look.");
    elseif(e.message:findi("drogmors")) then
        e.self:Say("Ye've got an eye for quality.  After we [" .. eq.say_link("Where did you find them?", false, "found them") .. "], I raised these beasts up from wee little ones, I did.  Now the trolls would just as soon turn a drogmor into a tasty meal as look at 'em, but I know how to train the docile beasts for riding.  By the look on yer face I know what yer thinking.  They may seem a mite lumbering and ponderous, but once they get to going you'll not be disappointed.  They can match a horse, hoof step for hoof step.  What do you say, stranger?  I have to run a business and the drogmors need to keep out of the stew pot.");
    elseif(e.message:findi("find them") or e.message:findi("found them")) then
        e.self:Emote("scratches at the stubble on his chin thoughtfully, 'Aye, it were another of our sailing trips, lookin' for trouble and treasure as was usual.  Why just a bit west of here, I mean south...Or was it southwest?  Pah, no matter.  We moored on an uncharted isle inhabited by the drogmors and I convinced the Cap'n to bring a few back.  The rest is history.'");
    end
end

-- return items
function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
