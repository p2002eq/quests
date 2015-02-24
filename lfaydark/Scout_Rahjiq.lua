function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you. but I do not have time to speak.  I am waiting on official word from Shar Vahl.  If you have been sent to assist me. please show me the Official Seal of the Khati Sha at this time.  If you are not such a person. please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9031})) then
		e.self:Say("Keep your head down, mate! The spirit that you have come for is very close. I have spotted it several times today. It keeps appearing near that odd structure just over the hill. Be careful not to attract the attention of those invisible creatures that roam near the structure. Just release the spirit and return the totem to me. I'll prepare the totem for placement in the container that you were given.");
		e.self:Emote("The air before the large monolith grows solid, as misty tendrils wrap together in the shape of a large wolf.");
		eq.spawn2(57119,0,0,-1675,-337,0,0)
	elseif(item_lib.check_turn_in(e.trade, {item1 = 9034})) then
		e.self:Emote("wraps the totem and returns it with the seal you gave him and says, 'That spirit was very powerful. I'm glad that you were able to release it. Please keep this totem safe until you can return to Shar Vahl. Once you collect all of the totems, seal the box and return it to your master. May the spirits watch over you!'");
		e.other:QuestReward(e.self,0,0,0,0,9031);
		e.other:SummonItem(9035);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:lfaydark  ID:5796 -- Scout_Rahjiq
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------