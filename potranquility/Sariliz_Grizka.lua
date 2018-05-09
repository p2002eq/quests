--Sariliz_Grizka (203410)
--potranquility

function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("gives a gentle nod in recognition and mutual respect. Her voice then spills forth in an almost whispered hiss. 'Greetings, " .. e.other:GetName() .. ". I would invite you to keep me company while I finish my meal. but I am afraid that I am almost through.  There really is not much here that suits my palate, but Zurmsa is at least kind enough to keep the place stocked with bloodwater for me.  Enjoy your meal.'"); 
	end
end

function event_trade(e)		--standard item return script
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

