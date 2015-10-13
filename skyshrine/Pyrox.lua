function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler. I'm the keeper of possessions for the Skyshrine. Any friend of the shrine can safely store their belongings with me.");
	end
end

function event_trade(e)	
    item_lib.return_items(e.self, e.other, e.trade);
end

function event_signal(e)
	if (e.signal == 66) then --Sleeper released
		e.self:Shout("BEWARE! BEWARE! The Sleeper has been awakened! He means death for all who remain here! Time is short, flee the Skyshrine now if you value your life!");
