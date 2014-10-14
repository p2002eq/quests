function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	-- You must be flagged by Seta_Bakindo for this quest
	if(qglobals["FindTomer"] == "1") then
		if(e.message:findi("Hail")) then
			e.self:Say("Ahhhgggg.. Those mangy [dogs] put up a tough fight.. If I don't make it back to the [Clan House] soon, it'll all be over for me.");
		elseif(e.message:findi("dogs") or e.message:findi("mutts")) then
			e.self:Say("It's those Darkpaws.. They've beat me pretty badly.. but they'll get theirs soon enough!");
		elseif(e.message:findi("clan house")) then
			e.self:Say("I am a new member of the Silent Fist Clan.. I need someone from my guild to help me find my way back.");
		elseif(e.message:findi("Seta sent me to find you")) then
			e.self:Say("Oh.. Thank goodness you found me.. I'm lost and weak, those [mutts] are a vicious lot.. an you carry my [backpack] for me?");
		elseif(e.message:findi("backpack")) then
			e.self:Say("Thank you, friend.. Now, can you [lead me back to Master Seta] of the Silent Fist Clan? ");
			e.other:SummonItem("20459"); -- Bag of Provisions ID-20456
		elseif(e.message:findi("lead you back")) then
			e.self:Say("Lead the way, and I shall follow. When we make it back, please inform Seta that you have rescued me.");
			-- Initialize flag to Seta_Bakindo for this player
			--eq.target_global("SetaTomer","1", "M30", 2086, charid, zoneid);
			eq.target_global("SetaTomer","2","M30",2086,e.other:CharacterID(),2);
			-- Have Tomer follow this player
			eq.follow(e.other:GetID());
		end
	-- You must have the updated flag from Seta_Bakindo for this part quest
	elseif(qglobals["FindTomer"] == "2") then
		if(e.message:findi("Hail")) then
			e.self:Say("Yes, he saved my life.. I owe him much thanks. Please return my pack to me now, good friend.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(tonumber(qglobals.FindTomer) == 2 and item_lib.check_turn_in(e.trade, {item1 = 20459})) then --Tomer's Bag of Provisious
		e.self:Say("Oh, you have the makings of a true hero.. The Silent Fist Clan is proud to have you as ally. May your soul guide and protect you through these chaotic times.");
		e.other:Faction(300,1); 	-- Silent Fist Clan faction
		e.other:Faction(12,1); 		-- Ashen Order faction
		e.other:QuestReward(e.self,0,0,0,0,0,100);
		eq.delete_global("FindTomer"); 	-- We are finished with this flag set by Seta_Bakindo
		qglobals["FindTomer"] = nil;
		eq.stop_follow(); -- Release Tomer from following the player... he will walk back to his spawn point
	end
end

-- DEVELOPER: Congdar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
