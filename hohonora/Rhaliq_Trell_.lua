--Rhaliq_Trell_ NPCID 211105
--hail version for villager's trial

function event_spawn(e)
	e.self:Shout("Clever ones you are!");
	eq.set_timer("depop",10*60*1000);	--10 min depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_hoh_trell == nil then
		e.self:Say("Congratulations... Two other trials and you may have proven yourself worthy to stand before Lord Marr.");
		eq.set_global("pop_hoh_trell", "1", 5, "F");
		e.other:Message(4,"You receive a character flag!");
	end
end