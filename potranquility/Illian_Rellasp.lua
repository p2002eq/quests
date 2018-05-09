--Illian_Rellasp (203365)
--potranquility
--Paladin Spell: Force of Akera (LoY era quest) **Disabled on P2002


function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ". Come to enjoy the soothing serenity of this place? The quiet waters remind me of the docks in Erudin when I was a child. It is unfortunate that the tranquility of Quellious does not extend further into the world of Norrath. Every Deepwater Knight yearns for the eternal calm of paradise after a life of faithful service to the gods.");	 --Omitted remaining line text since quest not in era:  "Perhaps you have heard of one such knight that achieved transcendence. His name was [Inte Akera] and he is one of the greatest Deepwater Knights to ever live.");
	
	--Omitted responses since quest not live
	-- elseif(e.message:findi("Inte Akera") then
		-- e.self:Say("Inte was the first paladin of the Deepwater order to be called to the planes as a servant to the greater gods. While the power of tranquility is fairly well known among the holy orders of paladins in Norrath, few were able to harness the calming power of the ocean into a weapon of order. Inte was one of those holy knights. I can teach this little known magic to you, but I will need a few [things] first.");
	-- elseif(e.message:findi("things") then
		-- e.self:Say("The words of Quellious were the foundation of Inte's magic, I'll need a copy of Quellious' Words of Tranquility. I'll also need the scales of a seahorse blessed by Prexus, the ocean lord, in order to harness the power of the sea. Bring me these things and I will teach you the Power of Inte Akera.");
	end
end
  

function event_trade(e)
	local item_lib = require("items");
  	-- if (item_lib.check_turn_in(e.self, e.trade, {item1 = 7687, item2 = 12999})) then	--Spell: Words of Tranquility, Seahorse Scales
		-- e.self:Emote("takes the scales and the scroll from you. He takes the scales and grinds them with a mortar and pestle into a fine powder. He begins to speak holy words out over the water and allows the powder to fall into the water. The water begins to glow and bubble. Illian takes the scroll and dips one edge into the water. The water then races up across he parchment and forms into holy runes of Prexus. As the seas calm, Illian turns to you and hands you the scroll. 'May the power of the Prexus guard your journeys, " .. e.other:GetName() .. ".'");
		-- e.other:QuestReward(e.other,0,0,0,0,1118,10000);	--Spell: Force of Akera
	-- end
	item_lib.return_items(e.self, e.other, e.trade)
end
