-- Monk Epic 1.0
function event_say(e)
	if(e.other:HasItem(1687)) then --Eye of Kaiaren
		if(e.message:findi("yes")) then
			e.self:Say("I assume you have read about us and spoken with the old man, Kaiaren. Since that time, I have grown in power and influence to a point unseen by any mortal. Unfortunately, I will have to demonstrate a small amount of my skill when I destroy you. This is bad. I must decide whether you are worthy to see the techniques I wield, even though you will die shortly thereafter. Tell me, " .. e.other:GetName() .. ", who are you?");
		elseif(e.message:findi("i am the one")) then
			e.self:Emote("chuckles.");
			e.self:Say("Thats quite a boast, " .. e.other:GetName() .. ". All beings strive for nothingness at the most basic level of sentience. However, almost none ever achieve this. Not even I have discarded my ego yet and you stand here and tell me you have? Perhaps you will be a worthy opponent. I shall be waiting in the great lake near here. Take that token as proof of things to come for you. If you still wish to throw your life away so needlessly, return it to my image there. I await your decision.");
			eq.depop_with_timer();
		end
	else
		e.self:Emote("ignores you.");
	end
end

function event_trade(e)
	-- [FLAG: Check target: eq.get_globals()] local qglobals = eq.get_qglobals();
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 1686})) then --Trunt's Head
		if(qglobals["Trunt"] ~= nil and qglobals["Trunt"]=="1") then --Trunt's Head has been turned in to Deep in Lake Rathetear
			e.self:Emote("looks up and down.");
			e.self:Say("Hmmm, I was hoping for something more impressive. This is just a small token of the last person who tried to interfere with my plans. He failed as shall you. But tell me truly, are you the one who has so rudely removed my students?");
			e.other:QuestReward(e.self,0,0,0,0,1687); --Eye of Kaiaren
			eq.delete_global("Trunt");
		else
			e.self:Emote("ignores you.");
			e.other:SummonItem(1686); --Trunt's Head
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
