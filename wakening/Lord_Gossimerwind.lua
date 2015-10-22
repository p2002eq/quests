function event_say(e)
    if(e.other:GetFaction(e.self) < 5) then -- indiff?
        if(e.message:findi("hail")) then
		    e.self:emote("blinks at you a few times then speaks in a strangely musical, draconic voice. 'You vish to azzizt ze count of ze Tunarean Faerie Dragons?");
	    elseif(e.message:findi("assist")) then
	        e.self:say("I vish to ztop ze Kromzek Foreman from continuing ta deztroy thiz land. Iv you vish to azzizt you can zlay ze Foreman and bring me hiz helm az proof.");
    elseif(e.message:findi("hail")) then
        e.self:say("You are no friend of the Tunarean Court.  Leave me.");
    end
end

function event_trade(e)
    if(e.other:GetFaction(e.self) < 5) then -- indiff?
        if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24873})) then
            e.self:say("Good, ze Foreman iz dead and now we will be left in peazz.  Take diz az a zign of my friendship.");
            e.other:Faction(344, 30);
            e.other:QuestReward(e.self,0,0,0,0,24868,100);
        end
    end
	item_lib.return_items(e.self, e.other, e.trade)
end

--fiddle