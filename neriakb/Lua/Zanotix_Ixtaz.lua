function event_say(e)
	if(e.message:findi("what indigo sabres")) then
		e.self:Say("Indigo sabres are the weapons of choice for true swordsmen. They are constructed of the finest adamantite and can only be crafted in our unique Teir'Dal forge. In order to successfully craft an indigo sabre. you will require a curved blade mold. Neriak nectar. a folded sheet of adamantite. and a mold for the hilt and pommel. If you are a faithful follower of our Lord of Hate then you may be interested in crafting an imbued indigo sabre. You will need to temper the sword with shadow temper instead of Neriak nectar. and will have to forge a sapphire that has been imbued by a cleric into the sword at the time of its creation.");
	end
	
	-- Quest for The Visiting Priestess
	-- Nothing prevents them from doing the plat hand in more than once not sure if it is a problem
	--
	if(e.message:findi("blue flame")) then
		e.self:Emote("gazes at you for many breaths, studying your eyes before looking back at his forge and saying, 'The Blue Flame. This is what allows us to forge our ancestral armor and weapons of adamantite. That and my unmatched skill that is. Many souls were [ritually] sacrificed to spark the flame that now feeds off the constant flow of hatred and envy of the victims . Some call it the Flame of Vengence.' Zanotix stares into the flames, poking at it absently.");
	end
	if(e.message:findi("ritual")) then
		e.self:Say("The Ritual? Well I was young when it took place. I don't really remember. I've had so much on my mind lately, what with all these new taxes. For instance, I need to come up with an extra 75 pieces of platinum just to cover the forge tax. I don't know what I'm going to do.....*cough*.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- 75pp
	-- [FLAG: Manual conversion needed: $platinum] if($platinum == 75) then {
		e.self:Emote("quickly pockets the coins and says, 'Go see the Librarian, Nallar. Tell him Denouncer Ixtaz sent you. Do not return here for at least 3 days, now go, " .. e.other:Race() .. ".");
		e.other:AddEXP(26555);   -- 0.5% @ level 30
	
	-- 1890 - Vial of Noble's Blood
	elseif(item_lib.check_turn_in(e.trade, {item1 = 1890})) then
		e.self:Emote("accepts the vial and looks you over, eyebrow raised. He says, 'Well, a sacrifice to feed my forge. You have done Neriak a great service, Citizen " .. e.other:GetName() .. ". I shall burn it now.' He then holds the vial up the the flames, the blood seems to glow brightly as he stares into it. Then suddenly, with the shout of an arcane phrase, he throws the vial violently into the flame. The force shatters the vial, spilling the blood about the flames. Almost immediately the flames flare up to the ceiling. When they die down a presence is felt within the flames.");
		eq.spawn2(41106, 0, 0, -867, 70, -35,0);   -- 41106 -- vengeful_spirit
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:neriakb  ID:41044 -- Zanotix_Ixtaz

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
