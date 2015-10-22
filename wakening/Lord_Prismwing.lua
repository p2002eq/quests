function event_say(e)
    if(e.message:findi("hail")) then
        e.self:emote("flutters his wings rapidly, sending shimmering dust through the air around you. Although he speaks in high pitched chirps you somehow understand his meaning. Hello $name, I am the Count of the Tunarean Drixies. Are you a friend of the Tunarean Court?");
    end
    if(e.other:GetFaction(e.self) < 5) then -- indiff?
        if(e.message:findi("friend")) then
		    e.self:emote("I am in need of some help. One of my heralds was sent to deliver a message to the Othmir in the Cobalt Scar some time ago and has not returned. I fear for his safety. If your travels should lead you in that direction please attempt to find news of my missing herald.");
	    end
    end
end

function event_trade(e)
    if(e.other:GetFaction(e.self) < 5) then -- indiff?
        if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24876})) then
            e.self:say("Thank you for your assistance, though I am greatly saddened by the death of my herald.  Truly you are a friend of the Tunarean Court.  Take this crest as a token of my gratitude.");
            e.other:Faction(344, 30);
            e.other:QuestReward(e.self,0,0,0,0,24867,100);
        end
    end
	item_lib.return_items(e.self, e.other, e.trade)
end

--fiddle