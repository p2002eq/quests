function event_signal(e)
	if (e.signal == 1) then
		e.self:Emote("raises an eyebrow at Horasug.");
		eq.signal(115013,2,11000);
	elseif (e.signal == 2) then
		e.self:Say("Saramor, please remind me to water down the spirits a bit.");
		eq.signal(115010,5,8000);
		eq.signal(115187,5,8000);
	elseif (e.signal == 3) then
		e.self:Say("So I was polishing up the bar the other day when in hops this piece of rope and says, 'I'll take a bottle of Frostreaver's Frozen Vodka.' I look at him and I says, 'We don't serve no ropes here, now beat it!' Hehe. . .");
		eq.signal(115010,6);
		eq.signal(115187,6);
	elseif (e.signal == 4) then
		e.self:Say("Not ten minutes later a piece of rope comes hoppin' in and says the same thing, only this one's tied up in the middle and one end is all messed up. So I says, 'Hey, ain't you the same piece o' rope I just kicked outta here?'");
		eq.signal(115010,7);
		eq.signal(115187,7);
	elseif (e.signal == 5) then	
		e.self:Say("He looks me dead in the eyes and says, 'Nope, I'm afraid not.' <grin>");
		eq.signal(115010,8,8000);
		eq.signal(115187,8,8000);
	elseif (e.signal == 6) then	
		e.self:Say("Hmm, let's see here, aah yes. This is a special bottle handed down to me by my father, and it's been in my family for ages. Not really sure what it's made of, but yer welcome to give it a try.");
		eq.signal(115010,9,8000);
		eq.signal(115187,9,8000);
	elseif (e.signal == 7) then	
		e.self:Emote("watches as Rumagur pours the contents of the bottle into his mouth.");
		eq.signal(115010,10,8000);
		eq.signal(115187,10,8000);
	end
end
