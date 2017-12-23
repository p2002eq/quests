function event_spawn(e)
	eq.set_timer("depop", 20 * 60 * 1000) -- 2hr depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("I must thank you for your kind efforts friends. This place has laid claim to me for far too long. Please take care and offer the dark wench my best. I am off... and I suggest you not stray to far from that route yourselves. Please tell me when you are ready to return and may your blades strike true!");
		eq.set_global("pop_pot_newleaf","1",5,"F");
		e.other:Message(4,"You receive a character flag!");
	elseif e.message:findi("ready") then
		local instance_id = eq.get_instance_id(); 
		e.other:Message(4,"Your tormented visions have ended");
		e.other:MovePCInstance(207,instance_id,-16,-49,452);
	end
end


-- End of File  Zone: PoTorment ID: 207066 -- #Tylis_Newleaf
-- Romai
--Converted to .lua by Daeron