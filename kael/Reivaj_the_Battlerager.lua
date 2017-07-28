function event_say(e)

	if (e.other:GetFaction(e.self) == 1) then --must be ally
		if (e.message:findi("hail")) then	
			e.self:Say("Greetings, "..e.other:GetName()..". You tread in the halls of Iceshard manor. Are you here with a [" .. eq.say_link("purpose") .. "] or are you lost?");
		elseif (e.message:findi("purpose")) then	
			e.self:Say("I do not know what purpose you would serve to the Kromrif. If you seek to amass a fortune you have come to the wrong man. I am but a simple [" .. eq.say_link("battlerager") .. "], wielding my blade for the Iceshard brothers when needed.");
		elseif (e.message:findi("battlerager")) then	
			e.self:Say("Yes, I am a warrior who thrives on battle. I have great faith in [" .. eq.say_link("Rallos Zek") .. "] and I call upon his power to make me more efficient in battle. I am not like the foolish berserkers. They howl like animals and create strange totems. They simply unleash their anger upon the world whereas I focus and destroy my foes with the aid of Rallos Zek.");
		elseif (e.message:findi("rallos zek")) then	
			e.self:Say("The great war god guides my blade and has helped shape my day to day life... I feel as if there is something greater mapped out for my life than what I have here.");
		elseif (e.message:findi("plan")) then	
			e.self:Say("I have been planning to travel forth from Kael Drakkel and destroy any Coldain who have spread from their safe home in Thurgadin. It is always a nice trip, I will take several of the elder Kromrif with me as well. Perhaps we will track down the elusive wurm, [" .. eq.say_link("Blizzent") .. "].");
		elseif (e.message:findi("blizzent")) then	
			e.self:Say("Blizzent is an ancient ice wurm Vorken speaks of occasionally. If I remember the story correctly, Blizzent once bit Vorken and Klaggen and has had a desire to have another taste. I have never seen the wurm myself. He may not even be alive still. If I were able to slay Blizzent and retrieve proof of it, I could probably get in good with master Vorken.");
		end
	end

end

function event_trade(e)

	local item_lib = require('items');
	
	if (e.other:GetFaction(e.self) == 1) then
		if (item_lib.check_turn_in(e.self, e.trade, {item1 = 25117})) then
			e.self:Say("Excellent, this will do nicely.  Take this sword for your efforts.");
			e.other:SummonItem(25083);
			e.other:AddEXP(1000);
		end
	end

end
