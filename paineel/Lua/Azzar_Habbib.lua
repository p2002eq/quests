function event_say(e)
	
	if(e.message:findi("Hail")) then
		e.self:Say("I'm not in any mood for conversation. My favorite hat was torn right from my head by a gigantic bat the other night and I am quite upset.");
	end
	
	
	if(e.message:findi("what other tasks?")) then
		e.self:Say("I will sew you your own personal dreadful cap if you bring me the necessary components. I will need the pelt of a feared beast, some gold thread, and an imbued amber.");
	end
	
	if(e.message:findi("what hat")) then
		e.self:Say("It is a marvelous cap sewn from the finest textiles and imbued with the divine power of our lord of fear. Cazic Thule!");
	end
end


function event_trade(e)
	local item_lib = require("items");
	-- [FLAG: Manual conversion needed: $itemcount{] if($itemcount{1528} == 1) then
		e.self:Emote("gasps in astonishment");
		e.self:Say("You...you..found my hat!! This is the most I can repay you but perhaps I can reward you further for some [other tasks]?");
		e.other:SummonItem("1530");--black lace sash
		e.other:Faction("143","1");
		e.other:Faction("56","-3");
		e.other:Faction("60","-3");
		e.other:Faction("79","-3");
		e.other:Faction("112","-3");
	
	
	
	elseif(item_lib.check_turn_in(e.trade, {item1 = 19076, item2 = 12096, item3 = 22502})) then--Mighty Bear Paw's Belt Gold Thread and Imbued Amber
		e.self:Say("Well done " .. e.other:GetName() .. ", here is your new hat wear it with pride");--couldnt find the text
		e.other:SummonItem(1529);--Dreadful Cap
	end
	
	
	
	end--END of FILE Zone:paineel  ID:75009 -- Azzar_Habbib

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
