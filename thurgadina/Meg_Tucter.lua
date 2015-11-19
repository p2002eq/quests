function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The gems I carry were actually collected by geonids, a race of rock and gem people that communicate with their minds alone. If'n ye haven't had the chance to see one yet I suggest ye journey to the Wakenin' Lands; they've reportedly got a colony somewhere in that area.");
	elseif(e.message:findi("I need a set of Etching Tools")) then
		e.self:Say("Oh, really? There are not many that work in faceting gems. I am surprised to see your interest. You can have this old set of mine. There is no need to return the tools, Talem recently made me a new sturdy set. Brell bless him.");
		e.other:SummonItem(8893);
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
