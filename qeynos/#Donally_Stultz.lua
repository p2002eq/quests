---- Quest:Investigators Badge (Badge #1)
-- QGlobal Helpers for Badge Quest #1 (qeynos_badge1)
-- 1 = Received Investigator's Briefing
-- 2 = First Suspect
-- 3 = Rileys Confession
-- 4 = Summoned Guard for Riley
-- 5 = Willies Confession
-- 6 = Summoned Guard for Willie
-- 7 = Have the Investigators Badge
-- Failure of the an_investigator section will reset you back to QGlobal 1 so you can restart the escort portion

function event_spawn(e)
	eq.set_timer("depop",1800000);
end

function event_say(e)
	if(e.message:findi("bloodsaber")) then
		e.self:Say("Of course I'm a Bloodsaber, you fool! I've just returned from the Plains of Karana where I was reveling in the glory of the Plaguebringer. Now then, since I see that this foolish investigator is with you, I suppose you want me to sign a confession document or something like that? Well, let's have it then!");
		eq.set_timer("depop",90000);
	end
end

function event_trade(e)
  local item_lib = require("items");
  if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2344})) then  -- Confession Document
    e.self:Emote("crumples the document into a ball, throws it to the ground and spits in your face, yelling, 'You are a fool if you really believe I would sign such a thing. Prepare to die!'");
    eq.attack(e.other:GetName());
	eq.set_timer("depop",300000);
  end
  item_lib.return_items(e.self, e.other, e.trade, e.text)
end

function event_timer(e)
	if(e.timer == "depop") then
		e.self:Say("You aren't bringing me in alive and since I don't feel like dying today, I'm outta here!");
		eq.depop();
	end
end
