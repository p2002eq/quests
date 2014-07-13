function event_say(e)
	
	if(e.message:findi("Hail")) then
		
		e.self:Say("Good to meet you. " .. e.other:GetName() .. ".  Please look around.  I have much to offer.  I am a master woodworker.  It runs in the Parsini family."); end
	end
	
end

function event_trade(e)
	local item_lib = require("items");
	
	-- [FLAG: Manual conversion needed: $itemcount{] if($itemcount{18833} == 1) then{
		
		e.self:Say("I have been waiting for someone to come and retrieve this staff.  Here you are.  You will have to combine it with treant resin and an Odus pearl.  You can find Odus pearls in the water in the harbor. As for the resin. I can make it if you can find me some treant shards.  Maybe another woodworker or cobbler in Qeynos has some.");
		
		e.other:SummonItem("17917"); --Peacekeeper Staff container
		
		e.other:Faction("211","10"); -- +Merchants of Erudin
		
		e.other:Faction("145","10"); -- +High Council of Erudin
		
		e.other:Faction("147","10"); -- +High Guard of Erudin
		
		e.other:AddEXP(2432);
		
	
	
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13824})) then--Wooden Shards
		
		e.self:Say("Wonderful work!! These shards will work nicely. Here you are then. I found a few flasks of treant resin in the back. You can have one. Thanks again. It kept me from having to go out and hunt treants.");
		
		e.other:SummonItem("13822"); --Treant Resin
		
		e.other:Faction("211","10"); -- +Merchants of Erudin
		
		e.other:Faction("145","10"); -- +High Council of Erudin
		
		e.other:Faction("147","10"); -- +High Guard of Erudin
		
		e.other:AddEXP(2432);
		
	end
	
end

--END of FILE Zone:tox  ID:38122 -- Emil_Parsini


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
