local proof = 0;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You'd better run along, if ya know what's best for ya!");
	elseif(e.message:findi("lovely night for a stroll")) then
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("Yes, it is a lovely night for a walk, especially with a good friend. Tell me, are you a [friend]?");
		else
			e.self:Say("Carson hates you, and I hate you... I'd kill you where you stand, but I just polished my dagger last night.");
		end
	elseif(e.message:findi("friend")) then
		if(e.other:GetFaction(e.self) < 6) then
			e.self:Say("My memory is a bit fuzzy. If you are a friend, prove it to me.");
		else
			e.self:Say("Carson hates you, and I hate you... I'd kill you where you stand, but I just polished my dagger last night.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13903})) then -- Bent Card
		e.self:Say("'Ah, good, it seems we have much in common after all. Take this back to the Circle, before the city guards come nosing around over here.");
		e.other:Faction(31,5,0); -- Carson McCabe
		e.other:Faction(48,3,0); -- Coalition of Tradefolk Underground
		e.other:Faction(273,-1,0); -- Ring of Scale
		e.other:Faction(149,5,0); -- Highpass Guards
		e.other:Faction(214,5,0); -- Merchants of Highpass
		e.other:QuestReward(e.self,0,0,0,0,18722,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
