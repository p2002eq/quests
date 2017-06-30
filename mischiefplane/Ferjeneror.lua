--Ferjeneror 
--Plane of Mischief 1.0

--QuestNPC that should summon a Deck of Spontaneous Generation upon the hand-in of either all 4 color Cod cards or one King Cod Card.  
 

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1791})) then --Check for King Cod Card 
        e.self:Emote("smirks");  --PLACEHOLDER - NEED QUEST DIALOG IF ANY EXISTS
		e.other:QuestReward(e.self,0,0,0,0,17054,100);  -- Deck of Spontaneous Generation
    end
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1787, item2 = 1788, item3 = 1789, item4 = 1790})) then  --REQUIRES 4 COLORED COD CARDS
        e.self:Emote("smirks");  --PLACEHOLDER - NEED QUEST DIALOG IF ANY EXISTS
		e.other:QuestReward(e.self,0,0,0,0,17054,100);  -- Deck of Spontaneous Generation
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end

--Hail text not verified.  Prior posts show he will attack you if you tell him "No"
function event_say(e)
    if(e.message:findi("Hail")) then
        e.self:Say("Hello  ".. e.other:GetName() .. ".  Do you have a gift for me?"); -- leads player into response of "No" which triggers below
    end
	
	if(e.message:findi("No")) then
		e.self:AddToHateList(e.other);  -- attack player
	end
end

