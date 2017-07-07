function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at you with hollow eye sockets. As he opens his jaw to speak, you are overcome by the foul smell of a thousand rotted corpses. 'What is your desire, master?'");
	elseif(e.message:findi("mortar and pestle")) then
		e.self:Emote("moves with a mixture of creaks and clicks and produces a grotesque looking mortar and pestle set. He places the items in your hands and motions indicating you dismissal. You can feel the vile power of your god moving throughout the material that makes up the two items.");
		e.other:SummonItem(17092); -- Grotesque Mortar and Pestle
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end