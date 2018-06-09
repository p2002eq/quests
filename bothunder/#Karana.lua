--#Karana (209142)
--Spawns upstairs after death of Agnarr the Storm Lord
--bothunder

local counter;

function event_spawn(e)
	counter = 0;
	eq.settimer("depop",20*60*1000);
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") then
		e.self:Emote("looks down at " .. e.other:GetName() .. "'s face. He seems so insignificant next to the massive stature of the Rainkeeper. 'Don't worry mortal, Askr is unharmed, I have set him on a journey that will take him to all corners of this reality. He will either find the balance of the Fallen or he will die trying. And what of you champions? Do you wish to [" .. eq.say_link("follow the path of the Fallen") .. "?] A more dangerous path has never existed. Defy the will of the Pantheon at your peril.");
	elseif e.message:findi("follow the path of the fallen") then
		e.self:Emote("begins to laugh quietly. You seem to notice a great storm cloud brewing once more above him. A sudden arching bolt hits you, but you are unharmed. Instead a tome written in the language of the gods appears in your hands. 'Then let what I know be yours to know as well. Your path leads you onward " .. e.other:GetName() .. ". The path to power or ruin, the choice is up to you. Speak the words and I will send you [" .. eq.say_link("send me on my path", false, "on your way.") .. "]");
		if qglobals.pop_bot_karana == nil and counter < 72 then
			eq.set_global("pop_bot_karana","1",5,"F");
			eq.set_global("pop_bot_agnarr","1",5,"F");
			e.other:Message(15,"You've received a character flag!");
			counter = counter + 1;
		end
	elseif e.message:findi("send me on my path") then
		e.self:CastSpell(797,e.other:GetID());	--GM Gate
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_signal(e)
	if e.signal == 1 then
		e.self:Emote("stirs from his place in the shallow pool and rises up. He appears to grow several feet as he stands to his full height. He turns to Askr and smiles weakly. 'Hello, Askr. How long have I been asleep?");
		eq.signal(209151,1,5*1000);	--#Askr_the_Lost (209151)
	elseif e.signal == 2 then
		e.self:Emote("nods solemnly. 'The fault is not yours Askr. It has been a troubled journey for me, but I have found the clairvoyance that was hidden from me. The past, present, and future are aligned in my mind once more. The power of mortals is growing, and the pantheon will not be able to stop it. Knowledge is the key to true power, and the rifts between the plane of Knowledge and the mortal realms that have been opened by the Fallen have put things in motion that cannot be stopped.");
		eq.signal(209151,2,12*1000);	--#Askr_the_Lost (209151)
	end
end
