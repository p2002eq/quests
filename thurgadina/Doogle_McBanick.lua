function event_say(e)
	if(e.message:findi("hail")) then	
		e.self:Say("Welcome ta me bar. I suggest ye sit down and have a drink cause if'n ye ai'nt drinkin ye've no business bein 'ere.");
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	if (e.signal == 1) then
		e.self:Say("Hello there Horasug! What brings ya here?");
		eq.signal(115013, 3, 8000); --8000 seconds seems like a long time will have to research this quest.
	elseif (e.signal == 2) then
		e.self:Say("A vision you say? What exactly was this a vision of?");
		eq.signal(115013,4);
	elseif (e.signal == 3) then
		eq.signal(115013,5,7000); --7000 seconds seems long will have to research
	elseif (e.signal == 4) then
		e.self:Say("Well, you came to the right place, Horasug. A few of these ales will fill you with all the visions you can handle.");
	end
end
