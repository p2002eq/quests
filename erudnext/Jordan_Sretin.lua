-- Jordan Sretin in Erudin for Sailor and Light's Glory quests

-- say block
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Port of Erudin. What can I help you with today?");
    elseif(e.message:findi("Glory")) then
        e.self:Emote("shuffles through some paperwork that is strewn messily before him.  'The Light's Glory, let's see.  Yes it is a merchant ship headed from Freeport to Erudin.  Yes it should have been here a week ago.  Seems we have had a couple ships disappear as of late.  Rumors tell of increased pirate activity.  Seems none of the local guards wants to get involved in investigating this.  Any assistance you could provide would be most appreciated.  I suggest that you travel to Erud's Crossing and talk to a Kerran named Nifta.  He lives near the dock on the isle and has a great wealth of knowledge of the sea and ships that pass through the crossing.  Ask him if he has seen The Light's Glory.");
    elseif(e.message:findi("safe passage"))
        e.self:Say("Fine, we will bargain with this despicable troll.' Jordin quickly scrawls something down on a note.  'Take this back to the troll.  It will buy him a safe trip to Antonica.'");
        e.other:SummonItem(355007);
    end
end

-- returns items
function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end
