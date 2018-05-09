function event_timer(e)
	eq.settimer("depop",30*60*1000);
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if tonumber(qglobals.pop_bot_agnarr) == 1 then
		if e.message:findi("hail") then
			e.self:Emote("looks down at " .. e.other:GetName() .. "'s face. He seems so insignificant next to the massive stature of the Rainkeeper. 'Don't worry mortal, Askr is unharmed, I have set him on a journey that will take him to all corners of this reality. He will either find the balance of the Fallen or he will die trying. And what of you champions? Do you wish to [" .. eq.say_link("follow the path of the Fallen") .. "? A more dangerous path has never existed. Defy the will of the Pantheon at your peril.");
		elseif e.message:findi("follow the path of the fallen") then
			e.self:Emote("begins to laugh quietly. You seem to notice a great storm cloud brewing once more above him. A sudden arching bolt hits you, but you are unharmed. Instead a tome written in the language of the gods appears in your hands. 'Then let what I know be yours to know as well. Your path leads you onward $name. The path to power or ruin, the choice is up to you. Speak the words and I will send you on your way.");
			eq.set_global("pop_bot_karana","1",5,"F");
			e.otherMessage(4,"You receive a character flag!");
		end
	end
end

function event_timer(e)
	if e.timer == 1 then
		eq.depop();
	end
end

--End of File  Zone: BoThunder  ID: 209108 --Karana
--Romai