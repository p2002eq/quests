
function event_say(e)
	if (e.other:GetFaction(e.self) < 5) then --amiable or lower
		if (e.message:findi("hail")) then	
			e.self:Say("Greetings, " ..e.other:Race().. ". You know who I am, but I only vaguely know of you. My purpose is simple, I will rule these lands like my father, and my grandfather before him. All [" .. eq.say_link("tasks") .. "] but two are inconsequential to me.");
		elseif (e.message:findi("tasks")) then	
			e.self:Say("The tasks are simple, " ..e.other:Race().. ". I wish the death of the other '[" .. eq.say_link("powers") .. "]' of this frozen waste land. If you are able to destroy either of my mortal foes, bring me proof of your exploits and you will be known as the hero of Kael Drakkel.");
		elseif (e.message:findi("powers")) then	
			e.self:Emote("laughs deeply. 'I speak of the foolish old dragon Yelinak and that pitiful Dain Frostreaver.'");
		end
	end

end

function event_trade(e)

	local item_lib = require('items');
	if (e.other:GetFaction(e.self) == 1) then --ally
		if (item_lib.check_turn_in(e.self, e.trade, {item1 = 30501})) then
			e.other:QuestReward(e.self, 0,0,0,0, 25858, 200000);
			e.other:Faction(49, -100); --coldain
			e.other:Faction(67, -100); --dain
			e.other:Faction(189, 75); --kromzek
			e.other:Faction(179, 75); --KT
		elseif (item_lib.check_turn_in(e.self, e.trade, {item1 =  24984})) then	
			e.other:QuestReward(e.self, 0,0,0,0, 25857, 200000);
			e.other:Faction(49, -100); --coldain
			e.other:Faction(67, -100); --dain
			e.other:Faction(189, 75); --kromzek
			e.other:Faction(179, 75); --KT
		end
		e.self:Emote("laughs deeply as he takes the bloody head then gives you your reward.");
	else
		item_lib.return_items(e.self, e.other, e.trade);	
	end
end

