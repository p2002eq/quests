function event_say(e)
	if (e.other:GetFaction(e.self) <= 2) then -- Warmly or lower
		if (e.message:findi("hail")) then
			e.self:Say("Greetings ally of the Claws of Veeshan! Allow me to introduce myself. I am Evreth Menesez of the Draconic Loyalist Fellowship, scholar and researcher of draconic arcane knowledge and practitioner of magery. I am currently researching the whereabouts of an [ancient dragon tome] that my contain lost arcane knowledge that could prove useful to the Claws of Veeshan, particularly the dragons and dragon-kin of Skyshrine");
		elseif(e.message:findi("ancient dragon tome")) then
			e.self:Say("The dragon sorcerer, Xervolithax, according to dragon lore, had penned a tome of arcane knowledge that he guarded with his life. It is told that Xervolithax fell to the Kromzek centuries ago in the Great Divide in a great battle. The only surviving apprentice of Xervolithax that survived the fateful incident recovered the tome from the fallen dragon sorcerer and divided it into [sections], which he then hid for fear of the tome falling into the hands of the Kromzek magic-users.");
		elseif(e.message:findi("sections")) then
			e.self:Say("It is my belief from the information I have gathered thus far, that sections of the tome have been scattered into four sections that were hidden across Velious. The pages of the tome are a thick durable parchment, possibly magically preserved, and the ancient dragon script was penned in the blood of the author. Here is a binding that can be used to store the sections of the tome should you come across them in your explorations. If you find all the sections of the tome return the complete tome to me and I will reward you for your assistance with treasures from the Skyshrine coffers.");
			e.other:SummonItem(17166); --Empty Dragon Tome Binding
		end
	end
end

function event_trade(e)
	local item_lib = require('items');

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12550})) then
		e.self:Say("By Veeshans claws, you've found it! You have done a great service for the residents of Skyshrine, $name! I will make sure that news of your accomplishment reaches the nobles of Skyshrine. Here is the reward that has been promised for your assistance.");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 12558, 1250 ); -- Orb of Draconic Energy
		e.other:Faction(42, 30); --CoV
		e.other:Faction(362, 30); --Yelinak
		e.other:Faction(189, -30); --Kromzek 
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
