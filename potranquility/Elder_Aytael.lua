--Elder_Aytael (203403)
--Lore Dialogue (Plane of Time)
--potranquility

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	
	if	qglobals.pop_time_maelin ~= nil then	--PoTime flagged
		if e.message:findi("hail") then  	
			e.self:Say("Greetings " .. e.other:GetName() .. ", you look tired. I know your efforts have been exhausting, but your journey has been quite remarkable. I am not sure that we would be this far along, had it not been for your courage. I know that this has been an arduous experience and you must still have many questions. Do you still seek answers about our [" .. eq.say_link("purpose") .. "] here? I am sure that we can trust you now.")
		elseif e.message:findi("purpose") then
			e.self:Say("If you have not gathered as much from your work thus far, we seek to find Zebuxoruk. As the followers of balance, we seek his insight. He was the first to give mortals a true sense of our real power. The unfathomable concept that a mortal could gain an understanding of the immortal realms was wholly new and beyond the grasp of most. Those that did gain an understanding of Zebuxoruk’s teachings rose in power. Though, [" .. eq.say_link("others") .. "] defied the core principles of balance and drove themselves insane in the process.");
		elseif e.message:findi("others") then	
			e.self:Say("The shissar are an example of what can happen when you stray from the path of balance. Their power-crazed nature led to the misuse of Zebuxoruk’s gift of insight and it drove them mad as a race. Their egotistical nature was a their curse and it attracted the attention of the elder gods. The Sebilisian history is full of stories of such power, both positive and negative. There are many key examples in Kunark’s history that can assist in the understanding of the balance. The knowledge that mortals wield can build [" .. eq.say_link("empires") .. "] or reduce them to ruins.")
		elseif e.message:findi("empires") then	
			e.self:Say("Mortals have followed Zebuxoruk’s path for some time. His teachings helped to alter the path of several empires. The Sebilisians, the Combine, even groups that felt they were working under the divine influence of others gods were following teachings set into the mortal realm by Zebuxoruk. Those that understood his teachings and began to follow him eventually learned of his [" .. eq.say_link("fate") .. "].")
		elseif e.message:findi("fate") then	
			e.self:Say("The enlightenment of mortals was not something that pleased many of the deities within the greater pantheon. Zebuxoruk’s heretical teachings set the power of the pantheon upon him. There are many stories that describe his capture by the elder gods and their punishment. Until recently, we have not been able to completely decipher the truth. That is what we have been working on. Our people have been opening [" .. eq.say_link("portals") .. "] for ages, in the hopes of finding more information about Zebuxoruk’s fate.");
		elseif e.message:findi("portals") then	
			e.self:Say("The first portals into the realms of the gods were opened by our kind. The knowledge of these portals eventually made its way to other mortals. Naturally, curiosity and lust for power drove other mortals in to the Planes. The defilement of these sacred territories led the pantheon to feel even more justified in their persecution of Zebuxoruk and his followers. It set the momentum that brought us to this place and time. Now, you have found his location for us. We wait only on your final incursions into the elemental Planes, the true Planes of Power. Then we will move through time to finally find the answers that have been waiting for us for so long.")
		end
	elseif e.message:findi("hail") then
		e.self:Say("I must continue my meditation now.  Please return to me later.  Perhaps I will have something more to tell you after you have proven yourself to be an asset to our cause.  Go speak with some of the other members of our community.  I am sure they will have something for you to do.")
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

