function event_say(e)
	if (e.message.findi("hail")) then
		e.self:Say("Ah, welcome stranger. Perhaps I could interest you in one of my famous Boysenberry pies, the delight of Sky Shrine.");
		eq.signal(114496, 1, 1); --Ruru
	elseif (e.message.findi("boysenberry pie") then
		e.self:Say("chuckles, 'I thought you might, what say you now Ruru? Who is the better cook between us now?'");
		eq.signal(114496, 4, 1); --Ruru	
end

function event_signal(e)
	if (e.signal == 1) then
		e.self:Say("Why would I admit to such a lie? Everyone loves my pies. I rarely see anyone come in here asking for your Roasted Walrus.");
	elseif (e.signal == 2) then
		e.self:Say("Please ignore my friend Ruru here. He is a bit delusional.");
	elseif (e.signal == 3) then
		e.self:Emote( "laughs, 'I'm sure they'd prefer my Boysenberry pie to your Roasted Walrus with Plum Sauce any day.'");
		eq.signal(114496, 5, 1); -- Ruru
end

function event_trade(e)
	local item_lib = require('items');
	item_lib.return_items(event.self, event.other, event.trade)
end
