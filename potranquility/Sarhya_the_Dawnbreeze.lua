--Sarhya_the_Dawnbreeze (203383)
--potranquility

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if (e.message:findi("hail")) then
		e.self:Say("Well met. I am keeper of the Portal to the [" .. eq.say_link("Plane of Air") .. "].");
	elseif (e.message:findi("plane of air") and (qglobals.pop_elemental_grand_librarian ~= nil)) then
		e.self:Say("Xegony has created four avatars, each one embodies a different aspect of her power, and each of these avatars was created with a portion of her very essence. The story goes, the one who possesses each of these essences may create a key to break Xegony's ward and enter into her inner sanctum. I don't know the truth behind this, as I have neither the power, nor the desire to challenge the Avatars myself. I have fashioned this, which I believe will form the four essences into a key.");
		e.other:SummonItem(17888);	--Pouch of Swirling Winds
	elseif (e.message:findi("plane of air")) then
		e.self:Say("The Elemental Planes are not for idle exploration. Return to me when you have a reason to enter and I will consider opening the portal for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
