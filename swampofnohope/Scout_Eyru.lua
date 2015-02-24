function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you, but I do not have time to speak. I am waiting on official word from Shar Vahl. If you have been sent to assist me, please show me the Official Seal of the Khati Sha at this time. If you are not such a person, please carry on with your business and leave me to tend to mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9031})) then
		e.self:Say("It is a relief to see you. I was beginning to fear that no one would be able to find me in this miserable swamp. I wanted to get word back to Shar Vahl about my location, but I was afraid that I would lose the trail off this spirit if I were to break off my pursuit. This location is as strange of a destination for our spirit as it is dangerous. I have seen the spirit several times and it is very out of place here. I can't help but think that the transformation has left the spirit confused beyond all repair.");
		e.self:Say("If you move towards the large body of water just north of here, you should be able to find a vantage point that will allow you to see it. The spirit has been resting under the surface of the water there for several days now. Once you release the spirit, please return to me with the totem that binds it. I will prepare the totem, so that you may return it to Shar Vahl.");
		e.self:Emote("A giant reptile roars, as it sinks below the surface of the pond. It appears that is senses your approach.");
		eq.spawn2(83244,0,0,2289,-3001,-28,0);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 9042})) then
		e.self:Say("Splendid job, " .. e.other:GetName() .. ". This wrapping should help to shield you from any of the negative properties that may be manifested in the totem. You should be fine if you keep it in the box that you were given. Once you collect all of the totems, please seal the box and return it to Shar Vahl. Be careful to protect the totems during the course of your travels. The balance of power in several realms is reliant on your ability to fulfill this mission. Please do not fail us.");
		e.other:SummonItem(9043);
		e.other:QuestReward(e.self,0,0,0,0,9031);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
