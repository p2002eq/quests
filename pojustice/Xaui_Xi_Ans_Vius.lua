----------------------------------------------------------------------
-- Zone: PoJustice
-- NPC: Xaui_Xi_Ans_Vius (201359)
----------------------------------------------------------------------

function event_say(e)
    if(e.message:findi("hail")) then 
        e.self:Emote("raises a bloodshot eye to meet your gaze. 'Lumanes, Mikimaru. Xua aus xeturisun xean [" .. eq.say_link("lytaer") .. "]. Xiall ial di xeun. . . ");
    elseif(e.message:findi("lytaer")) then 
		e.self:Say("Xean lytaer isu sa xaui. . . xaui ans Tetorau Xi Atraeth, t'xys ri temariel xenun. Xua aus xeturisun xean lytaer, xua aus xeturisun Ishinae. Xua ial teka - tekaim ri xiall. Tekaim t'attaumis. Vyanemis, Mikimaru. Vyanemis. . .");
	end
end

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end