function event_signal(e)
	e.self:Say("At least now we know. You have gone to such lengths, please take this, it was my gift from the city upon obtaining full Khala Dun honors. You have earned it my friend.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, hello there " .. e.other:GetName() .. ". Thank you for stopping by, but this is just not a very good time for visitors. My daughter is very upset over what has [happened].");
	elseif(e.message:findi("happened")) then
		e.self:Say("Oh my, I thought everyone had heard by now. Behari has gone missing. Been quite some time now, in fact. Even the king had gotten involved in the search for him, but...");
		e.self:Emote("lowers his voice to a whisper so as not to upset his [daughter].");
		e.self:Say("Everyone has about given up hope. [Soroush] was the last we know of that had seen him, but he had very little helpful information.");
	elseif(e.message:findi("soroush")) then
		e.self:Say("Soroush has taken over Behari's duties... temporarily, at least. He can usually be found right in the throne room in case he is needed.");
	elseif(e.message:findi("daughter")) then
		e.self:Emote("looks proudly towards his daughter,");
		e.self:Say("She has [Aisha]'s eyes, that girl does. Having grown up in the palace, I feared she would never find love but this is far worse. She has now found and lost one so dear to her. At her age, I was just training to be a guard and had not a care in the world.");
	elseif(e.message:findi("aisha")) then
		e.self:Emote("stares longingly into space at the sound of Aisha's name,");
		e.self:Say("Ahh, she was my treasure, rest her spirit. From the moment I laid eyes upon her I wanted nothing more than to care for her, shower her with everything her heart desired. I was a very modest man at the time and she wed me all the same. Who would have guessed back then that someday we would live in the [palace] together. Do you know how i came to live in the palace?");
		eq.signal(155082,1,1); -- Kalila_Talih
	elseif(e.message:findi("palace")) then
		e.self:Emote("'s chest swells with pride though his eyes reveal a hint of modest embarrassment at the attention,");
		e.self:Say("Well, I was just barely out of training, still on honor guard duty near the King's chair at the arena. There was a frenzied battle going on between two most skilled combatants. A deft parry sent a warrior's trident sailing through the air. Now I am no hero, instinct just took over- I did what any honorable Vah Shir would do. There was no time to get the King out of harm's way, I just threw myself between he and the weapon. A spot of poor luck had the blade pointing my way and I was fairly well wounded. I spent a few months recovering before returning to duty, but the king has never forgotten and insisted that I and my family reside here in the palace ever since.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5996})) then -- Aisha'a Locket
		e.self:Emote("looks at you stunned,");
		e.self:Say("This is... it was Aisha's, my wedding gift to her. Kalila had given it to Behari and I thought I would never see it again. Where did you find...' Jalil trails off as the truth becomes clear to him. With a sorrowful look at his daughter, he continues, 'at least now we know. You have gone to such lengths, please take this, it was my gift from the city upon obtaining full Khala Dun honors. You have earned it my friend.");
		e.other:QuestReward(e.self,0,0,0,0,5995); -- Belt of the Khala Dun
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		event_emote(e, "Jalil, though relieved that his daughter can still find something to smile about, has the look of a man that might prefer that she found something else to smile about. He says nothing, but grins sheepishly.");
	end
end

function event_emote(e,message)
	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do
			if(player:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 200) then
				player:Message(6,message)
			end
		end
	end
end