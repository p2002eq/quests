function event_spawn(e)
	eq.set_timer("yay",600000);
	eq.zone_emote(15,"a royal fish changes into a beautiful princess!!");
	e.self:Shout("I am free..");
	e.self:Emote("<glug>'  She motions to you to follow her to shore.'");
end

function event_timer(e)
	if(timer=="yay") then
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am rescued from the hands of the Teir'Dal! I am grateful.  Show me your [proof of allegiance] along with a key to remove these [dark shackles] and I shall reward thee.");
	elseif(e.message:findi("proof of allegiance")) then
		e.self:Say("When I speak of proof of allegiance, I speak of proof you were sent by one of the [Silent Watch].");
	elseif(e.message:findi("dark shackles")) then
		e.self:Say("My Teir'Dal captors have placed magical shackles upon me.  The shackles prevent me from using my magic to transport myself home nor do they allow me to venture far from Lake Rathetear.  I will require special shackle keys from Highkeep.");
	elseif(e.message:findi("silent watch")) then
		e.self:Say("The Silent Watch are the Royal Family's guardians. If you run into one, maybe he'll teach you a lesson or two!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20008, item2 = 13108})) then
		e.self:Say("You have saved me!!  " .. e.other:GetName() .. ", you are my hero!!  Take my amulet and the royal suite key to Tearon in Highkeep.  Help put his soul at ease and he shall reward you.  Now I must go.. I am sorry I cannot transport you as well, but my powers are weak from much swimming.  Farewell, brave soul!");
		e.other:SummonItem(13109);
		e.other:Faction( 8, 10);
		e.other:Faction( 43, 10);
		e.other:Faction( 178, 10);
		e.other:AddEXP(500);
		e.other:Ding();
		eq.depop();
	else
		e.self:Say("I will require both the shackle key for the [dark shackles] and some [proof of allegiance].");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
